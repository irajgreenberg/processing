// may include both concrete and abstract methods
abstract class Hat {
  PVector loc;
  float headRadius;
  color col;
  float price;
  
  Hat(){
     // call fully parameterized cstr
    this(new PVector(), 5.25, color(255, 127, 185), 39.50);
  }
  
  
  Hat(PVector loc, float headRadius){
    // call fully parameterized cstr
    this(loc, headRadius, color(255, 127, 185), 39.50);
  }
  
  
  Hat(PVector loc, float headRadius, color col, float price){
    this.loc = loc;
    this.headRadius = headRadius;
    this.col = col;
    this.price = price;
  }
  
}