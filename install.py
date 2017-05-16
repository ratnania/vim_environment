# coding: utf-8
#! /usr/bin/python

import os

home = os.environ['HOME']

cmd = 'rm -rf ' + home + '/.vim*'
os.system(cmd)

cmd = 'cp .vimrc ' + home + '/.vimrc'
os.system(cmd)

cmd = 'cp -R .vim ' + home + '/.vim'
os.system(cmd)
