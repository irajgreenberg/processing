class MollerTrumbore {

  MollerTrumbore() {
  }

  boolean rayIntersectsTriangle(PVector rayOrigin, PVector rayVector, Triangle inTriangle, PVector outIntersectionPoint) {
    PVector vertex0 = inTriangle.v0;
    PVector vertex1 = inTriangle.v1;
    PVector vertex2 = inTriangle.v2;
    PVector edge1 = new PVector();
    PVector edge2 = new PVector();
    PVector h = new PVector();
    PVector s = new PVector();
    PVector q = new PVector();
    float a, f, u, v;
    PVector.sub(vertex1, vertex0, edge1);
    PVector.sub(vertex2, vertex0, edge2);
    h.set(rayVector);
    h.cross(edge2);
    a = edge1.dot(h);
    if (a > -EPSILON && a < EPSILON) {
      return false;    // This ray is parallel to this triangle.
    }
    f = 1.0 / a;
    PVector.sub(rayOrigin, vertex0, s);
    u = f * (s.dot(h));
    if (u < 0.0 || u > 1.0) {
      return false;
    }
    q.set(s);
    q.cross(edge1);
    v = f * rayVector.dot(q);
    if (v < 0.0 || u + v > 1.0) {
      return false;
    }
    // At this stage we can compute t to find out where the intersection point is on the line.
    float t = f * edge2.dot(q);
    if (t > EPSILON) // ray intersection
    {
      outIntersectionPoint.set(0.0, 0.0, 0.0);
      //outIntersectionPoint.scaleAdd(t, rayVector, rayOrigin);
      // issue
      outIntersectionPoint.x = rayVector.x*t + rayOrigin.x;
      outIntersectionPoint.y = rayVector.y*t + rayOrigin.y;
      outIntersectionPoint.z = rayVector.z*t + rayOrigin.z;

      return true;
    } else // This means that there is a line intersection but not a ray intersection.
    {
      return false;
    }
  }
}
