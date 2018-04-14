# coding: utf-8

import tensorflow as tf

import os
import re
import datetime as dt

import codecs
import glob
import pprint
from collections import Counter
import logging

import matplotlib.pylab as plt
import plotly
import plotly.plotly as pltly
from plotly.graph_objs import *

import pandas as pd
import numpy as np

import openpyxl as px
from pptx import Presentation
from pptx.util import Inches, Pt
import xlrd

import MeCab as mecab
import unicodedata

import urllib.request as request
import bs4

get_ipython().run_line_magic('matplotlib', 'inline')



dir(pd.options.display)
pd.set_option('max_columns', 1000)

np.set_printoptions(
    precision=None, 
    threshold=10, 
    edgeitems=None, 
    linewidth=None, 
    suppress=None, 
    nanstr=None, 
    infstr=None, 
    formatter=None
)

### Flatten ###
def flatten(l):
    l = [inner for outer in l for inner in outer]
    # l = sum(l, [])
    return l

def flatten(nested_list):
    #https://www.lifewithpython.com/2014/01/python-flatten-nested-lists.html
    """深さ優先探索の要領で入れ子のリストをフラットにする関数"""
    # フラットなリストとフリンジを用意
    flat_list = []
    fringe = [nested_list]
    
    while len(fringe) > 0:
        node = fringe.pop(0)
        # ノードがリストであれば子要素をフリンジに追加
        # リストでなければそのままフラットリストに追加
        if isinstance(node, list):
            fringe = node + fringe
        else:
            flat_list.append(node)
        
    return flat_list

### Current time ###
def now():
    import datetime as dt
    now = dt.datetime.now()
    #now = now.strftime('%Y-%m-%d %H:%M:%S.%f')
    print(now)
    return now

def check_dir(dirname):
    from tensorflow import gfile
    import os
    if dirname[-1]!='/':
        dirname = dirname + '/'
    if os.path.exists(dirname)==False:
        print('Exist no '+dirname)
    path_files = gfile.Glob(dirname+'*')
    print('PATH: ', dirname)
    for path_file in path_files:
        with open(path_file) as f:
            size = len(f.read())
        file = path_file.split('/')
        file = file[-1]
        print(file, size)
        
        
####### Check installed packages #######
def pkg_resource(ver=False, dirname='./', filename='requirements.txt'):
    import pkg_resources
    with open(dirname+filename, 'w') as f:
        for dist in pkg_resources.working_set:
            pkg = dist.project_name
            if ver==True:
                suffix = ' '+dist.version
            else:
                suffix = ''
            pkg = pkg+suffix+'\n'
            f.write(pkg)

def tfrun(x, feed_dict=None):
    import tensorflow as tf
    with tf.Session() as sess:
        init = tf.global_variables_initializer()
        sess.run(init)

        if feed_dict==None:
            x = sess.run(x)
        else:
            x = sess.run(x, feed_dict=feed_dict)
    return x

####### Read csv #######
def readcsv(csvfile, encoding='shift-jis'):
    import csv
    import pandas as pd
    with open(csvfile, encoding=encoding) as f:
        reader = csv.reader(f)
        ds = list(reader)
        ds = pd.DataFrame(ds[1:], columns=ds[0])
    return ds

####### yyyymmdd #######
def yyyymmdd(time):
    import datetime as dt
    year = time.year
    month = time.month
    day = time.day
    return year*10000+month*100+day

####### Data Type from String Type #######            
def str2time(time):
    import datetime as dt
    try:
        time = dt.datetime.strptime(time, '%Y/%m/%d %H:%M:%S')
    except TypeError:
        time = dt.datetime(1900, 1, 1, 0, 0)
    return time

####### Download #######
def download(url, dirname='./', title=None):
    import re
    import urllib.request as request
    from urllib.error import URLError, HTTPError
    if title==None:
        title = url.split('/')
        title = title[len(title)-1]
    dirname = dirname + '/'
    dirname = re.sub('/*/', '/', dirname)
    try:
        request.urlretrieve(url,"{0}".format(dirname+title))
        print('Save: ' + dirname+title)
    except HTTPError as e:
        print('The server couldn\'t fulfill the request.')
        print('Error code: ', e.code)
    except URLError as e:
        print('We failed to reach a server.')
        print('Reason: ', e.reason)
    

