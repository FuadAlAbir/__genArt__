class hankin
{
  PVector a;
  PVector b;
  PVector v;
  PVector end = null;
  float prevD;
  
  hankin(PVector a_, PVector v_)
  {
    a = a_;
    v = v_;
    b = PVector.add(a, v);
  }
  
  void show()
  {
    stroke(255, 255, 255);
    strokeWeight(4);
    line(a.x, a.y, end.x, end.y);
  }
  
  void findEnd(hankin other)
  {
    float den = (other.v.y * v.x) - (other.v.x * v.y);

    if (den == 0.0) {
      return;
    }
    float numa = (other.v.x * (this.a.y - other.a.y)) - (other.v.y * (this.a.x - other.a.x));
    float numb = (this.v.x * (this.a.y - other.a.y)) - (this.v.y * (this.a.x - other.a.x));
    float ua = numa / den;
    float ub = numb / den;
    float x = this.a.x + (ua * this.v.x);
    float y = this.a.y + (ua * this.v.y);
    
    if (ua > 0 && ub > 0) {
      PVector candidate = new PVector(x, y);
      float d1 = PVector.dist(candidate, this.a);
      float d2 = PVector.dist(candidate, other.a);
      float d = d1 + d2;
      float diff = abs(d1 - d2);
      if (diff < 0.001) {
        if (end == null) {
          end = candidate;
          prevD = d;
        } else if (d < this.prevD) {
          prevD = d;
          end = candidate;
        }
      }
    }
  }
};
