class Timer{
  float Time;
  int time;
  
  Timer(float set){ //contructor
    Time = set;

}
  float getTime(){ //returns
    return(Time);
  }
  
  float stopTime(){ //stops time at 0
    return(0);
  }

  void setTime(float set){ //set timer to desirable constant ex. 10, 60 in secs
    Time = set;
  }
  
  void countUp(){ 
    Time += 1/frameRate; 
  }
  
  void countDown(){
    Time -= 1/frameRate;
  }
  
  void displayTime(){
  if(Time > 0){
    text(getTime(), 20, 80);
  }else{
    text(stopTime(), 20, 80);
  }
  }
  

  void display(){
  //timer function
    startTimer.countDown();
    textSize(30);
    fill(255);
    startTimer.displayTime();
  }
}
