/*
Week 12
Author: Cassandra Liau
Summary: Using local CSV: popular baby names in NYC in processing 
Data from NYC opendata
selecting a future child's gender for you!
*/

PImage girl, boy;
Table baby;
String gender;
String note;


void setup(){
  //canvas size
  size(800, 800);
  background(250);
  textSize(20);
  
  //load CSV file
  baby = loadTable("Popular_Baby_Names.csv", "header");
  
  int rowCount = baby.getRowCount();
  
  //loop through to print values
  for(int i = 0; i < rowCount; i++){
    TableRow row = baby.getRow(i); //get row
    String output = ""; //empty output string
    output += row.getString("Gender") + ", ";
    output += row.getString("Child's First Name") + ", ";
    println(output);
  }
  
  //selected a random gender
  gender = baby.getRow(int(random(1, 11346))).getString("Gender");
  
  //load image
  girl = loadImage("girl.png");
  boy = loadImage("boy.png");
}

void draw(){
  //shows picture and change background depending on the randomly selected baby name and gender
  if(gender.equalsIgnoreCase("MALE")){
    background(119, 194, 214);
    image(boy, 250, 250, 500, 489);
    println("boy");
  }else{
    background(209, 128, 131);
    image(girl, 250, 250, 500, 538);
    println("girl");
  }
  //shoots text 
  note = "YOUR FUTURE CHILD WILL BE A " + gender + " BABY.";
  text(note, 50, 100, width, height);
}
