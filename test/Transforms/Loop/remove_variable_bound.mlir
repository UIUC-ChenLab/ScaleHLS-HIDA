// RUN: scalehls-opt -remove-variable-bound %s | FileCheck %s

#map = affine_map<(d0) -> (d0 + 1)>
#set = affine_set<(d0) : (d0 == 0)>
module  {
  func @test_syrk(%arg0: f32, %arg1: f32, %arg2: memref<16x16xf32>, %arg3: memref<16x16xf32>) {
    affine.for %arg4 = 0 to 16 {
      affine.for %arg5 = 0 to 16 {

        // CHECK: affine.for %arg6 = 0 to 16 {
        affine.for %arg6 = 0 to #map(%arg5) {

          // CHECK: affine.if #set0(%arg5, %arg6) {
          %0 = affine.load %arg3[%arg5, %arg6] : memref<16x16xf32>
          %1 = mulf %arg1, %0 : f32
          affine.if #set(%arg4) {
            affine.store %1, %arg3[%arg5, %arg6] : memref<16x16xf32>
          }
          %2 = affine.load %arg2[%arg5, %arg4] : memref<16x16xf32>
          %3 = affine.load %arg2[%arg6, %arg4] : memref<16x16xf32>
          %4 = affine.load %arg3[%arg5, %arg6] : memref<16x16xf32>
          %5 = mulf %arg0, %2 : f32
          %6 = mulf %5, %3 : f32
          %7 = addf %6, %4 : f32
          affine.store %7, %arg3[%arg5, %arg6] : memref<16x16xf32>
        }
      }
    }
    return
  }
}