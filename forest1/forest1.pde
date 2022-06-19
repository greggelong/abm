int [][] forest;
int cols;
int rows;
int sz;


void setup(){
  size(800,800);
  sz = 2;
  cols = int(width/sz);
  rows = int(height/sz);
  noStroke();
  forest = new int[rows][cols]; // array is y,x 
  rndTree(0.5);
  showForest();
  
  
}


void showForest() {
  for (int j =0; j < rows; j++) {
    for (int i =0; i < cols; i++) {
      // set color
      if (forest[j][i]== 0){
       fill(0); 
      }
      else if(forest[j][i] ==1){
       fill(0,255,0); 
      }
      else{
       fill(255,0,0); 
      }
      rect(i*sz, j*sz, sz, sz); // whoops!! this is standard x, y
    }
  }
  fill(255,0,0);
  text(frameCount, 20,50);
}



void rndTree(float p ) {
  
  
  for (int j =0; j < rows; j++) {
    for (int i =0; i < cols; i++) {
      
     if ((random(1))>= p){
      // set points for collision
      forest[j][i] = 1;
      //grid[j+3][i+1]=1;
      //grid[j][i+5]=1;
      }
    }
  }
}
