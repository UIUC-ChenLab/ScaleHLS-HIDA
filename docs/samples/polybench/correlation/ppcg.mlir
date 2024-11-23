module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func private @kernel_correlation(%arg0: i32, %arg1: i32, %arg2: f64, %arg3: memref<?x1200xf64>, %arg4: memref<?x1200xf64>, %arg5: memref<?xf64>, %arg6: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %c1200 = arith.constant 1200 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1199 = arith.constant 1199 : index
    %c-1399_i32 = arith.constant -1399 : i32
    %c2799 = arith.constant 2799 : index
    %c1399 = arith.constant 1399 : index
    %c-2798_i32 = arith.constant -2798 : i32
    %c4198 = arith.constant 4198 : index
    %c2798 = arith.constant 2798 : index
    %c1400 = arith.constant 1400 : index
    %c1_i32 = arith.constant 1 : i32
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 1.000000e+00 : f64
    %cst_1 = arith.constant 1.000000e-01 : f64
    scf.for %arg7 = %c0 to %c1200 step %c1 {
      memref.store %cst, %arg5[%arg7] : memref<?xf64>
      scf.for %arg8 = %c0 to %c1400 step %c1 {
        %9 = memref.load %arg3[%arg8, %arg7] : memref<?x1200xf64>
        %10 = memref.load %arg5[%arg7] : memref<?xf64>
        %11 = arith.addf %10, %9 : f64
        memref.store %11, %arg5[%arg7] : memref<?xf64>
      }
      %0 = memref.load %arg5[%arg7] : memref<?xf64>
      %1 = arith.divf %0, %arg2 : f64
      memref.store %1, %arg5[%arg7] : memref<?xf64>
      memref.store %cst, %arg6[%arg7] : memref<?xf64>
      scf.for %arg8 = %c1399 to %c2799 step %c1 {
        %9 = arith.index_cast %arg8 : index to i32
        %10 = arith.addi %9, %c-1399_i32 : i32
        %11 = arith.index_cast %10 : i32 to index
        %12 = memref.load %arg3[%11, %arg7] : memref<?x1200xf64>
        %13 = memref.load %arg5[%arg7] : memref<?xf64>
        %14 = arith.subf %12, %13 : f64
        %15 = arith.mulf %14, %14 : f64
        %16 = memref.load %arg6[%arg7] : memref<?xf64>
        %17 = arith.addf %16, %15 : f64
        memref.store %17, %arg6[%arg7] : memref<?xf64>
      }
      %2 = memref.load %arg6[%arg7] : memref<?xf64>
      %3 = arith.divf %2, %arg2 : f64
      memref.store %3, %arg6[%arg7] : memref<?xf64>
      %4 = memref.load %arg6[%arg7] : memref<?xf64>
      %5 = math.sqrt %4 : f64
      memref.store %5, %arg6[%arg7] : memref<?xf64>
      %6 = memref.load %arg6[%arg7] : memref<?xf64>
      %7 = arith.cmpf ole, %6, %cst_1 : f64
      %8 = scf.if %7 -> (f64) {
        scf.yield %cst_0 : f64
      } else {
        %9 = memref.load %arg6[%arg7] : memref<?xf64>
        scf.yield %9 : f64
      }
      memref.store %8, %arg6[%arg7] : memref<?xf64>
      scf.for %arg8 = %c2798 to %c4198 step %c1 {
        %9 = arith.index_cast %arg8 : index to i32
        %10 = arith.addi %9, %c-2798_i32 : i32
        %11 = arith.index_cast %10 : i32 to index
        %12 = memref.load %arg5[%arg7] : memref<?xf64>
        %13 = memref.load %arg3[%11, %arg7] : memref<?x1200xf64>
        %14 = arith.subf %13, %12 : f64
        memref.store %14, %arg3[%11, %arg7] : memref<?x1200xf64>
        %15 = math.sqrt %arg2 : f64
        %16 = memref.load %arg6[%arg7] : memref<?xf64>
        %17 = arith.mulf %15, %16 : f64
        %18 = memref.load %arg3[%11, %arg7] : memref<?x1200xf64>
        %19 = arith.divf %18, %17 : f64
        memref.store %19, %arg3[%11, %arg7] : memref<?x1200xf64>
      }
    }
    scf.for %arg7 = %c0 to %c1199 step %c1 {
      %0 = arith.index_cast %arg7 : index to i32
      %1 = arith.addi %0, %c1_i32 : i32
      %2 = arith.index_cast %1 : i32 to index
      scf.for %arg8 = %2 to %c1200 step %c1 {
        %3 = arith.subi %arg8, %2 : index
        %4 = arith.index_cast %1 : i32 to index
        %5 = arith.addi %4, %3 : index
        memref.store %cst, %arg4[%arg7, %5] : memref<?x1200xf64>
        scf.for %arg9 = %c0 to %c1400 step %c1 {
          %7 = memref.load %arg3[%arg9, %arg7] : memref<?x1200xf64>
          %8 = memref.load %arg3[%arg9, %5] : memref<?x1200xf64>
          %9 = arith.mulf %7, %8 : f64
          %10 = memref.load %arg4[%arg7, %5] : memref<?x1200xf64>
          %11 = arith.addf %10, %9 : f64
          memref.store %11, %arg4[%arg7, %5] : memref<?x1200xf64>
        }
        %6 = memref.load %arg4[%arg7, %5] : memref<?x1200xf64>
        memref.store %6, %arg4[%5, %arg7] : memref<?x1200xf64>
      }
    }
    scf.for %arg7 = %c0 to %c1199 step %c1 {
      memref.store %cst_0, %arg4[%arg7, %arg7] : memref<?x1200xf64>
    }
    affine.store %cst_0, %arg4[1199, 1199] : memref<?x1200xf64>
    return
  }
}
