//Simple convolution example that uses a 3x3 kernal
// Ira Greenberg, 2016

PImage img;
float[][] kernal33 = new float[3][3];

void setup() {
  size(1200, 400);
  img = loadImage("dallas_skyline.jpg");
  img.resize(600, 400);
  
  // draw unfiltered image on left
  image(img, 0, 0); 
  
  // use arguments 0, 1 2 or 3 to see the different kernals in action.
  createKernals(0);
  convolve(img);
  // draw filtered image on right
  image(img, img.width, 0);
}

void createKernals(int type) {
  switch(type) {
  case 0: // box blur
    kernal33[0][0]=1.0/9; 
    kernal33[0][1]=1.0/9; 
    kernal33[0][2]=1.0/9; 
    kernal33[1][0]=1.0/9;  
    kernal33[1][1]=1.0/9;  
    kernal33[1][2]=1.0/9; 
    kernal33[2][0]=1.0/9;  
    kernal33[2][1]=1.0/9;  
    kernal33[2][2]=1.0/9; 
    break;
  case 1: // Gausian blur
    kernal33[0][0]=1.0/16; 
    kernal33[0][1]=1.0/8; 
    kernal33[0][2]=1.0/16; 
    kernal33[1][0]=1.0/8;  
    kernal33[1][1]=1.0/4;  
    kernal33[1][2]=1.0/8; 
    kernal33[2][0]=1.0/16;  
    kernal33[2][1]=1.0/8;  
    kernal33[2][2]=1.0/16; 
    break;
  case 2: // Edge Detection
    kernal33[0][0]=-1.0; 
    kernal33[0][1]=-1.0; 
    kernal33[0][2]=-1.0; 
    kernal33[1][0]=-1.0;  
    kernal33[1][1]=8;  
    kernal33[1][2]=-1.0; 
    kernal33[2][0]=-1.0;  
    kernal33[2][1]=-1.0;  
    kernal33[2][2]=-1.0; 
    break;
  case 3: // sharpen
    kernal33[0][0]=0.0; 
    kernal33[0][1]=-1.0; 
    kernal33[0][2]=0.0; 
    kernal33[1][0]=-1.0;  
    kernal33[1][1]=5.0;  
    kernal33[1][2]=-1.0; 
    kernal33[2][0]=0.0;  
    kernal33[2][1]=-1.0;  
    kernal33[2][2]=0.0; 
    break;
  }
}


void convolve(PImage img) {
  img.loadPixels();

  // convenience container maps 1d pixels array to 2d color array
  color[][] myImg = new color[img.height][img.width];
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      int k = i*img.width+j;
      myImg[i][j] = img.pixels[k];
    }
  }

  // apply kernal to myImg color array
  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++) {
      // access values in 1d array using nested loop
      int k = i*img.width+j;
      // avoid boundary conditions
      if (i>0 && i<img.height-1 && j>0 && j<img.width-1) {
        float _r = 0;
        float _g = 0;
        float _b = 0;
        _r = red(myImg[i-1][j-1])*kernal33[0][0]+red(myImg[i-1][j])*kernal33[0][1]+red(myImg[i-1][j+1])*kernal33[0][2]+
          red(myImg[i][j-1])*kernal33[1][0]+red(myImg[i][j])*kernal33[1][1]+red(myImg[i][j+1])*kernal33[1][2]+
          red(myImg[i+1][j-1])*kernal33[2][0]+red(myImg[i+1][j])*kernal33[2][1]+red(myImg[i+1][j+1])*kernal33[2][2];

        _g = green(myImg[i-1][j-1])*kernal33[0][0]+green(myImg[i-1][j])*kernal33[0][1]+green(myImg[i-1][j+1])*kernal33[0][2]+
          green(myImg[i][j-1])*kernal33[1][0]+green(myImg[i][j])*kernal33[1][1]+green(myImg[i][j+1])*kernal33[1][2]+
          green(myImg[i+1][j-1])*kernal33[2][0]+green(myImg[i+1][j])*kernal33[2][1]+green(myImg[i+1][j+1])*kernal33[2][2];

        _b =  blue(myImg[i-1][j-1])*kernal33[0][0]+blue(myImg[i-1][j])*kernal33[0][1]+blue(myImg[i-1][j+1])*kernal33[0][2]+
          blue(myImg[i][j-1])*kernal33[1][0]+blue(myImg[i][j])*kernal33[1][1]+blue(myImg[i][j+1])*kernal33[1][2]+
          blue(myImg[i+1][j-1])*kernal33[2][0]+blue(myImg[i+1][j])*kernal33[2][1]+blue(myImg[i+1][j+1])*kernal33[2][2];

        // change pixels in image using filtered myImg color array
        img.pixels[k] = color(_r, _g, _b);
      }
    }
    // update the image pixel data so it can be drawn
    img.updatePixels();
  }
}