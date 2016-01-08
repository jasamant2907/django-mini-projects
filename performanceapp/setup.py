#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    Setup file for performanceapp.
"""

import sys
from setuptools import setup


def setup_package():
    setup(name="PerformanceApp", author='Kumar Sabyasachi Padhi',
          author_email='kanha001@gmail.com',
          platforms=['any'],
          install_requires=['Django==1.8.6',
                            'django-tastypie==0.12.2', 'mongoengine==0.10.5'])

if __name__ == "__main__":
    setup_package()