####### Time Series #######    
def timeSeries(start=20160101, end=None, n=None):
    start = str(start)
    start = dt.datetime.strptime(start, '%Y%m%d')

    if end != None:
        end = str(end)
        end = dt.datetime.strptime(end, '%Y%m%d')

        n = end - start
        n = n.days
        
    n = np.arange(0, n, 1)

    def f(x):
        return start + dt.timedelta(days=int(x))

    return pd.Series(list(map(f, n)))


####### Excel #######
def import_excel(inds):
    import pandas as pd
    Book = pd.ExcelFile(inds)
    otds = pd.DataFrame()
    for sheet in Book.sheet_names:
        otds = pd.concat([otds, Book.parse(sheet)], axis=0)
    return otds

####### glob  #######
def search_path(path, suffix='', option='path', remove=''):
    from glob import glob
    
    DIRS = glob(path+'*'+suffix)
    
    if option=='name':
        def f(x):
            x = x.split('/')
            n = len(x)-1
            if x[n]=='':
                x = x[n-1]
            else:
                x = x[n]
            return x
        DIRS = list(map(f, DIRS))
    
    for i in remove:
        f = lambda x: x != i
        DIRS = list(filter(f, DIRS))

    return DIRS

# Describe Statistics
def summary(ds, filename='summary', title='Summary', encoding='utf-8', dir_output='./', save=False):
    import pandas as pd
    print('---' + title + '---')
    describe = ds.describe()
    output = dir_output+filename+'.csv'
    if save==True:
        describe.to_csv(output, encoding=encoding)
        print('SAVE: ', output)
    return pd.DataFrame(describe)

def plot(
    x, y, 
    title=None, label=None, xlabel=None, ylabel=None, 
    figsize=(17.0, 5.0), 
    color=[0.0, 0.5, 0.0], marker='*', linestyle='-', linewidth=0.5, markersize=1.0, 
    rotation=23
):
    import matplotlib.pyplot as plt
    fig = plt.figure(figsize=figsize)
    ax = fig.add_subplot(1,1,1)
    if xlabel==None:
        xlabel = x.name
    if ylabel==None:
        ylabel = y.name
    if title==None:
        title = str(xlabel) + ' x ' + str(ylabel)
    if label==None:
        label = y.name
    ax.set_ylabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.set_title(title)
    ax.set_xticklabels(labels=x, rotation=rotation)
    ax.plot(x, y, color=color, linestyle=linestyle, marker=marker, label=label, linewidth=linewidth, markersize=markersize)
    #plt.xlim(0, 1000)
    #plt.ylim(-15, 20)
    axlegend = ax.legend(loc='upper left', frameon = True, fancybox=True)
    plt.show()

def histogram(x, bins=30, color=[0.8, 0, 0.8], stacked=True, ec='b', xlabel=None, ylabel='count', title=None, xlim=None, save=False, filename=None, dir_output='./'):
    import matplotlib.pylab as plt
    import numpy as np
    x = pd.Series(x)
    plt.hist(x, bins=bins, color=color, stacked=stacked, ec=ec, label=x.name)
    if xlim!=None:
        plt.xlim(xlim)
    x_max = np.max(x)
    x_min = np.min(x)
    mean = np.mean(x)
    std = np.std(x)
    if title == None:
        title = 'Histogram :'+str(x.name)
    if xlabel == None:
        xlabel = str(x.name)
    print('---' + title + '---')
    plt.xlabel(x.name)
    plt.ylabel(ylabel)
    plt.title(title)
    plt.legend()
    plt.figtext(
        1.06, 0.86, 
        "Max: {:5.1f}\n Min: {:5.1f}\n Mean: {:5.2f}\n Std: {:5.2f}".format(
            x_max, x_min, mean, std
        ), 
        ha='right', 
        va='top', 
        fontsize=9, 
        style='italic', 
        bbox={'facecolor':'gray', 'alpha':0.2, 'pad':3}
    )
    if filename==None:
        filename = title
    output = dir_output + filename + '.png'
    if save == True:
        plt.savefig(output)
        print('SAVE: ', output)
    plt.show()

