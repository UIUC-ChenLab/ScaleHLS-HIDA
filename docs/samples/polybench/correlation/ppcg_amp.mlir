module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func private @kernel_correlation(%arg0: i32, %arg1: i32, %arg2: f64, %arg3: memref<?x1200xf64>, %arg4: memref<?x1200xf64>, %arg5: memref<?xf64>, %arg6: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %c1200 = arith.constant 1200 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1199 = arith.constant 1199 : index
    %c600 = arith.constant 600 : index
    %c600_i32 = arith.constant 600 : i32
    %c1198 = arith.constant 1198 : index
    %c1400 = arith.constant 1400 : index
    %c700 = arith.constant 700 : index
    %c601 = arith.constant 601 : index
    %c2798 = arith.constant 2798 : index
    %c-1399_i32 = arith.constant -1399 : i32
    %c2799 = arith.constant 2799 : index
    %c1399 = arith.constant 1399 : index
    %c-2798_i32 = arith.constant -2798 : i32
    %c4198 = arith.constant 4198 : index
    %c3498 = arith.constant 3498 : index
    %c-1200_i32 = arith.constant -1200 : i32
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c601_i32 = arith.constant 601 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %c599_i32 = arith.constant 599 : i32
    %cst_1 = arith.constant 0.000000e+00 : f64
    %cst_2 = arith.constant 1.000000e+00 : f64
    %cst_3 = arith.constant 1.000000e-01 : f64
    %alloca = memref.alloca() : memref<1200xf32>
    %alloca_4 = memref.alloca() : memref<1200xf32>
    %alloca_5 = memref.alloca() : memref<1400x1200xf32>
    %alloca_6 = memref.alloca() : memref<1200x1200xf32>
    %alloca_7 = memref.alloca() : memref<1200x1200xf32>
    %alloca_8 = memref.alloca() : memref<1200x1200xf32>
    scf.for %arg7 = %c0 to %c1200 step %c1 {
      %2 = arith.index_cast %arg7 : index to i32
      %3 = arith.cmpi sle, %2, %c599_i32 : i32
      scf.if %3 {
        memref.store %cst_1, %arg5[%arg7] : memref<?xf64>
        scf.for %arg8 = %c0 to %c1400 step %c1 {
          %13 = memref.load %arg3[%arg8, %arg7] : memref<?x1200xf64>
          %14 = memref.load %arg5[%arg7] : memref<?xf64>
          %15 = arith.addf %14, %13 : f64
          memref.store %15, %arg5[%arg7] : memref<?xf64>
        }
        %4 = memref.load %arg5[%arg7] : memref<?xf64>
        %5 = arith.divf %4, %arg2 : f64
        memref.store %5, %arg5[%arg7] : memref<?xf64>
        memref.store %cst_1, %arg6[%arg7] : memref<?xf64>
        scf.for %arg8 = %c1399 to %c2799 step %c1 {
          %13 = arith.index_cast %arg8 : index to i32
          %14 = arith.addi %13, %c-1399_i32 : i32
          %15 = arith.index_cast %14 : i32 to index
          %16 = memref.load %arg3[%15, %arg7] : memref<?x1200xf64>
          %17 = memref.load %arg5[%arg7] : memref<?xf64>
          %18 = arith.subf %16, %17 : f64
          %19 = arith.mulf %18, %18 : f64
          %20 = memref.load %arg6[%arg7] : memref<?xf64>
          %21 = arith.addf %20, %19 : f64
          memref.store %21, %arg6[%arg7] : memref<?xf64>
        }
        %6 = memref.load %arg6[%arg7] : memref<?xf64>
        %7 = arith.divf %6, %arg2 : f64
        memref.store %7, %arg6[%arg7] : memref<?xf64>
        %8 = memref.load %arg6[%arg7] : memref<?xf64>
        %9 = math.sqrt %8 : f64
        memref.store %9, %arg6[%arg7] : memref<?xf64>
        %10 = memref.load %arg6[%arg7] : memref<?xf64>
        %11 = arith.cmpf ole, %10, %cst_3 : f64
        %12 = scf.if %11 -> (f64) {
          scf.yield %cst_2 : f64
        } else {
          %13 = memref.load %arg6[%arg7] : memref<?xf64>
          scf.yield %13 : f64
        }
        memref.store %12, %arg6[%arg7] : memref<?xf64>
      }
      scf.for %arg8 = %c2798 to %c3498 step %c1 {
        %4 = arith.index_cast %arg8 : index to i32
        %5 = arith.addi %4, %c-2798_i32 : i32
        %6 = arith.index_cast %5 : i32 to index
        %7 = memref.load %arg5[%arg7] : memref<?xf64>
        %8 = memref.load %arg3[%6, %arg7] : memref<?x1200xf64>
        %9 = arith.subf %8, %7 : f64
        memref.store %9, %arg3[%6, %arg7] : memref<?x1200xf64>
        %10 = math.sqrt %arg2 : f64
        %11 = memref.load %arg6[%arg7] : memref<?xf64>
        %12 = arith.mulf %10, %11 : f64
        %13 = memref.load %arg3[%6, %arg7] : memref<?x1200xf64>
        %14 = arith.divf %13, %12 : f64
        memref.store %14, %arg3[%6, %arg7] : memref<?x1200xf64>
      }
    }
    scf.for %arg7 = %c0 to %c1199 step %c1 {
      %2 = arith.index_cast %arg7 : index to i32
      %3 = arith.addi %2, %c1_i32 : i32
      %4 = arith.divsi %2, %c2_i32 : i32
      %5 = arith.addi %4, %c601_i32 : i32
      %6 = arith.index_cast %5 : i32 to index
      %7 = arith.index_cast %3 : i32 to index
      scf.for %arg8 = %7 to %6 step %c1 {
        %8 = arith.subi %arg8, %7 : index
        %9 = arith.index_cast %3 : i32 to index
        %10 = arith.addi %9, %8 : index
        memref.store %cst_1, %arg4[%arg7, %10] : memref<?x1200xf64>
        scf.for %arg9 = %c0 to %c1400 step %c1 {
          %12 = memref.load %arg3[%arg9, %arg7] : memref<?x1200xf64>
          %13 = memref.load %arg3[%arg9, %10] : memref<?x1200xf64>
          %14 = arith.mulf %12, %13 : f64
          %15 = memref.load %arg4[%arg7, %10] : memref<?x1200xf64>
          %16 = arith.addf %15, %14 : f64
          memref.store %16, %arg4[%arg7, %10] : memref<?x1200xf64>
        }
        %11 = memref.load %arg4[%arg7, %10] : memref<?x1200xf64>
        memref.store %11, %arg4[%10, %arg7] : memref<?x1200xf64>
      }
    }
    scf.for %arg7 = %c0 to %c600 step %c1 {
      memref.store %cst_2, %arg4[%arg7, %arg7] : memref<?x1200xf64>
    }
    scf.for %arg7 = %c0 to %c1400 step %c1 {
      scf.for %arg8 = %c0 to %c1200 step %c1 {
        %2 = memref.load %arg3[%arg7, %arg8] : memref<?x1200xf64>
        %3 = arith.truncf %2 : f64 to f32
        memref.store %3, %alloca_5[%arg7, %arg8] : memref<1400x1200xf32>
      }
    }
    %0 = arith.truncf %cst_3 : f64 to f32
    %1 = arith.truncf %arg2 : f64 to f32
    scf.for %arg7 = %c0 to %c600 step %c1 {
      %2 = memref.load %arg5[%arg7] : memref<?xf64>
      %3 = arith.truncf %2 : f64 to f32
      memref.store %3, %alloca_4[%arg7] : memref<1200xf32>
    }
    scf.for %arg7 = %c0 to %c600 step %c1 {
      %2 = memref.load %arg6[%arg7] : memref<?xf64>
      %3 = arith.truncf %2 : f64 to f32
      memref.store %3, %alloca[%arg7] : memref<1200xf32>
    }
    scf.for %arg7 = %c0 to %c1200 step %c1 {
      %2 = arith.index_cast %arg7 : index to i32
      %3 = arith.cmpi sge, %2, %c600_i32 : i32
      scf.if %3 {
        memref.store %cst_0, %alloca_4[%arg7] : memref<1200xf32>
        scf.for %arg8 = %c0 to %c1400 step %c1 {
          %15 = memref.load %alloca_5[%arg8, %arg7] : memref<1400x1200xf32>
          %16 = memref.load %alloca_4[%arg7] : memref<1200xf32>
          %17 = arith.addf %16, %15 : f32
          memref.store %17, %alloca_4[%arg7] : memref<1200xf32>
        }
        %4 = memref.load %alloca_4[%arg7] : memref<1200xf32>
        %5 = arith.divf %4, %1 : f32
        memref.store %5, %alloca_4[%arg7] : memref<1200xf32>
        memref.store %cst_0, %alloca[%arg7] : memref<1200xf32>
        scf.for %arg8 = %c1399 to %c2799 step %c1 {
          %15 = arith.index_cast %arg8 : index to i32
          %16 = arith.addi %15, %c-1399_i32 : i32
          %17 = arith.index_cast %16 : i32 to index
          %18 = memref.load %alloca_5[%17, %arg7] : memref<1400x1200xf32>
          %19 = memref.load %alloca_4[%arg7] : memref<1200xf32>
          %20 = arith.subf %18, %19 : f32
          %21 = arith.mulf %20, %20 : f32
          %22 = memref.load %alloca[%arg7] : memref<1200xf32>
          %23 = arith.addf %22, %21 : f32
          memref.store %23, %alloca[%arg7] : memref<1200xf32>
        }
        %6 = memref.load %alloca[%arg7] : memref<1200xf32>
        %7 = arith.divf %6, %1 : f32
        memref.store %7, %alloca[%arg7] : memref<1200xf32>
        %8 = memref.load %alloca[%arg7] : memref<1200xf32>
        %9 = arith.extf %8 : f32 to f64
        %10 = math.sqrt %9 : f64
        %11 = arith.truncf %10 : f64 to f32
        memref.store %11, %alloca[%arg7] : memref<1200xf32>
        %12 = memref.load %alloca[%arg7] : memref<1200xf32>
        %13 = arith.cmpf ole, %12, %0 : f32
        %14 = arith.select %13, %cst, %12 : f32
        memref.store %14, %alloca[%arg7] : memref<1200xf32>
      }
      scf.for %arg8 = %c3498 to %c4198 step %c1 {
        %4 = arith.index_cast %arg8 : index to i32
        %5 = arith.addi %4, %c-2798_i32 : i32
        %6 = arith.index_cast %5 : i32 to index
        %7 = memref.load %alloca_4[%arg7] : memref<1200xf32>
        %8 = memref.load %alloca_5[%6, %arg7] : memref<1400x1200xf32>
        %9 = arith.subf %8, %7 : f32
        memref.store %9, %alloca_5[%6, %arg7] : memref<1400x1200xf32>
        %10 = arith.extf %1 : f32 to f64
        %11 = math.sqrt %10 : f64
        %12 = memref.load %alloca[%arg7] : memref<1200xf32>
        %13 = arith.extf %12 : f32 to f64
        %14 = arith.mulf %11, %13 : f64
        %15 = arith.truncf %14 : f64 to f32
        %16 = arith.divf %9, %15 : f32
        memref.store %16, %alloca_5[%6, %arg7] : memref<1400x1200xf32>
      }
    }
    scf.for %arg7 = %c0 to %c1198 step %c1 {
      %2 = arith.index_cast %arg7 : index to i32
      %3 = arith.divsi %2, %c2_i32 : i32
      %4 = arith.addi %3, %c601_i32 : i32
      %5 = arith.index_cast %4 : i32 to index
      scf.for %arg8 = %5 to %c1200 step %c1 {
        %6 = arith.subi %arg8, %5 : index
        %7 = arith.index_cast %4 : i32 to index
        %8 = arith.addi %7, %6 : index
        memref.store %cst_0, %alloca_7[%arg7, %8] : memref<1200x1200xf32>
        %9 = scf.for %arg9 = %c0 to %c1400 step %c1 iter_args(%arg10 = %cst_0) -> (f32) {
          %11 = memref.load %alloca_5[%arg9, %arg7] : memref<1400x1200xf32>
          %12 = memref.load %alloca_5[%arg9, %8] : memref<1400x1200xf32>
          %13 = arith.mulf %11, %12 : f32
          %14 = arith.addf %arg10, %13 : f32
          memref.store %14, %alloca_7[%arg7, %8] : memref<1200x1200xf32>
          scf.yield %14 : f32
        }
        %10 = memref.load %alloca_7[%arg7, %8] : memref<1200x1200xf32>
        memref.store %10, %alloca_6[%8, %arg7] : memref<1200x1200xf32>
      }
    }
    scf.for %arg7 = %c600 to %c1199 step %c1 {
      memref.store %cst, %alloca_8[%arg7, %arg7] : memref<1200x1200xf32>
    }
    scf.for %arg7 = %c600 to %c1200 step %c1 {
      %2 = memref.load %alloca[%arg7] : memref<1200xf32>
      %3 = arith.extf %2 : f32 to f64
      memref.store %3, %arg6[%arg7] : memref<?xf64>
    }
    scf.for %arg7 = %c600 to %c1200 step %c1 {
      %2 = memref.load %alloca_4[%arg7] : memref<1200xf32>
      %3 = arith.extf %2 : f32 to f64
      memref.store %3, %arg5[%arg7] : memref<?xf64>
    }
    scf.for %arg7 = %c700 to %c1400 step %c1 {
      scf.for %arg8 = %c0 to %c1200 step %c1 {
        %2 = memref.load %alloca_5[%arg7, %arg8] : memref<1400x1200xf32>
        %3 = arith.extf %2 : f32 to f64
        memref.store %3, %arg3[%arg7, %arg8] : memref<?x1200xf64>
      }
    }
    scf.for %arg7 = %c601 to %c1200 step %c1 {
      %2 = arith.index_cast %arg7 : index to i32
      %3 = arith.muli %2, %c2_i32 : i32
      %4 = arith.addi %3, %c-1200_i32 : i32
      %5 = arith.index_cast %4 : i32 to index
      scf.for %arg8 = %c0 to %5 step %c1 {
        %6 = memref.load %alloca_6[%arg7, %arg8] : memref<1200x1200xf32>
        %7 = arith.extf %6 : f32 to f64
        memref.store %7, %arg4[%arg7, %arg8] : memref<?x1200xf64>
      }
    }
    scf.for %arg7 = %c0 to %c1198 step %c1 {
      %2 = arith.index_cast %arg7 : index to i32
      %3 = arith.divsi %2, %c2_i32 : i32
      %4 = arith.addi %3, %c601_i32 : i32
      %5 = arith.index_cast %4 : i32 to index
      scf.for %arg8 = %5 to %c1200 step %c1 {
        %6 = arith.subi %arg8, %5 : index
        %7 = arith.index_cast %4 : i32 to index
        %8 = arith.addi %7, %6 : index
        %9 = memref.load %alloca_7[%arg7, %8] : memref<1200x1200xf32>
        %10 = arith.extf %9 : f32 to f64
        memref.store %10, %arg4[%arg7, %8] : memref<?x1200xf64>
      }
    }
    scf.for %arg7 = %c600 to %c1199 step %c1 {
      %2 = memref.load %alloca_8[%arg7, %arg7] : memref<1200x1200xf32>
      %3 = arith.extf %2 : f32 to f64
      memref.store %3, %arg4[%arg7, %arg7] : memref<?x1200xf64>
    }
    affine.store %cst_2, %arg4[1199, 1199] : memref<?x1200xf64>
    return
  }
}
