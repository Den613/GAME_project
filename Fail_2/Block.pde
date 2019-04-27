  class Block{
  int x, y, w, h;
  int k,q,n,z;
  int range_x0;
  int range_x1;
  int t;
   
  Block(int _x, int _y){
    w = 50;
    h = 70;
    
    k = 0;
    q = 0;
    z = 0;
    t = 0;
    
    x = _x;
    y = _y;
    range_x0 = x-50;
    range_x1 = x+50;

  }
    
  
/*  void HIT(Bullet []bullets){
    
    for(int i = 0; i < bullets.length; i++){
    if(bullets[i].tesT(k,range_x0,range_x1,h,y) == 1){
      k++;
    }else{
      k = 0;
    }
    if(k != 0 ){
      z = k;
      //if(z > 20)
        //k = 20;
    }
    bullets[i].tesT(k,range_x0,range_x1,h,y);
    if(bullets[i].tesT(k,range_x0,range_x1,h,y) == 2)
      q = 1;
    }
    
  }
*/  
  
  void display(){
    
    if(q != 1){
      fill(10*z+100,0,0);
      rect(x,y,w,h);
    }else{
      
      //?//
      //object[]//
      //println("destroy",t);
      for(int i = 0; i < bullets.length; i++){
        bullets[i].object = true;
      }
      fill(0,111,100);
      w = 0;
      h = 0;
      x = 0;
      y = 0;
      rect(x,y,w,h);     
    } 
  }
  
}