class Branch {
  PVector node;
  int stemCount;
  float len;
  float totalStemAngle;

  ArrayList<PVector> stems;

  Branch() {
  }

  Branch(PVector node, int stemCount, float len, float totalStemAngle) {
    this.node = node;
    this.stemCount = stemCount;
    this.len = len;
    this.totalStemAngle = totalStemAngle;

    stems = new ArrayList<PVector>();

    // set initial stem point
    float ang = radians(totalStemAngle/(stemCount-1));
    float startAng = -PI/2 + radians(-totalStemAngle/2.0);
    float x = 0.0;
    float y = 0.0;
    for (int i=0; i<stemCount; i++) {
      x = node.x+cos(startAng+ang*(i))*len;
      y = node.y+sin(startAng+ang*(i))*len;
      stems.add(new PVector(x, y));
    }
  }

  void draw() {
    for (int i=0; i<stemCount; i++) {
      line(node.x, node.y, stems.get(i).x, stems.get(i).y);
    }
  }
  
  ArrayList<PVector> getStems(){
    return stems;
  }
}