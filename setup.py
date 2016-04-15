#!/usr/bin/env python
from setuptools import find_packages
from setuptools import setup

setup(name='musicxml2lilypond',
      version='0.9.1',
      author='Hasan Sercan Atli',
      author_email='hsercanatli AT gmail DOT com',
      license='agpl 3.0',
      description='Python package that converts the a makam-musicxml score to '
                  'lilypond',
      url='https://github.com/hsercanatli/makam-musicxml2lilypond',
      packages=find_packages(),
      include_package_data=True,
      )
