import os

from Cython.Build import cythonize
from setuptools import setup

pyx_files = [pyx for pyx in os.listdir() if pyx.endswith(".pyx") and os.path.isfile(pyx)]

setup(
    ext_modules = cythonize(pyx_files)
)
