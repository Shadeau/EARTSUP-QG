class Point {
  float xA, yA;
  FloatList xB;
  FloatList yB;
  FloatList lx;
  FloatList ly;
  float offset;
  float speedOffset;
  boolean animationFinish;
  float circlesize;
  float rayon;
  int iteration;

  Point(float xA_, float yA_, float speed_, float rayon_, int iteration_) {
    rayon = rayon_;
    iteration = iteration_;
    xA = xA_;
    yA = yA_;
    offset = 0.0;
    speedOffset = speed_;
    circlesize = 5;
    xB = new FloatList();
    lx = new FloatList();
    yB = new FloatList();
    ly = new FloatList();
    for(float alpha = 0; alpha < 2*PI; alpha = alpha + 2*PI/iteration){
      xB.append(xA +cos(alpha)*rayon);
      yB.append(yA + sin(alpha)*rayon);
    }
  }

  void animate() {
    if (animationFinish == false) {
     offset += speedOffset;
      offset = constrain(offset, 0.0, 1.0);
     // int timing = 200;
      // float loop = frameCount % timing;
      // float animation = constrain(norm(loop, 0, timing), 0, 1.);
      // println(animation);
      // float offset = norm(sin(animation * 2*PI), -1, 1);
      for(int i=0; i<xB.size();i++){
        lx.append(lerp(xA,xB.get(i),offset));
        ly.append(lerp(yA,yB.get(i),offset));
      }
      if (offset >= 1.0) {
        animationFinish = true;
      }
    } else {
    }
  }

  void drawPoint() {
    noStroke();
    fill(200, 200, 0);
    ellipse(xA, yA, circlesize, circlesize);
  }

  void drawLine() {
    stroke(255,255,0);
    for(int i= 0; i< lx.size();i++){
      line(xA, yA, lx.get(i), ly.get(i));
    }
  }
}