class Timer{
  float startTime;
  float interval;

  Timer(float tempTime){
    interval=tempTime;
  }

  void start(){
    startTime=millis();
  }

  boolean isFinished(){
    float elapsedTime = millis() - startTime;
   // println("time = ",elapsedTime);
    //if(elapsedTime == 185)
    //elapsedTime = 0;
    if(elapsedTime>interval){
      return true;
    }else{
      return false;
    }
  }
}