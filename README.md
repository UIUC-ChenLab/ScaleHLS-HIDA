# MixPrecHLS Project

MixPrecHLS: A High-Level Synthesis Framework for Mixed-Precision Computing.

It is important to note that MixPrecHLS is made based on ScaleHLS.

## Setting this up

### Prerequisites
- python3
- cmake
- ninja
- clang and lld

Optionally, the following packages are required for the Python binding.
- pybind11
- numpy

### Clone MixPrecHLS
```sh
$ git clone --recursive git@github.com:sheenisme/MixPrecHLS.git mixprechls
$ cd mixprechls
```

### Build MixPrecHLS
Run the following script to build MixPrecHLS. Optionally, add `-p ON` to enable the Python binding and `-j xx` to specify the number of parallel linking jobs.
```sh
$ ./build-mixprechls.sh
```

After the build, we suggest to export the following paths.
```sh
$ export PATH=$PATH:$PWD/build/bin:$PWD/polygeist/build/bin
$ export PYTHONPATH=$PYTHONPATH:$PWD/build/tools/scalehls/python_packages/scalehls_core
```

## Compiling PyTorch Model
Install the pre-built [Torch-MLIR](https://github.com/llvm/torch-mlir) front-end:
```
$ python -m venv mlir_venv
$ source mlir_venv/bin/activate
$ python -m pip install --upgrade pip
$ pip install --pre torch-mlir torchvision -f https://llvm.github.io/torch-mlir/package-index/ --extra-index-url https://download.pytorch.org/whl/nightly/cpu
```

Once Torch-MLIR is installed, you should be able to run the following test:
```sh
$ cd docs/samples/pytorch/resnet18

$ # Parse PyTorch model to LinAlg dialect (with Torch-MLIR mlir_venv activated).
$ python3 resnet18.py > resnet18.mlir

$ # Optimize the model and emit C++ code.
$ scalehls-opt resnet18.mlir \
    -hida-pytorch-pipeline="top-func=forward loop-tile-size=8 loop-unroll-factor=4" \
    | scalehls-translate -scalehls-emit-hlscpp > resnet18.cpp
```

## Repository Layout
The project follows the conventions of typical MLIR-based projects:
- `include/scalehls` and `lib` for C++ MLIR dialects/passes.
- `polygeist` for the C/C++ front-end.
- `docs/samples` for C/C++ and PyTorch examples of ScaleHLS.
- `test` for holding regression tests.
- `tools` for command line tools.
