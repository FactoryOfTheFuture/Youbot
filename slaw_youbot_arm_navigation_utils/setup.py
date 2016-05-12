#!/usr/bin/env python

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

d = generate_distutils_setup(packages=['slaw_youbot_arm_navigation_utils'],
                             package_dir={'': 'src'})

setup(**d)
