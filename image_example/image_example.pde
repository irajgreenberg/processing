PImage img;



void setup() {
  size(1000, 800);
  img = loadImage("Kai.jpg");
  float newImgW = img.width/2;
  
  // load the image
  image(img, 0, 0, newImgW, img.height/2);
  
  // allocate pixels data
  img.loadPixels();
  //img.pixels; // 1 dimensional array of all the img pixel data
  
  // edit the pixel data
  for( int i=0; i<img.pixels.length; i++){
    float r = red(img.pixels[i]);
    float g = green(img.pixels[i]);
    float b = blue(img.pixels[i]);
    float a = alpha(img.pixels[i]);
    r*=.4;
    img.pixels[i] = color(r, g, b);
  }
  //update the image pixel data
  img.updatePixels();
  // draw the new image
  image(img, newImgW, 0, newImgW, img.height/2);
  
  
}


void draw() {
  // background(255);
}
