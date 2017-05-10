
//Création des paramètres de la grille cartésienne
float radiusLine;
float nbRadius;
int nbAngles;


void setup() {
  size(1280, 560, P2D);
  smooth(10);
  //définition des paramètres
  radiusLine = 15 * noise(0.5, 2.5);
  nbRadius = (height/3) / radiusLine;
  nbAngles = int(90 / (radiusLine * 9));
  background(0);
}

void draw() {
  fill(0, 0.2);
  rectMode(CORNER);
  noStroke();
  rect(0, 0, width, height);
  //background(20);
  noFill();
  noStroke();

  for (int i=0; i<nbRadius; i++) {
    float newRadius = radiusLine + radiusLine * i;
    int nbIteration = (i+1) * nbAngles;
    for (int j=0; j<nbIteration; j++) {
      float angle = map(j, 0, nbIteration, 0, TWO_PI) + frameCount * 0.01;
      float theta = map(frameCount % 50, 0, 50, 0, TWO_PI);
      //definition de la position x,y de chaque point
      float x = width/2 + cos(angle) * newRadius;
      float y = height/2 + sin(angle) * newRadius;

      float noise = noise(angle, i*0.1, (angle * i) * 0.001 + frameCount * 0.01);
      noise = noise(sin(angle), theta, frameCount * 0.01 * sin(angle+random(0.7)));
      //rect(x, y, largeur, hauteur);

      float noiseangle = noise * TWO_PI; //3Dimension, l'aleatoire renvoyé est différent pour chaque ligne et différent pour chaque colonne et  est animé par l'ajout de frameCount à chaque boucle
      float endx = x + cos(noiseangle) * (radiusLine/2) * noise;
      float endy = y + sin(noiseangle) *  (radiusLine/2) * noise; 
      float startx = x - cos(noiseangle) * (radiusLine/2) * noise;
      float starty = y - sin(noiseangle) *  (radiusLine/2) * noise; 
      //stroke(255 * noise);
      //line(startx, starty, endx, endy);

      float scale = 1;

      pushMatrix();
      translate(x, y);
      rotate(angle);
      rectMode(CENTER);
      fill(0, 1);
      stroke(random(50,100) * (noise * (random(0.1,10))));
      rect(0, 0, radiusLine*scale, radiusLine*scale);
      popMatrix();
      
           if ( i > (nbRadius / 0.75))
      {
        stroke(200*noise);
      }
    }
  }
  // noLoop();
}

void mousePressed() {
  int lod = (int)random(10);
  float offset = random(1.0);

  noiseDetail(lod, offset);
  // println(lod, offset);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("img_"+year()+""+month()+""+day()+""+hour()+""+minute()+""+second()+""+millis()+".tif");
  }
}