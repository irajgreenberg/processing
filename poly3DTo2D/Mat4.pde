// uber simple Homogeneous 4 x 4 matrix
class Mat4 {
  float[] mat = new float[16];

  Mat4() {
  }

  Mat4(PVector axisX, PVector axisY, PVector axisZ, PVector trans) {
    //    mat[0] = axisX.x;
    //    mat[1] = axisX.y;
    //    mat[2] = axisX.z;
    //    mat[3] = trans.x;
    //
    //    mat[4] = axisY.x;
    //    mat[5] = axisY.y;
    //    mat[6] = axisY.z;
    //    mat[7] = trans.y;
    //
    //    mat[8] = axisZ.x;
    //    mat[9] = axisZ.y;
    //    mat[10] = axisZ.z;
    //    mat[11] = trans.z;

    mat[0] = axisX.x;
    mat[1] = axisY.x;
    mat[2] = axisZ.x;
    mat[3] = trans.x;

    mat[4] = axisX.y;
    mat[5] = axisY.y;
    mat[6] = axisZ.y;
    mat[7] = trans.y;

    mat[8] = axisX.z;
    mat[9] = axisY.z;
    mat[10] = axisZ.z;
    mat[11] = trans.z;

    mat[12] = 0;
    mat[13] = 0;
    mat[14] = 0;
    mat[15] = 1;
  } 

  void inv() {
    float[] inv = new float[16];
    inv[0] = mat[5]  * mat[10] * mat[15] - 
             mat[5]  * mat[11] * mat[14] - 
             mat[9]  * mat[6]  * mat[15] + 
             mat[9]  * mat[7]  * mat[14] +
             mat[13] * mat[6]  * mat[11] - 
             mat[13] * mat[7]  * mat[10];

    inv[4] = -mat[4]  * mat[10] * mat[15] + 
              mat[4]  * mat[11] * mat[14] + 
              mat[8]  * mat[6]  * mat[15] - 
              mat[8]  * mat[7]  * mat[14] - 
              mat[12] * mat[6]  * mat[11] + 
              mat[12] * mat[7]  * mat[10];

    inv[8] = mat[4]  * mat[9] * mat[15] - 
             mat[4]  * mat[11] * mat[13] - 
             mat[8]  * mat[5] * mat[15] + 
             mat[8]  * mat[7] * mat[13] + 
             mat[12] * mat[5] * mat[11] - 
             mat[12] * mat[7] * mat[9];

    inv[12] = -mat[4]  * mat[9] * mat[14] + 
               mat[4]  * mat[10] * mat[13] +
               mat[8]  * mat[5] * mat[14] - 
               mat[8]  * mat[6] * mat[13] - 
               mat[12] * mat[5] * mat[10] + 
               mat[12] * mat[6] * mat[9];

    inv[1] = -mat[1]  * mat[10] * mat[15] + 
              mat[1]  * mat[11] * mat[14] + 
              mat[9]  * mat[2] * mat[15] - 
              mat[9]  * mat[3] * mat[14] - 
              mat[13] * mat[2] * mat[11] + 
              mat[13] * mat[3] * mat[10];

    inv[5] = mat[0]  * mat[10] * mat[15] - 
             mat[0]  * mat[11] * mat[14] - 
             mat[8]  * mat[2] * mat[15] + 
             mat[8]  * mat[3] * mat[14] + 
             mat[12] * mat[2] * mat[11] - 
             mat[12] * mat[3] * mat[10];

    inv[9] = -mat[0]  * mat[9] * mat[15] + 
              mat[0]  * mat[11] * mat[13] + 
              mat[8]  * mat[1] * mat[15] - 
              mat[8]  * mat[3] * mat[13] - 
              mat[12] * mat[1] * mat[11] + 
              mat[12] * mat[3] * mat[9];

    inv[13] = mat[0]  * mat[9] * mat[14] - 
              mat[0]  * mat[10] * mat[13] - 
              mat[8]  * mat[1] * mat[14] + 
              mat[8]  * mat[2] * mat[13] + 
              mat[12] * mat[1] * mat[10] - 
              mat[12] * mat[2] * mat[9];

    inv[2] = mat[1]  * mat[6] * mat[15] - 
             mat[1]  * mat[7] * mat[14] - 
             mat[5]  * mat[2] * mat[15] + 
             mat[5]  * mat[3] * mat[14] + 
             mat[13] * mat[2] * mat[7] - 
             mat[13] * mat[3] * mat[6];

    inv[6] = -mat[0]  * mat[6] * mat[15] + 
              mat[0]  * mat[7] * mat[14] + 
              mat[4]  * mat[2] * mat[15] - 
              mat[4]  * mat[3] * mat[14] - 
              mat[12] * mat[2] * mat[7] + 
              mat[12] * mat[3] * mat[6];

    inv[10] = mat[0]  * mat[5] * mat[15] - 
              mat[0]  * mat[7] * mat[13] - 
              mat[4]  * mat[1] * mat[15] + 
              mat[4]  * mat[3] * mat[13] + 
              mat[12] * mat[1] * mat[7] - 
              mat[12] * mat[3] * mat[5];

    inv[14] = -mat[0]  * mat[5] * mat[14] + 
               mat[0]  * mat[6] * mat[13] + 
               mat[4]  * mat[1] * mat[14] - 
               mat[4]  * mat[2] * mat[13] - 
               mat[12] * mat[1] * mat[6] + 
               mat[12] * mat[2] * mat[5];

    inv[3] = -mat[1] * mat[6] * mat[11] + 
              mat[1] * mat[7] * mat[10] + 
              mat[5] * mat[2] * mat[11] - 
              mat[5] * mat[3] * mat[10] - 
              mat[9] * mat[2] * mat[7] + 
              mat[9] * mat[3] * mat[6];

    inv[7] = mat[0] * mat[6] * mat[11] - 
             mat[0] * mat[7] * mat[10] - 
             mat[4] * mat[2] * mat[11] + 
             mat[4] * mat[3] * mat[10] + 
             mat[8] * mat[2] * mat[7] - 
             mat[8] * mat[3] * mat[6];

    inv[11] = -mat[0] * mat[5] * mat[11] + 
               mat[0] * mat[7] * mat[9] + 
               mat[4] * mat[1] * mat[11] - 
               mat[4] * mat[3] * mat[9] - 
               mat[8] * mat[1] * mat[7] + 
               mat[8] * mat[3] * mat[5];

    inv[15] = mat[0] * mat[5] * mat[10] - 
              mat[0] * mat[6] * mat[9] - 
              mat[4] * mat[1] * mat[10] + 
              mat[4] * mat[2] * mat[9] + 
              mat[8] * mat[1] * mat[6] - 
              mat[8] * mat[2] * mat[5];
              
              mat = inv;
  }

  void mult(PVector[] arr) {
    PVector temp = new PVector();
    for (int i=0; i<arr.length; ++i) {
      temp.x = mat[0]*arr[i].x + mat[1]*arr[i].y + mat[2]*arr[i].z + mat[3]*1;
      temp.y = mat[4]*arr[i].x + mat[5]*arr[i].y + mat[6]*arr[i].z + mat[7]*1;
      temp.z = mat[8]*arr[i].x + mat[9]*arr[i].y + mat[10]*arr[i].z + mat[11]*1;
      arr[i].set(temp);
    }
  }
}