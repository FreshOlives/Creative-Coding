function make2DArray(cols, rows) {
  let arr = new Array(cols);
  for (let i = 0; i < arr.length; i++) {
    arr[i] = new Array(rows);
  }
  return arr;
}


let grid;
let next;
let cols;
let rows;
let res = 10;

function setup() {
  createCanvas(600,600);
  background(0);
  
  cols = width / res;
  rows = height / res;
  
  grid = make2DArray(cols, rows);
  next = make2DArray(cols, rows);
  
  for (let i = 0; i < cols; i++) {
    for(let j = 0; j < rows; j++) {
      grid[i][j] = floor(random(2));
    }
  }
  
}


function draw() {
  
  for (let i = 0; i < cols; i++) {
    for(let j = 0; j < rows; j++) {
      let x = i * res;
      let y = j * res;
      if (grid[i][j] == 0) {
        fill(255);
        stroke(0);
        rect(x, y, res-1, res-1);
      }       
    }
  }
  
  for (let i = 0; i < cols; i++) {
    for(let j = 0; j < rows; j++) {
   
      // Count live neighbors
      let sum = count(i,j);
      let state = grid[i][j];
      
      // Determine next state
      if ((state == 0) && (sum == 3)) {
        next[i][j] = 1;
        console.log('ALIVEEEE');
      } else if ((state == 1) && ((sum < 2 ) || (sum > 3))) {
        next[i][j] = 0;
        console.log('Dead');
      } else {
        next[i][j] = 1;
        console.log('samesies');
      }
      
    }       
  }
  
  grid = next;
}

function count(i,j) {
  let sum = 0;
  
  // Left col
  if (i > 0) {
    if (j > 0) { sum += grid[i-1][j-1]; }
    sum += grid[i-1][j];
    if (j < rows-1) { sum += grid[i-1][j+1]; }
  }
  
  // Right col
  if (i < cols-1) {
    if (j > 0) { sum += grid[i+1][j-1]; }
    sum += grid[i+1][j];
    if (j < rows-1) { sum += grid[i+1][j+1]; }
  }
  
  // Top box
  if (j > 0) { sum += grid[i][j-1]; }
  
  // Bottom box
  if (j < rows-1) { sum += grid[i][j+1]; }
  
  return sum;
  
}
