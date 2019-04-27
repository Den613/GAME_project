class Test1 {
  float read;
  int k;
  int rangeX0;
  int rangeX1;
  boolean testO;
  int x,y,h,w;
  int range_x0;
  int range_x1;
  int K;
  boolean anm;
  Test1(int _rangeX0, int _rangeX1, int _x, int _y,boolean _anm){
    read = 0;
    k = 0;
    K = 0;
    
    rangeX0 = _rangeX0;
    rangeX1 = _rangeX1;
    h = 70;
    w = 50;
    x = _x;
    y = _y;
    
    testO = false;
    
    range_x0 = x-50;
    range_x1 = x+50;
    
    anm = _anm;
  }
  void printBullet(){

    if(anm){
    //fill(160,151,137); 
    //rect(x,y,w,h);
    //}else{    {
    //fill(0,255,0); 
    //rect(x,y,w,h);
    image(cs,x,y+4);
    }
    
    
    //fill(255,255,255);
    
    for(int i = 0; i < bullets.length; i++){
    read = bullets[i].x;
    if(read != 0){
     if(anm == false){
      if(read < width){
        
        if(read > u.x-30 && read < u.x+30){
          K++;
        }
        
        if(read > rangeX0 && read < rangeX1 && bullets[i].y > y && bullets[i].y < y+h){
          k ++;
          fill(255,0,0); 
          rect(x,y,w,h);
          println("block :",k);
          if(k >= 10){
            k = 10;
            println("Destroy Block: ");
            bullets[i].object = true;
            x = -100;
            y = -100;
            h = 0;
            w = 0;
            
          }      
        }
      }
     }else{
       if(read < width){
        if(read > rangeX0 && read < rangeX1 && bullets[i].y > y && bullets[i].y < y+h){
              k++;
              fill(255,0,0); 
              rect(x,y,w,h);
              println("block :",k);
          if(k == 10){
            println("Destroy Block: ");
          bullets[i].object = true;
            x = -100;
            y = -100;
            h = 0;
            w = 0;}
        }
       }
       
      }
      
    }
    fill(255, 255, 255);
    textFont(text,50);
    if((100 - K)/2 < 0){
      text(0,width-120,height-700);
    }else{
    text((100-K)/2,width-120,height-700);
    }

   }
           
  }
  
  
  
 }
