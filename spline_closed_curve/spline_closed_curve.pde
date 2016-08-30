float x1 = 100, x2 = 300, x3 = 300, x4 = 100;
float y1 = 100, y2 = 100, y3 = 130, y4 = 130;

size(400, 230);
beginShape();
curveVertex(x3, y3);
curveVertex(x4, y4);

curveVertex(x1, y1);
curveVertex(x2, y2);
curveVertex(x3, y3);
curveVertex(x4, y4);

curveVertex(x1, y1);
curveVertex(x2, y2);
endShape();