def scatter(x, y, marker='*', c=[0, 0.5, 0.1], xlabel=None, ylabel=None, title=None, alpha=0.5, s=1, save=False, filename=None):
    plt.scatter(x, y, marker=marker, c=c, alpha=alpha, s=s)
    corr = np.corrcoef(x, y)
    corr = corr[0, 1]
    if xlabel == None:
        xlabel = x.name
    if ylabel == None:
        ylabel = y.name
    if title == None:
        title = 'Scatter: '+xlabel+' x '+ylabel
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title(title)
    plt.figtext(
        0.25, 0.85,
        'Cor: {:5.4f}'.format(corr),
        ha='right',
    )
    if filename:
        filename = filename+'.png'
    else:
        filename = title+'.png'
    if save == True:
        plt.savefig(output_dir+filename)
        print('SAVE: '+output_dir+filename)
    plt.show()

def list_n(var, n, s=0):
    import numpy as np
    z = len(str(n))
    n = np.arange(s, s+n, 1)
    def f(x):
        return var+str(x).zfill(z)
    return list(map(f, n))


def ds_split(ds, p=0.8):
    ID = list(ds.index)
    n = int(len(ID) * p)
    ID_train = set(np.random.choice(ID, n))
    ID_test = set(ID) - ID_train

    ID_train = list(ID_train)
    ID_test = list(ID_test)

    ds_train = ds.loc[ID_train]
    ds_test = ds.loc[ID_test]
    
    return ds_train, ds_test
def ds_split(**kwrgs):
    N = len(ds)
    dataset = {}
    index = ds.index
    for key in kwrgs.keys():
        p = kwrgs[key]
        n = int(N * p)
        ids = list(np.random.choice(a=index, size=n, replace=False))
        dataset[key] = ds.loc[ids]
        index = list(set(index) - set(ids))
    return dataset

def merge(left, right, by):
    import pandas as pd
    _left = pd.DataFrame(np.repeat(True, len(left)), index=left.index, columns=['_ok_L'])
    _right = pd.DataFrame(np.repeat(True, len(right)), index=right.index, columns=['_ok_R'])
    ds = pd.merge(
        left=pd.concat([left, _left], axis=1), 
        right=pd.concat([right, _right], axis=1), 
        how='outer', 
        on=by, 
    )
    ds['_ok_L'] = ds['_ok_L'].fillna(False)
    ds['_ok_R'] = ds['_ok_R'].fillna(False)
    return ds

# Confusion Matrix
def confusion_matrix(actual, pred):
    from sklearn import metrics
    import pandas as pd
    import numpy as np
    labels = list(set(actual))
    confusion_matrix = metrics.confusion_matrix(actual, pred, labels=labels)
    accuracy = metrics.accuracy_score(actual, pred)
    precision = metrics.precision_score(actual, pred)
    recall = metrics.recall_score(actual, pred)
    confusion_matrix = pd.DataFrame(confusion_matrix, columns=labels, index=labels)
    total_c = confusion_matrix.sum(axis=1)
    confusion_matrix['total'] = total_c
    total_r = confusion_matrix.sum(axis=0)
    total_r = pd.DataFrame([total_r], index=['total'])
    confusion_matrix = pd.concat([confusion_matrix, total_r], axis=0)
    print('Accuracy: ', accuracy)
    print('Precision: ', precision)
    print('Recall: ', recall)
    return confusion_matrix

# https://github.com/Hironsan/natural-language-preprocessings/blob/master/preprocessings/ja/normalization.py
def normalize(text):
    normalized_text = normalize_unicode(text)
    #normalized_text = normalize_number(normalized_text)
    normalized_text = lower_text(normalized_text)
    return normalized_text


def lower_text(text):
    return text.lower()


def normalize_unicode(text, form='NFKC'):
    normalized_text = unicodedata.normalize(form, text)
    return normalized_text


def lemmatize_term(term, pos=None):
    if pos is None:
        synsets = wordnet.synsets(term)
        if not synsets:
            return term
        pos = synsets[0].pos()
        if pos == wordnet.ADJ_SAT:
            pos = wordnet.ADJ
    return nltk.WordNetLemmatizer().lemmatize(term, pos=pos)


def normalize_number(text):
    """
    pattern = r'\d+'
    replacer = re.compile(pattern)
    result = replacer.sub('0', text)
    """
    # 連続した数字を0で置換
    replaced_text = re.sub(r'\d+', '0', text)
    return replaced_text