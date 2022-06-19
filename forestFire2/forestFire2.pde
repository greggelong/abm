int [][] forest;
int [][] newForest;
int cols;
int rows;
int sz;


void setup() {
  size(800, 800);
  sz = 2;
  cols = int(width/sz);
  rows = int(height/sz);
  noStroke();
  forest = new int[rows][cols]; // array is y,x
  newForest = new int[rows][cols];
  rndTree(0.6);
  setFireLine();
  showForest();
  frameRate(9);
}

void draw(){
  showForest();
  update();
  
  
}

void update() {
  for (int j=0; j< rows; j++) {  // row or y
    for (int i=0; i< cols; i++) { // column or x

      boolean neigh = getNeighbors(j, i);
      if (forest[j][i] == 1  && neigh ) {     // keeps living
        newForest[j][i] = 2;
      } else {
        newForest[j][i] = forest[j][i];  // else zero
      }
    }
  }
  
  // arrayCopy(newWorld,world); this does not work  need to manually copy the array

  for (int j=0; j< cols; j++) {  //  
    for (int i=0; i< rows; i++) {
      forest[j][i] = newForest[j][i];
    }
  }
}



boolean getNeighbors(int j, int i) {  // y and x coorodinate of the two dim array
  for (int y = -1; y < 2; y++) {
    for (int x = -1; x < 2; x++) {
      int col = (x + i + cols) % cols;
      int row = (y + j + rows) % rows;
      if (forest[row][col]== 2){
        return true;
      }
    }
  }
  
  return false;
}

void showForest() {
  for (int j =0; j < rows; j++) {
    for (int i =0; i < cols; i++) {
      // set color
      if (forest[j][i]== 0) {
        fill(0);
      } else if (forest[j][i] ==1) {
        fill(0);
      } else {
        fill(255, 0, 0);
      }
      rect(i*sz, j*sz, sz, sz); // whoops!! this is standard x, y
    }
  }
  fill(255, 0, 0);
  text(frameCount, 20, 50);
}



void rndTree(float p ) {


  for (int j =0; j < rows; j++) {
    for (int i =0; i < cols; i++) {

      if ((random(1))>= p) {
        // set points for collision
        forest[j][i] = 1;
        //grid[j+3][i+1]=1;
        //grid[j][i+5]=1;
      }
    }
  }
}




void setFireLine() {
  for (int j=0; j <rows; j++) {
    forest[j][200] = 2;
  }
}
