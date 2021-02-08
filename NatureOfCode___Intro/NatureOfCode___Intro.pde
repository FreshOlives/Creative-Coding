import java.util.Random;

Random generator;
//Walker boi;

void setup() {
  size(900,600);
  background(0);
  //boi = new Walker(width/2,height/2);
  generator = new Random();
  loadPixels();
  noiseDetail(1000);
  float xoff = 0.0;
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    
    for (int y = 0; y < height; y++) {
      // A random brightness!
      //float bright = random(255);
      float bright = map(noise(xoff,yoff),0,1,0,255);
      pixels[x+y*width] = color(bright);
      yoff += 0.01;
  }
  xoff += 0.01;
}
updatePixels();
}
/*
void draw() {
  
  boi.update();
  boi.show();
  
}


class Walker {
  float x;
  float y;
  float tx;
  float ty;
  
  Walker(int xPos,int yPos) {
    x = xPos;
    y = yPos;
    tx = 0;
    ty = 10000;
  }
  
  void show() {
    float r = map(noise(tx),0,1,0,255);
    float g = map(noise(ty),0,1,0,255);
    float b = map(noise(ty+5000),0,1,0,255);
    stroke(r,g,b,50);
    strokeWeight(15);
    x = map(noise(tx),0,1,0,width);
    y = map(noise(ty),0,1,0,height);
    point(x,y);
  }
  
  void update() {
    tx+=0.01;
    ty+=0.01;
  }
}
*/
