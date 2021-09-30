void syrk_32(float alpha, float beta, float C[32][32], float A[32][32]) {
#pragma scop
  for (int i = 0; i < 32; i++) {
    for (int j = 0; j <= i; j++) {
      C[i][j] *= beta;
      for (int k = 0; k < 32; k++) {
        C[i][j] += alpha * A[i][k] * A[j][k];
      }
    }
  }
#pragma endscop
}