/*
Sphere Plot - 3D OOP
 planets JSON data
 interactive Feedback
 */

JSONArray planetsData;

Planet[] orbs;
PFont font;

IJGSphere s;

void setup() {
  size(700, 700, P3D);
  noStroke();
  ortho();

  font = loadFont("ArialMT-148.vlw");
  // load JSON data
  planetsData =loadJSONArray("planets.json");
  // size arrays
  int dataSize = planetsData.size();
  orbs = new Planet[dataSize];
  //s = new IJGSphere(this, new RGBA(255, 120, 120, 255), "stone.jpg", 180, 16, 16);

  //Color planetColor = new Color(255, 50, 50);

  for (int i=0; i<dataSize; i++) {
    JSONObject planet = planetsData.getJSONObject(i); 
    String planetType = planet.getString("composition");
    //if (planetType.equals("fire")) {
    //  planetColor.rgb = #ff4433;
    //} else if (planetType.equals("stone")) {
    //  planetColor.rgb = #334422;
    //} else if (planetType.equals("ice")) {
    //  planetColor.rgb = #eeeeff;
    //} else if (planetType.equals("water")) {
    //  planetColor.rgb = #3399bb;
    //} else if (planetType.equals("lava")) {
    //  planetColor.rgb = #ff9922;
    //} else if (planetType.equals("gas")) {
    //  planetColor.rgb = #aa55cc;
    //} else if (planetType.equals("metal")) {
    //  planetColor.rgb = #999999;
    //} else if (planetType.equals("salt")) {
    //  planetColor.rgb = #ffffff;
    //}

    orbs[i] = new Planet(this, new PVector(width/2, height/2), planet.getFloat("mass"), i, planet.getString("composition"));
  }
}

void draw() {
  background(25);
  ambientLight(85, 85, 85);
  emissive(30, 0, 0);
  lightSpecular(255, 255, 255);
  pointLight(255, 255, 255, -100, -100, 800);
  pointLight(150, 150, 150, -100, 100, 800);
  specular(255, 255, 255);
  shininess(20);
 // s.display();
  // orb-orb collision
  for (int i=0; i<orbs.length; i++) {
    for (int j=1+1; j<orbs.length; j++) {
      float r2 = orbs[i].radius + orbs[j].radius;
      float d = dist(orbs[i].loc.x, orbs[i].loc.y, orbs[j].loc.x, orbs[j].loc.y);
      if (d < r2) {
        if (d==0) { // avoid dist of 0
          orbs[i].loc.add(new PVector(random(-.1, .1), random(-.1, .1)));
        }
        PVector axis = PVector.sub(orbs[i].loc, orbs[j].loc);
        axis.normalize();
        PVector temp = new PVector();
        temp.set(orbs[i].loc);
        orbs[i].loc.x = orbs[j].loc.x + axis.x*r2;
        orbs[i].loc.y = orbs[j].loc.y + axis.y*r2;
        orbs[j].loc.x = temp.x - axis.x*r2;
        orbs[j].loc.y = temp.y - axis.y*r2;
      }
    }
  }


  for (int i=0; i<orbs.length; i++) {
    //fill(orbs[i].getCol());
    pushMatrix();
    translate(orbs[i].loc.x, orbs[i].loc.y, orbs[i].loc.z);
    //sphere(orbs[i].radius);
    orbs[i].display();
    popMatrix();

    // boundary collison
    if (orbs[i].loc.x > width-orbs[i].radius) {
      orbs[i].loc.x = width-orbs[i].radius;
    } else if (orbs[i].loc.x < orbs[i].radius) {
      orbs[i].loc.x = orbs[i].radius;
    } 

    if (orbs[i].loc.y > height-orbs[i].radius) {
      orbs[i].loc.y = height-orbs[i].radius;
    } else if (orbs[i].loc.y < orbs[i].radius) {
      orbs[i].loc.y = orbs[i].radius;
    }

    // mouse detection
    if (orbs[i].isHit()) {
      // orbs[i].setCol(new RGBA(#ffff00));

      // pushMatrix();
      fill(85);
      textFont(font, 23);
      String s = "  Planet ID:  " + orbs[i].id + "       Composition:  " + orbs[i].composition +"       Mass: " + orbs[i].radius;
      float w = textWidth(s);
      text(s, (width-w)/2, height-7);
      // popMatrix();
    } else {
      noStroke();
      // orbs[i].resetCol();
    }
  }
}