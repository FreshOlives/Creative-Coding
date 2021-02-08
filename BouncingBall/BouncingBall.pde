Ball myBall;

void setup() {
  size(900,600);
  myBall = new Ball(50);
}

void draw() {
  translate(width/2,height/2);
  background(230,230,250);
  myBall.show();
  myBall.update(1);
}

void keyPressed() {
  if (keyCode == 32) {
    myBall.nudge(0,-15);
  }
}
