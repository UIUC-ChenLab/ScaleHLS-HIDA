
//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for High-level Synthesis (HLS).
//
//===----------------------------------------------------------------------===//

#include <algorithm>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>
#include <hls_vector.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

using namespace std;

void kernel_correlation(
  ap_int<32> v0,
  ap_int<32> v1,
  double v2,
  double *v3,
  double *v4,
  double *v5,
  double *v6
) {	// L2
  for (int v7 = (int)0; v7 < (int)1200; v7 += (int)1) {	// L18
    *v5[v7] = (double)0.000000;	// L19
    for (int v8 = (int)0; v8 < (int)1400; v8 += (int)1) {	// L20
      double v9 = *v3[v8][v7];	// L21
      double v10 = *v5[v7];	// L22
      double v11 = v10 + v9;	// L23
      *v5[v7] = v11;	// L24
    }
    double v12 = *v5[v7];	// L26
    double v13 = v12 / v2;	// L27
    *v5[v7] = v13;	// L28
    *v6[v7] = (double)0.000000;	// L29
    for (int v14 = (int)1399; v14 < (int)2799; v14 += (int)1) {	// L30
      ap_int<32> v15 = v14;	// L31
      ap_int<32> v16 = v15 + (ap_int<32>)-1399;	// L32
      int v17 = v16;	// L33
      double v18 = *v3[v17][v7];	// L34
      double v19 = *v5[v7];	// L35
      double v20 = v18 - v19;	// L36
      double v21 = v20 * v20;	// L37
      double v22 = *v6[v7];	// L38
      double v23 = v22 + v21;	// L39
      *v6[v7] = v23;	// L40
    }
    double v24 = *v6[v7];	// L42
    double v25 = v24 / v2;	// L43
    *v6[v7] = v25;	// L44
    double v26 = *v6[v7];	// L45
    double v27 = sqrt(v26);	// L46
    *v6[v7] = v27;	// L47
    double v28 = *v6[v7];	// L48
    bool v29 = v28 <= (double)0.100000;	// L49
    double v30;
    if (v29) {	// L50
      v30 = (double)1.000000;	// L51
    } else {
      double v31 = *v6[v7];	// L53
      v30 = v31;	// L54
    }
    *v6[v7] = v30;	// L56
    for (int v32 = (int)2798; v32 < (int)4198; v32 += (int)1) {	// L57
      ap_int<32> v33 = v32;	// L58
      ap_int<32> v34 = v33 + (ap_int<32>)-2798;	// L59
      int v35 = v34;	// L60
      double v36 = *v5[v7];	// L61
      double v37 = *v3[v35][v7];	// L62
      double v38 = v37 - v36;	// L63
      *v3[v35][v7] = v38;	// L64
      double v39 = sqrt(v2);	// L65
      double v40 = *v6[v7];	// L66
      double v41 = v39 * v40;	// L67
      double v42 = *v3[v35][v7];	// L68
      double v43 = v42 / v41;	// L69
      *v3[v35][v7] = v43;	// L70
    }
  }
  for (int v44 = (int)0; v44 < (int)1199; v44 += (int)1) {	// L73
    ap_int<32> v45 = v44;	// L74
    ap_int<32> v46 = v45 + (ap_int<32>)1;	// L75
    int v47 = v46;	// L76
    for (int v48 = v47; v48 < (int)1200; v48 += (int)1) {	// L77
      int v49 = v48 - v47;	// L78
      int v50 = v46;	// L79
      int v51 = v50 + v49;	// L80
      *v4[v44][v51] = (double)0.000000;	// L81
      for (int v52 = (int)0; v52 < (int)1400; v52 += (int)1) {	// L82
        double v53 = *v3[v52][v44];	// L83
        double v54 = *v3[v52][v51];	// L84
        double v55 = v53 * v54;	// L85
        double v56 = *v4[v44][v51];	// L86
        double v57 = v56 + v55;	// L87
        *v4[v44][v51] = v57;	// L88
      }
      double v58 = *v4[v44][v51];	// L90
      *v4[v51][v44] = v58;	// L91
    }
  }
  for (int v59 = (int)0; v59 < (int)1199; v59 += (int)1) {	// L94
    *v4[v59][v59] = (double)1.000000;	// L95
  }
  *v4[1199][1199] = (double)1.000000;	// L97
}

