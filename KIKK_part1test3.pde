ArrayList<Point> pointList;

float rayon;
float speed;
float accel;
int iteration;
int nbetapes;

void setup() {
  size(800, 800);
  pointList = new ArrayList<Point>();
  rayon = 180.0;  // longueur des lignes
  speed = 0.01;
  iteration = 9;  // nombre de ligne qui partent de chaque point
  accel = 0.0001;
  nbetapes = 3;     // nombre d'occurence de la fonction (max.5)
  background(0,0);
}

void draw() {
  speed = speed + accel;
  // background(0,0);
  
  int centerx = width/2;
  int centery = height/2;
  
  if(frameCount>60){
    if(nbetapes >=1){
    if(pointList.size() < 1){
    pointList.add(new Point(centerx,centery,speed,rayon,iteration));
    }
    }
  }
  if(nbetapes >= 2){
  if(pointList.size() > 0){
    if(pointList.get(0).animationFinish == true){
      for(float alpha =0; alpha< 2*PI; alpha = alpha +(2*PI/iteration)){
        float targetx1 = centerx+cos(alpha)*rayon;
        float targety1 = centery+sin(alpha)*rayon;
        if(pointList.size() < iteration +1){
          pointList.add(new Point(targetx1,targety1,speed,rayon,iteration));
        }
        if(nbetapes >= 3){
        if(pointList.size()> iteration){
          if(pointList.get(iteration).animationFinish == true){
            for(float beta = 0; beta < 2*PI; beta = beta + (2*PI/iteration)){
              float targetx2 = targetx1 + cos(beta)*rayon;
              float targety2 = targety1 + sin(beta)*rayon;
              if(pointList.size() < iteration + iteration*iteration + 1){
                pointList.add(new Point(targetx2,targety2,speed,rayon,iteration));
              }
              if(nbetapes >= 4){
              if(pointList.size()>iteration + iteration*iteration){
                if(pointList.get(iteration + iteration*iteration).animationFinish == true){ 
                  for(float gamma = 0; gamma < 2*PI; gamma = gamma + (2*PI/iteration)){
                  float targetx3 = targetx2 + cos(gamma)*rayon;
                  float targety3 = targety2 + sin(gamma)*rayon;
                  if(pointList.size() < iteration + iteration*iteration + iteration*iteration*iteration+1){
                  pointList.add(new Point(targetx3,targety3,speed,rayon,iteration));
                  }
                  if(nbetapes >= 5){
                  if (pointList.size() > iteration + iteration*iteration + iteration*iteration*iteration){
                    if(pointList.get(iteration + iteration*iteration + iteration*iteration*iteration).animationFinish == true){
                      for (float delta = 0; delta < 2*PI; delta = delta + (2*PI/iteration)){
                        float targetx4 = targetx3 + cos(delta)*rayon;
                        float targety4 = targety3 + sin(delta)*rayon;
                        if(pointList.size() < iteration + iteration*iteration + iteration*iteration*iteration + iteration*iteration*iteration*iteration +1){
                          pointList.add(new Point(targetx4,targety4,speed,rayon,iteration));
                        }
                      }
                    }
                  }
                  }
                  }
            }
        }
      }
            }
        }
      }
        }
    }
    }
  }
 // saveFrame("frame//###.png");
  }

  for (int i=0; i<pointList.size(); i++) {
    Point p = pointList.get(i);
    if(p.animationFinish == false){
    p.animate();
    p.drawPoint();
    p.drawLine();
    }
 //   if (i > 0) {
   //   Point previous = pointList.get(i-1);
     // if (previous.animationFinish == true) {
     //   p.animate();
   //   }
   // } else {
     // p.animate();
   // }
  }

}