class Animation_enemy{
  float x;
  float y;
  
  float x1;
  float x2;
  
  boolean flag;
  
  int k;
  int z; 
  
  Animation_enemy(float _x, float _range0, float _range1){
    x = _x;
    //y = _y;
    
    x1 = _range0;
    x2 = _range1;
    
    flag = true;
    
    k = 0;
    z = 0;
  }
  float animation_e(int y){
    if(flag){
      if(x < x2){
        z++;
        k++;
        if(k == 1)
          k = 0;
        x += 0.5;
        image(shape[k],x,y);
        //print("anim : k = ",k," (",z,")");
      }else{
        flag = false;
        k = 5;
      }
    }
  
    if(!flag){
      if(x > x1){
        
        k++;
        if(k == 6)
          k = 5;
        x -= 0.5;
        image(shape[k],x,y);
      }else{
        flag = true;
        k = 0;
      }
    }
    return x;
  }
}
