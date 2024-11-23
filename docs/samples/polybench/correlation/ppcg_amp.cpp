
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
  float v7[1200];	// L30
  #pragma HLS resource variable=v7 core=ram_t2p_bram

  float v8[1200];	// L31
  #pragma HLS resource variable=v8 core=ram_t2p_bram

  float v9[1400][1200];	// L32
  #pragma HLS resource variable=v9 core=ram_t2p_bram

  float v10[1200][1200];	// L33
  #pragma HLS resource variable=v10 core=ram_t2p_bram

  float v11[1200][1200];	// L34
  #pragma HLS resource variable=v11 core=ram_t2p_bram

  float v12[1200][1200];	// L35
  #pragma HLS resource variable=v12 core=ram_t2p_bram

  for (int v13 = (int)0; v13 < (int)1200; v13 += (int)1) {	// L36
    ap_int<32> v14 = v13;	// L37
    bool v15 = v14 <= (ap_int<32>)599;	// L38
    if (v15) {	// L39
      *v5[v13] = (double)0.000000;	// L40
      for (int v16 = (int)0; v16 < (int)1400; v16 += (int)1) {	// L41
        double v17 = *v3[v16][v13];	// L42
        double v18 = *v5[v13];	// L43
        double v19 = v18 + v17;	// L44
        *v5[v13] = v19;	// L45
      }
      double v20 = *v5[v13];	// L47
      double v21 = v20 / v2;	// L48
      *v5[v13] = v21;	// L49
      *v6[v13] = (double)0.000000;	// L50
      for (int v22 = (int)1399; v22 < (int)2799; v22 += (int)1) {	// L51
        ap_int<32> v23 = v22;	// L52
        ap_int<32> v24 = v23 + (ap_int<32>)-1399;	// L53
        int v25 = v24;	// L54
        double v26 = *v3[v25][v13];	// L55
        double v27 = *v5[v13];	// L56
        double v28 = v26 - v27;	// L57
        double v29 = v28 * v28;	// L58
        double v30 = *v6[v13];	// L59
        double v31 = v30 + v29;	// L60
        *v6[v13] = v31;	// L61
      }
      double v32 = *v6[v13];	// L63
      double v33 = v32 / v2;	// L64
      *v6[v13] = v33;	// L65
      double v34 = *v6[v13];	// L66
      double v35 = sqrt(v34);	// L67
      *v6[v13] = v35;	// L68
      double v36 = *v6[v13];	// L69
      bool v37 = v36 <= (double)0.100000;	// L70
      double v38;
      if (v37) {	// L71
        v38 = (double)1.000000;	// L72
      } else {
        double v39 = *v6[v13];	// L74
        v38 = v39;	// L75
      }
      *v6[v13] = v38;	// L77
    }
    for (int v40 = (int)2798; v40 < (int)3498; v40 += (int)1) {	// L79
      ap_int<32> v41 = v40;	// L80
      ap_int<32> v42 = v41 + (ap_int<32>)-2798;	// L81
      int v43 = v42;	// L82
      double v44 = *v5[v13];	// L83
      double v45 = *v3[v43][v13];	// L84
      double v46 = v45 - v44;	// L85
      *v3[v43][v13] = v46;	// L86
      double v47 = sqrt(v2);	// L87
      double v48 = *v6[v13];	// L88
      double v49 = v47 * v48;	// L89
      double v50 = *v3[v43][v13];	// L90
      double v51 = v50 / v49;	// L91
      *v3[v43][v13] = v51;	// L92
    }
  }
  for (int v52 = (int)0; v52 < (int)1199; v52 += (int)1) {	// L95
    ap_int<32> v53 = v52;	// L96
    ap_int<32> v54 = v53 + (ap_int<32>)1;	// L97
    ap_int<32> v55 = v53 / (ap_int<32>)2;	// L98
    ap_int<32> v56 = v55 + (ap_int<32>)601;	// L99
    int v57 = v56;	// L100
    int v58 = v54;	// L101
    for (int v59 = v58; v59 < v57; v59 += (int)1) {	// L102
      int v60 = v59 - v58;	// L103
      int v61 = v54;	// L104
      int v62 = v61 + v60;	// L105
      *v4[v52][v62] = (double)0.000000;	// L106
      for (int v63 = (int)0; v63 < (int)1400; v63 += (int)1) {	// L107
        double v64 = *v3[v63][v52];	// L108
        double v65 = *v3[v63][v62];	// L109
        double v66 = v64 * v65;	// L110
        double v67 = *v4[v52][v62];	// L111
        double v68 = v67 + v66;	// L112
        *v4[v52][v62] = v68;	// L113
      }
      double v69 = *v4[v52][v62];	// L115
      *v4[v62][v52] = v69;	// L116
    }
  }
  for (int v70 = (int)0; v70 < (int)600; v70 += (int)1) {	// L119
    *v4[v70][v70] = (double)1.000000;	// L120
  }
  for (int v71 = (int)0; v71 < (int)1400; v71 += (int)1) {	// L122
    for (int v72 = (int)0; v72 < (int)1200; v72 += (int)1) {	// L123
      double v73 = *v3[v71][v72];	// L124
      float v74 = v73;	// L125
      v9[v71][v72] = v74;	// L126
    }
  }
  float v75 = (double)0.100000;	// L129
  float v76 = v2;	// L130
  for (int v77 = (int)0; v77 < (int)600; v77 += (int)1) {	// L131
    double v78 = *v5[v77];	// L132
    float v79 = v78;	// L133
    v8[v77] = v79;	// L134
  }
  for (int v80 = (int)0; v80 < (int)600; v80 += (int)1) {	// L136
    double v81 = *v6[v80];	// L137
    float v82 = v81;	// L138
    v7[v80] = v82;	// L139
  }
  for (int v83 = (int)0; v83 < (int)1200; v83 += (int)1) {	// L141
    ap_int<32> v84 = v83;	// L142
    bool v85 = v84 >= (ap_int<32>)600;	// L143
    if (v85) {	// L144
      v8[v83] = (float)0.000000;	// L145
      for (int v86 = (int)0; v86 < (int)1400; v86 += (int)1) {	// L146
        float v87 = v9[v86][v83];	// L147
        float v88 = v8[v83];	// L148
        float v89 = v88 + v87;	// L149
        v8[v83] = v89;	// L150
      }
      float v90 = v8[v83];	// L152
      float v91 = v90 / v76;	// L153
      v8[v83] = v91;	// L154
      v7[v83] = (float)0.000000;	// L155
      for (int v92 = (int)1399; v92 < (int)2799; v92 += (int)1) {	// L156
        ap_int<32> v93 = v92;	// L157
        ap_int<32> v94 = v93 + (ap_int<32>)-1399;	// L158
        int v95 = v94;	// L159
        float v96 = v9[v95][v83];	// L160
        float v97 = v8[v83];	// L161
        float v98 = v96 - v97;	// L162
        float v99 = v98 * v98;	// L163
        float v100 = v7[v83];	// L164
        float v101 = v100 + v99;	// L165
        v7[v83] = v101;	// L166
      }
      float v102 = v7[v83];	// L168
      float v103 = v102 / v76;	// L169
      v7[v83] = v103;	// L170
      float v104 = v7[v83];	// L171
      double v105 = v104;	// L172
      double v106 = sqrt(v105);	// L173
      float v107 = v106;	// L174
      v7[v83] = v107;	// L175
      float v108 = v7[v83];	// L176
      bool v109 = v108 <= v75;	// L177
      float v110 = v109 ? (float)1.000000 : v108;	// L178
      v7[v83] = v110;	// L179
    }
    for (int v111 = (int)3498; v111 < (int)4198; v111 += (int)1) {	// L181
      ap_int<32> v112 = v111;	// L182
      ap_int<32> v113 = v112 + (ap_int<32>)-2798;	// L183
      int v114 = v113;	// L184
      float v115 = v8[v83];	// L185
      float v116 = v9[v114][v83];	// L186
      float v117 = v116 - v115;	// L187
      v9[v114][v83] = v117;	// L188
      double v118 = v76;	// L189
      double v119 = sqrt(v118);	// L190
      float v120 = v7[v83];	// L191
      double v121 = v120;	// L192
      double v122 = v119 * v121;	// L193
      float v123 = v122;	// L194
      float v124 = v117 / v123;	// L195
      v9[v114][v83] = v124;	// L196
    }
  }
  for (int v125 = (int)0; v125 < (int)1198; v125 += (int)1) {	// L199
    ap_int<32> v126 = v125;	// L200
    ap_int<32> v127 = v126 / (ap_int<32>)2;	// L201
    ap_int<32> v128 = v127 + (ap_int<32>)601;	// L202
    int v129 = v128;	// L203
    for (int v130 = v129; v130 < (int)1200; v130 += (int)1) {	// L204
      int v131 = v130 - v129;	// L205
      int v132 = v128;	// L206
      int v133 = v132 + v131;	// L207
      v11[v125][v133] = (float)0.000000;	// L208
      for (int v134 = (int)0; v134 < (int)1400; v134 += (int)1) {	// L209
        float v135 = v9[v134][v125];	// L210
        float v136 = v9[v134][v133];	// L211
        float v137 = v135 * v136;	// L212
        float v138 = v11[v125][v133];
        float v139 = v138 + v137;	// L2 // L213
        v11[v125][v133] = v139;	// L214
      }
      float v140 = v11[v125][v133];	// L217
      v10[v133][v125] = v140;	// L218
    }
  }
  for (int v141 = (int)600; v141 < (int)1199; v141 += (int)1) {	// L221
    v12[v141][v141] = (float)1.000000;	// L222
  }
  for (int v142 = (int)600; v142 < (int)1200; v142 += (int)1) {	// L224
    float v143 = v7[v142];	// L225
    double v144 = v143;	// L226
    *v6[v142] = v144;	// L227
  }
  for (int v145 = (int)600; v145 < (int)1200; v145 += (int)1) {	// L229
    float v146 = v8[v145];	// L230
    double v147 = v146;	// L231
    *v5[v145] = v147;	// L232
  }
  for (int v148 = (int)700; v148 < (int)1400; v148 += (int)1) {	// L234
    for (int v149 = (int)0; v149 < (int)1200; v149 += (int)1) {	// L235
      float v150 = v9[v148][v149];	// L236
      double v151 = v150;	// L237
      *v3[v148][v149] = v151;	// L238
    }
  }
  for (int v152 = (int)601; v152 < (int)1200; v152 += (int)1) {	// L241
    ap_int<32> v153 = v152;	// L242
    ap_int<32> v154 = v153 * (ap_int<32>)2;	// L243
    ap_int<32> v155 = v154 + (ap_int<32>)-1200;	// L244
    int v156 = v155;	// L245
    for (int v157 = (int)0; v157 < v156; v157 += (int)1) {	// L246
      float v158 = v10[v152][v157];	// L247
      double v159 = v158;	// L248
      *v4[v152][v157] = v159;	// L249
    }
  }
  for (int v160 = (int)0; v160 < (int)1198; v160 += (int)1) {	// L252
    ap_int<32> v161 = v160;	// L253
    ap_int<32> v162 = v161 / (ap_int<32>)2;	// L254
    ap_int<32> v163 = v162 + (ap_int<32>)601;	// L255
    int v164 = v163;	// L256
    for (int v165 = v164; v165 < (int)1200; v165 += (int)1) {	// L257
      int v166 = v165 - v164;	// L258
      int v167 = v163;	// L259
      int v168 = v167 + v166;	// L260
      float v169 = v11[v160][v168];	// L261
      double v170 = v169;	// L262
      *v4[v160][v168] = v170;	// L263
    }
  }
  for (int v171 = (int)600; v171 < (int)1199; v171 += (int)1) {	// L266
    float v172 = v12[v171][v171];	// L267
    double v173 = v172;	// L268
    *v4[v171][v171] = v173;	// L269
  }
  *v4[1199][1199] = (double)1.000000;	// L271
}

