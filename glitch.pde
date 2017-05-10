
PImage img;
String imgFileName = "MyImage";
String fileType = "jpg";
int nbGlitch = 5;


void setup()
{
  background(0);
  img = loadImage(imgFileName+"."+fileType);

  size(1, 1);

  surface.setResizable(true);
  surface.setSize(img.width, img.height);
}


void draw()
{
  background(0);
  for (int y = 0; y < nbGlitch; y++) {
    
  float noise = noise(frameCount * 0.01, y *0.5);
    rect(img.width * random(0.001,1), img.height * random(0.001,1), 50 * random(1,2), 50* random(1,2));
  }
  
  
  
  img.loadPixels();




  img.updatePixels();
  //image(img, 0, 0, img.width, img.height);
}