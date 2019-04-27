  class Bullet {
  float w,h,x,y;
  float halfWidth,halfHeight;
  float vx,vy;
  boolean firing;
  boolean object;
  int k;

  Bullet(){
    w = 35;
    h = 5;
    x = 0;
    y = -h;
    k = 0;
    halfWidth = w/2;
    halfHeight = h/2;
    vx = 0;
    vy = 0;
    boolean firing = false;
    boolean object = false;
    

  }
  void fire(float _x, float _y, float _w, boolean _facingRight){
    if (!firing){
      y = _y+24;
      firing = true;
      if (_facingRight == true){
        vx = 15;
        x = _x + _w - 35;
      }else{
        vx = -15;
        x = _x;
      }

    }
  }
  void reset(){
    x = 0;
    y = -h;
    vx = 100;
    vy = 0;
    firing = false;
  }
  void update(){
    if (firing){
      x += vx;
      y += vy;      
    }
    ////check boundaries
    //?//
    //object[]//
    //if((x < 0 || x > width)||(y < 0 || y > height))
      //  reset();
    //println("Range = ",test[9].range_x0+40);
    for(int i = 0; i < test.length; i++){
      if ((x < 0 || x > test[i].range_x0+40)&&(x < test[i].range_x1-40) || (y < 0 || y > height)){
        if(object == false){
          if((y > test[i].y && y < test[i].y+test[i].h) || (x < 0 || x > width))
          reset();
        }
      }
    }
    
  }
  
  void display(){
     fill(255,155,0);
     rect(x,y,w,h);
    //image(laser,x,y);
    
  }  
}
