//===------------------------------------------------------------*- C++ -*-===//
//
//===----------------------------------------------------------------------===//

#ifndef SCALEHLS_TRANSFORMS_PASSES_H
#define SCALEHLS_TRANSFORMS_PASSES_H

#include "mlir/Pass/Pass.h"
#include <memory>

namespace mlir {
class Pass;
} // namespace mlir

namespace mlir {
namespace scalehls {

/// Pragma optimization passes.
std::unique_ptr<Pass> createLoopPipeliningPass();
std::unique_ptr<Pass> createArrayPartitionPass();
std::unique_ptr<Pass> createPragmaDSEPass();

/// Loop optimization passes.
std::unique_ptr<Pass> createAffineLoopPerfectionPass();
std::unique_ptr<Pass> createPartialAffineLoopTilePass();
std::unique_ptr<Pass> createRemoveVarLoopBoundPass();

/// Dataflow optimization passes.
std::unique_ptr<Pass> createSplitFunctionPass();
std::unique_ptr<Pass> createLegalizeDataflowPass();

/// Bufferization passes.
std::unique_ptr<Pass> createHLSKernelBufferizePass();

/// MemRef Optimization Passes.
std::unique_ptr<Pass> createStoreOpForwardPass();
std::unique_ptr<Pass> createSimplifyMemRefAccessPass();

void registerTransformsPasses();

#define GEN_PASS_CLASSES
#include "Transforms/Passes.h.inc"

} // namespace scalehls
} // namespace mlir

#endif // SCALEHLS_TRANSFORMS_PASSES_H
