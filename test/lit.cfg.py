# -*- Python -*-

import os
import platform
import re
import subprocess
import tempfile

import lit.formats
import lit.util

from lit.llvm import llvm_config
from lit.llvm.subst import ToolSubst
from lit.llvm.subst import FindTool

# Configuration file for the 'lit' test runner.

# name: The name of this test suite.
config.name = "SCALEHLS"

config.test_format = lit.formats.ShTest(not llvm_config.use_lit_shell)

# suffixes: A list of file extensions to treat as test files.
config.suffixes = [".mlir", ".c", ".cpp", ".py"]

# test_source_root: The root path where tests are located.
config.test_source_root = os.path.dirname(__file__)

# test_exec_root: The root path where tests should be run.
config.test_exec_root = os.path.join(config.scalehls_obj_root, "test")

config.substitutions.append(("%PATH%", config.environment["PATH"]))
config.substitutions.append(("%shlibext", config.llvm_shlib_ext))

llvm_config.with_system_environment(["HOME", "INCLUDE", "LIB", "TMP", "TEMP"])

llvm_config.use_default_substitutions()

# excludes: A list of directories to exclude from the testsuite. The 'Inputs'
# subdirectories contain auxiliary inputs for various tests in their parent
# directories.
config.excludes = ["CMakeLists.txt", "README.txt", "lit.cfg.py"]

# test_source_root: The root path where tests are located.
config.test_source_root = os.path.dirname(__file__)

# test_exec_root: The root path where tests should be run.
config.test_exec_root = os.path.join(config.scalehls_obj_root, "test")

# Tweak the PATH to include the tools dir.
llvm_config.with_environment("PATH", config.llvm_tools_dir, append_path=True)
llvm_config.with_environment("PATH", config.polygeist_tools_dir, append_path=True)

# Tweak the PYTHONPATH to include the binary dir.
if config.enable_bindings_python:
    llvm_config.with_environment(
        "PYTHONPATH",
        [os.path.join(config.scalehls_python_packages_dir, "scalehls_core")],
        append_path=True,
    )

tool_dirs = [
    config.scalehls_tools_dir,
    config.polygeist_tools_dir,
    config.mlir_tools_dir,
    config.llvm_tools_dir,
]
tools = ["pyscalehls.py", "scalehls-opt", "scalehls-translate", "cgeist"]

# The following tools are optional
tools.extend([ToolSubst("%PYTHON", config.python_executable, unresolved="ignore")])

llvm_config.add_tool_substitutions(tools, tool_dirs)

if config.enable_bindings_python:
    config.available_features.add("bindings_python")
