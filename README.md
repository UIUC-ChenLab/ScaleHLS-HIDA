# ScaleHLS and HIDA (ScaleHLS 2.0) Project

ScaleHLS is a High-level Synthesis (HLS) framework on [MLIR](https://mlir.llvm.org). ScaleHLS can compile HLS C/C++ or PyTorch model to optimized HLS C/C++ in order to generate high-efficiency RTL design using downstream tools, such as AMD Vitis HLS.

By using the MLIR framework that can be better tuned to particular algorithms at different representation levels, ScaleHLS is more scalable and customizable towards various applications coming with intrinsic structural or functional hierarchies. ScaleHLS represents HLS designs at multiple levels of abstraction and provides an HLS-dedicated analysis and transform library (in both C++ and Python) to solve the optimization problems at the suitable representation levels. Using this library, we've developed a design space exploration engine to generate optimized HLS designs automatically.

Working with a set of neural networks modeled in PyTorch, ScaleHLS-generated hardware designs provide up to 3825x higher performances compared to the baseline designs that do not contain pragma directives and are only optimized by Xilinx Vivado HLS. Furthermore, HIDA (ScaleHLS 2.0) achieves an 8.54x higher throughput on average compared to that of ScaleHLS. Meanwhile, despite being fully automated and able to handle various applications, HIDA achieves a 1.29x higher throughput over [DNNBuilder](https://github.com/IBM/AccDNN),, a state-of-the-art RTL-based neural network accelerator on FPGAs.

For more details, please see our [ScaleHLS (HPCA'22)](https://arxiv.org/abs/2107.11673) and [HIDA (ASPLOS'24)](https://arxiv.org/abs/2311.03379) paper:
```bibtex
@inproceedings{ye2022scalehls,
  title={ScaleHLS: A New Scalable High-Level Synthesis Framework on Multi-Level Intermediate Representation},
  author={Ye, Hanchen and Hao, Cong and Cheng, Jianyi and Jeong, Hyunmin and Huang, Jack and Neuendorffer, Stephen and Chen, Deming},
  booktitle={2022 IEEE International Symposium on High-Performance Computer Architecture (HPCA)},
  year={2022}
}
@inproceedings{ye2024hida,
  title={HIDA: A Hierarchical Dataflow Compiler for High-Level Synthesis},
  author={Ye, Hanchen and Jun, Hyegang and Chen, Deming},
  booktitle={2024 ACM International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS)},
  year={2024}
}
```

## Setting this up

### Prerequisites
- python3
- cmake
- ninja
- clang and lld

Optionally, the following packages are required for the Python binding.
- pybind11
- numpy

### Clone ScaleHLS-HIDA
```sh
$ git clone --recursive git@github.com:UIUC-ChenLab/ScaleHLS-HIDA.git scalehls-hida
$ cd scalehls-hida
```

### Build ScaleHLS-HIDA
Run the following script to build ScaleHLS. Optionally, add `-p ON` to enable the Python binding and `-j xx` to specify the number of parallel linking jobs.
```sh
$ ./build-scalehls.sh
```

After the build, we suggest to export the following paths.
```sh
$ export PATH=$PATH:$PWD/build/bin:$PWD/polygeist/build/bin
$ export PYTHONPATH=$PYTHONPATH:$PWD/build/tools/scalehls/python_packages/scalehls_core
```

## Compiling PyTorch Model
Install the pre-built [Torch-MLIR](https://github.com/llvm/torch-mlir) front-end.
```
$ python -m venv mlir_venv
$ source mlir_venv/bin/activate
$ python -m pip install --upgrade pip
$ pip install --no-deps -r requirements.txt
```

Once Torch-MLIR is installed, you should be able to run the following test. The tile size and unroll factor can be tuned for higher performance. More options can be found [here](https://github.com/UIUC-ChenLab/ScaleHLS-HIDA/blob/f870247fe66d207df5c6bff6a99b74721742aa24/lib/Transforms/Passes.cpp#L74).
```sh
$ cd samples/pytorch/resnet18

$ # Parse PyTorch model to LinAlg dialect (with Torch-MLIR mlir_venv activated).
$ python3 resnet18.py > resnet18.mlir

$ # Optimize the model and emit C++ code.
$ scalehls-opt resnet18.mlir \
    -hida-pytorch-pipeline="top-func=forward loop-tile-size=8 loop-unroll-factor=4" \
    | scalehls-translate -scalehls-emit-hlscpp -emit-vitis-directives > resnet18.cpp
```

## Repository Layout
The project follows the conventions of typical MLIR-based projects:
- `include/scalehls` and `lib` for C++ MLIR dialects/passes.
- `polygeist` for the C/C++ front-end.
- `samples` for C/C++ and PyTorch examples.
- `test` for holding regression tests.
- `tools` for command line tools.
