Ball[] balls;
int n;
int rad;

void setup() {
  size(1600,900);
  background(0);
  n = 50;
  rad = 200;
  balls = new Ball [n];
  for (int i = 0; i < n; i++) {
    int x = int(random(-width/2,width/2));
    int y = int(random(-height/2,height/2));
    balls[i] = new Ball(x,y,rad);
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (Ball ball : balls) {
    ball.update();
    ball.show();
  }
}

class Ball {
  PVector pos;
  PVector dir;
  float vel;
  int r;
  float t;
  float[] col = {0,0,0};
  
  Ball(int x_, int y_, int r_) {
    pos = new PVector(x_,y_);
    dir = new PVector(0,0);
    vel = 0;
    r = r_;
    col[0] = random(255);
    col[1] = random(255);
    col[2] = random(255);
    t = random(0,5000);  
  }

  void show() {
    //stroke(255);
    noStroke();
    
    col[0] = map(noise(t),0,1,0,255);
    col[1] = map(noise(t+5000),0,1,0,255);
    col[2] = map(noise(t+10000),0,1,0,255);
        
    fill(col[0],col[1],col[2],80);
    ellipse(pos.x,pos.y,r*2,r*2);
    //line(pos.x,pos.y,pos.x+0.5*vel*dir.x,pos.y+0.5*vel*dir.y);
  }

  void update() {
    //PVector mouse = new PVector(mouseX-width/2,mouseY-height/2);
    t += 0.001;
    dir.x = map(noise(t),0,1,-1,1);
    dir.y = map(noise(t+10000),0,1,-1,1);
    vel = map(noise(t+20000),0,1,2,8);;
    dir.normalize();
    
    pos.add(dir.mult(vel));
    
    if (abs(pos.x) - r > width/2) { 
      pos.x *= -1; 
    }
    if (abs(pos.y) - r > height/2) { 
      pos.y *= -1; 
    }
  }

}
