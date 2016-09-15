//https://people.eecs.berkeley.edu/~ug/slide/pipeline/assignments/as10/ik_notes/ik.html

float segLength = 60; 

void setup() {
}
void draw() {
  background(255);
  translate(width/2, height/2);
  float mx = mouseX-width/2;
  float my = mouseY-height/2;
  float dx = mx - seg1._x; 
  float dy = my - seg1._y; 
  float dist = sqrt(dx * dx + dy * dy);  
  float a = segLength; 
  float b = segLength; 
  float c = min(dist, a + b);  
  float B = acos((b * b - a * a - c * c) / (-2 * a * c)); 
  float C = acos((c * c - a * a - b * b) / (-2 * a * b)); 
  float D = atan2(dy, dx); 
  float E = D + B + PI + C;  

  seg1._rotation = (D + B) * 180 / PI;  
  seg0._x = seg1._x + cos(D + B) * segLength; 
  seg0._y = seg1._y + sin(D + B) * segLength;  
  seg0._rotation = E * 180 / PI;
}