class Ball {
  PVector pos;
  PVector vel;
  int r;
  boolean bouncingX;
  boolean bouncingY;
  
  Ball(int radius) {
    pos = new PVector(0,0);
    vel = new PVector(random(-5,5),random(-5,5));
    this.r = radius;
    this.bouncingY = false;
    this.bouncingX = false;
  }
  
  void show() {
    fill(0);
    circle(this.pos.x,this.pos.y,this.r*2);
  }
  
  void show(int bright) {
    fill(bright);
    circle(this.pos.x,this.pos.y,this.r*2);
  }
  
  void show(int r, int g, int b) {
    fill(r,g,b);
    circle(this.pos.x,this.pos.y,this.r*2);
  }
  
  
  void update() {
    this.pos.x += this.vel.x;
    this.pos.y += this.vel.y;
    this.checkEdges(false);
  }
  
  void update(int grav) {
    this.pos.x += this.vel.x;
    this.pos.y += this.vel.y += grav;
    this.checkEdges(true);
  }
  
  void checkEdges(boolean gravity) {  
    
    if ((abs(this.pos.y)+r > height/2) && this.bouncingY == false) {
      if (gravity && this.pos.y>0) { 
        this.vel.y *= -0.9;
        this.pos.y = height/2-r;
      }
      else { this.vel.y *= -1; }
      this.bouncingY = true; 
    }
    else if (abs(this.pos.y)+r < height/2) {
      this.bouncingY = false;
    }
    
    if ((abs(this.pos.x)+r > width/2) && this.bouncingX == false) {
      this.vel.x *= -1;
      this.bouncingX = true; 
    }
    else if (abs(this.pos.x)+r < width/2) {
      this.bouncingX = false;
    }
  }
  
  void nudge(int nudgeX, int nudgeY) {
    this.vel.x += nudgeX;
    this.vel.y += nudgeY;
  }
}
