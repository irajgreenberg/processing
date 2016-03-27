
 class Dimension{
  float w, h;
  Dimension(){}
  Dimension(float w, float h){
    this.w = w;
    this.h = h;
  }
}

class BarChart extends Chart{
// props in the BarChart
  Dimension dim; // dim.w dim.h
  
  //JSONObject data;
  int bars; // do I want a more general name
  // style features
  // this class doesn't exist yet
  //StyleFeatures styles
  
  //[
  //{key : value}
  //]
  
  BarChart() { }
  BarChart(DataLoader loader, StyleFeatures styles, Dimension dim) {
    super(loader, styles);
    this.dim = dim;
  }
  
  void build() {}
  //void display(){} using super class implementation
  void edit() {}
  
}