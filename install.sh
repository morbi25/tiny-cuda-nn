#!/bin/bash
pip uninstall tinycudann16 -y
pip uninstall tinycudann32 -y

export TCNN_CUDA_ARCHITECTURES="52;61;75;86;89"
cd bindings/torch
python setup.py install
rm -r build && rm -r dist && rm -r tinycudann32.egg-info
export TCNN_CUDA_ARCHITECTURES="75;86;89"
python setup.py install --half_precision
rm -r build && rm -r dist && rm -r tinycudann16.egg-info