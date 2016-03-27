// can't be instantiated
// can't say new Chart()
abstract class Chart {
  
   // public and protected data
   DataLoader loader
   protected StyleFeatures styles;
  
  Chart() {}
  Chart(DataLoader loader, StyleFeatures styles) {
    this.loader = loader;
    this.styles = styles;
  }
  
  abstract void build();
  abstract void edit();
  
  // this will work for all sub classes
void display(){}
  
}