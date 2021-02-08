int cols, rows;
int scl = 20;
int w;
int h;
float displacement = 0;
float angle = 0;

int peak = 0;
float omega = 0;
float flySpeed = 0;

float[][] terrain;
float[][] vels;

void setup () {
  size(800,800,P3D);
  w = width*2;
  h = height*2;
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
}

void draw() {
  background(0);
  stroke(120);
  //noFill();
  fill(0);
  
  translate(width/2,height/2);
  rotateX(PI/3);
  rotateZ(angle);
  translate(-w/2,-h/2,25);
  
  update();
  show();
  angle += omega;
}

void keyPressed() {

  if (keyCode == 38) {peak += 5;}
  if (keyCode == 40 && peak >= 5) {peak -= 5;}
  if (keyCode == 39) {omega    += 0.01;}
  if (keyCode == 37) {omega    -= 0.01;}
  if (keyCode == 87) {flySpeed += 0.01;}
  if (keyCode == 83) {flySpeed -= 0.01;}
  
}

void update() {
  
  displacement -= flySpeed;
  
  float yoff = displacement;
  for (int y = 0; y < rows; y++) {
    float xoff = displacement;
    for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff,yoff), 0, 1, -peak, peak);
        xoff += 0.1;
      }
     yoff += 0.1;
  }
}

void show() {

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl,y*scl,terrain[x][y]);
      vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
    }
    endShape(TRIANGLE_STRIP);
  }
}
