int timer;
int nb;
int centerx;
int centery;
int rayon;
int angle;
int circlesize;

void setup(){
  size(800,800,P2D);
  timer =0;
  centerx = width/2;
  centery = height/2;
  rayon = 80;
  angle = 0;
  circlesize = 9;
}

void draw(){
  background(20, 0);
  timer= timer+1;
  fill(200,200,0);
  strokeWeight(2);
  stroke(200,200,0);
  
   if(timer > 60){
      ellipse(centerx,centery,circlesize,circlesize);
   }
   if(timer> 120){
     for(float alpha =0; alpha < 2*PI ; alpha = alpha + (2*PI/5)){      
       //line(centerx,centery, cos(alpha)*rayon + centerx,sin(alpha)*rayon + centery);
       float targetx1 = cos(alpha)*rayon + centerx;
       float targety1 = sin(alpha)*rayon + centery;
       ellipse(targetx1, targety1, circlesize, circlesize); 
       int timing = 100;
       float loop = frameCount % timing;
       float animation = constrain(norm(loop, 0, timing), 0, 1.);
       println(animation);
       float sin = norm(sin(animation * 2*PI), -1, 1);
       float lx1 = lerp(centerx, targetx1, sin);
       float ly1 = lerp(centery, targety1, sin);
       line(centerx,centery,lx1,ly1);
       if(timer > 240){
       for(float beta =0; beta < 2*PI ; beta = beta + (2*PI/5)){ 
         float targetx2 = targetx1 + cos(beta)*rayon;
         float targety2 = targety1 + sin(beta)*rayon;
         //rayon = 120;
        // line(cos(alpha)*rayon + centerx,sin(alpha)*rayon + centery, cos(alpha)*rayon + centerx + cos(beta)*rayon,sin(alpha)*rayon + centery + sin(beta)*rayon);
         ellipse(targetx2, targety2, circlesize, circlesize);
         float lx2 = lerp(targetx1, targetx2, sin);
         float ly2 = lerp(targety1, targety2, sin);
         line(targetx1,targety1,lx2,ly2);
         if(timer > 300){
         for(float gamma =0; gamma < 2*PI ; gamma = gamma + (2*PI/5)){ 
           float targetx3 = targetx2 + cos(gamma)*rayon;
           float targety3 = targety2 + sin(gamma)*rayon;
          // line(cos(alpha)*rayon + centerx + cos(beta)*rayon,sin(alpha)*rayon + centery + sin(beta)*rayon, cos(alpha)*rayon + centerx + cos(beta)*rayon + cos(gamma)*rayon,sin(alpha)*rayon + centery + sin(beta)*rayon + sin(gamma)*rayon);
           ellipse(targetx3, targety3, circlesize, circlesize);
           float lx3 = lerp(targetx2, targetx3, sin);
           float ly3 = lerp(targety2, targety3, sin);
           line(targetx2,targety2,lx3,ly3);
           if(timer > 360){
             timing = 30;
             for(float delta=0; delta < 2*PI; delta = delta +(2*PI/5)){
               float targetx4 = targetx3 + cos(delta)*rayon;
               float targety4 = targety3 + sin(delta)*rayon;
               ellipse(targetx4,targety4,circlesize,circlesize);
               float lx4 = lerp(targetx3,targetx4,sin);
               float ly4 = lerp(targety3,targety4,sin);
               line(targetx3,targety3,lx4,ly4);
             }
             }
         }
         }
         }
       }
     }
   }
}