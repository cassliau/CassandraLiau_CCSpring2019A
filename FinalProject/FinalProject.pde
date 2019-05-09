/* FinalProject.pde
Author: Cassandra Liau
COMPLETE THE PUZZLE 

HOW TO PLAY: 
- puzzle is chosen at random in a collection of 5 images 
- complete the puzzle by using the arrow keyboard to move the pieces
*/

//import sound
import processing.sound.*;
SoundFile file;

//globals
int col = 3;
int row = 3;
int numCell = col * row;
int mult = 600 / col;
int[] Cell = new int[numCell];
PImage [] imgArray = new PImage[5];
PImage [] imgs = new PImage[numCell];
PImage winImg;

//change win to 'true' & isStated to 'false' to show win screen, change win to 'false' & isStarted to 'true' to show game screen
boolean isStarted = true;
boolean win = false;


void setup(){
  size(600, 600);
  // Load a soundfile and play it
  file = new SoundFile(this, "bgMusic.mp3");
  file.play();
  begin();
  
  //loop images in an array
  PImage[] images = new PImage[imgArray.length];
    for (int i=0; i < imgArray.length; i++){
    images[i] = loadImage(i + ".jpg");
  }
  //randomize and choose an image
  float ran = random(0,4);
  int ir = (int)(ran);
  println("The random image number " + ir + " is chosen!");
  PImage img = images[ir];  
  
  //divide image into 3
  int dimension = img.width/3;
  //setup arrays of image for each cells
  for(int c = 0; c < col; c++){
    for(int r = 0; r < row; r++){
      int index = c + r * col; //assigns each piece an index number
      imgs[index] = img.get(dimension * c, dimension * r, dimension, dimension); //get image 
    }
  }
  
  //set up game screen
  if (isStarted == true){
    //game start
    begin();
    win = false;
  }else{
    win = true;
    winImg = images[ir];
  }
}

void draw() {
  background(255);
  
  for (int c = 0; c < col; c++) { //column 
    for (int r = 0; r < row; r++) { //row
      int index = c + r * col; //assigns each piece an index number
      stroke(0);
      noFill();
      //draw outline of game
      rect(c * mult, r * mult, mult, mult);
      //draw images into the cells
      if (Cell[index] > 0) {
        image(imgs[Cell[index] -1], width / 3 * c, height / 3 * r, width / 3, height / 3);
      }
    }
  }
  gameScreen();
}

//function to begin the game
void begin() {
  //arrange cells
  for(int i = 0; i < numCell; i++) {
    Cell[i] = i +  1;
  }
 
  //shuffle puzzles
  swap(Cell, numCell - 1, numCell - 2);
  swap(Cell, numCell - 2, numCell - 4);
  swap(Cell, numCell - 6, numCell - 8);
  swap(Cell, numCell - 10, numCell - 12);

  //makes bottom right corner empty
  Cell[numCell - 1] = 0;
}

//for key press
int findZero(int[] array) {
  int index = 0;
  
  for (int i = 0; i < array.length; i++) {
    if (array[i] == 0) {
      index = i;
      break; //end loop
    }
  }
  return index;
}

//function to move cells
void swap(int[] arr, int c, int r) {
  //constrain r
  if(r > 8 || r < 0){
  return;
}
  int temp = arr[c];
  arr[c] = arr[r];
  arr[r] = temp;
}

//key press and a lot a lot of math stuff
void keyPressed(){
  int index = findZero(Cell);
  int up = index - col;
  int right = index + 1;
  int down = index + col;
  int left = index - 1;
  
  //setup cell movement direction
  if (index < col) {
    up = index;
  } else if (index % col == col - 1) {
    right = index;
  } else if (index > numCell - col) {
    down = index;
  } else if (index % col == 0) {
    left = index;
  }
  
  //movements of cells when key is pressed
  if (key == CODED) {
    if (keyCode == UP) {
      swap(Cell, index, down);
    } else if (keyCode == RIGHT) {
      swap(Cell, index, left);
    } else if (keyCode == DOWN) {
      swap(Cell, index, up);
    } else if (keyCode == LEFT) {
      swap(Cell, index, right);
    }
  }
}

//winner screen
void gameScreen(){
  if(win == true){
    //resize image to fit canvas
    winImg.resize(600, 600);
    //draw image on screen
    image(winImg, 0, 0);
    textSize(60);
    fill(255);
    text("YOU MADE IT ! !", 100, 500);
  }
}
