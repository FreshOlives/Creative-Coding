let time = 0;
let wave = [];
let wave2 = [];
let strokes = [];

let slider;
let slider2;

let n = 15;
let offset = 50;
let timeStep = 0.04;

function setup() {
  createCanvas(1000,500);
  
  for (let i = 0; i < n; i++) {
    strokes[i] = [random(255),random(255),random(255)];
  }
  
  slider = createSlider(1, n, 1,1);
  slider.position(10, 10);
  slider.style('width', '80px');
  
  slider2 = createSlider(0.01,0.1,0.05,0.01);
  slider2.position(10, 30);
  slider2.style('width', '80px');
  
}


function draw() {
  background(0);
  translate(100,150);
  
  strokeWeight(1.5);
  stroke(255);
  noFill();
  
  n = slider.value();
  timeStep = slider2.value();
  
  let x = 0;
  let y = 0;
  let prevx = 0;
  let prevy = 0;
  
  for (let i = 0; i < n; i++) {
    let radius = 50*(4/((2*i+1) * PI));
    ellipse(prevx,prevy,radius*2);
    x = prevx + radius * cos((2*i+1) * time);
    y = prevy + radius * sin((2*i+1) * time);
    line(prevx,prevy,x,y);
    prevx = x;
    prevy = y;
    //stroke(strokes[n-i][0],strokes[n-i][1],strokes[n-i][2]);
    strokeWeight(1.5);
  }
    
  wave.unshift(prevy);

  fill(255);
  stroke(255);
  circle(x,y,5);
  
  line(x,y,offset*3,y);
  
  // BOTTOM STARTS HERE
  
  noFill();
  x = 0;
  y = 250;
  prevx = 0;
  prevy = 200;
  
  for (let i = 0; i < n; i++) {
    let j = 2*i+1;
    let radius = 80*((8/pow(PI,2))*pow(-1,i)*pow(j,-2));
    ellipse(prevx,prevy,radius*2);
    x = prevx + radius * cos(j * time);
    y = prevy + radius * sin(j * time);
    line(prevx,prevy,x,y);
    prevx = x;
    prevy = y;
    //stroke(strokes[n-i][0],strokes[n-i][1],strokes[n-i][2]);
    strokeWeight(1.5);
  }
    
  wave2.unshift(prevy);

  fill(255);
  stroke(255);
  circle(x,y,1);
  
  line(x,y,offset*3,y);
 
  // BOTTOM ENDS HERE
  
  translate(offset*3,0);
  
  beginShape();
  noFill();
  for (let i = 0; i < wave.length; i++) {
    vertex(i,wave[i]);
  }
  endShape();
  
  beginShape();
  noFill();
  for (let i = 0; i < wave.length; i++) {
    vertex(i,wave2[i]);
  }
  endShape();
  
  
  time += timeStep;
  
  
  if (wave.length > 750) {
    wave.pop();
  }
  
}
