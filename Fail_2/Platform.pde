class Platform{
  float w,h,x,y;
  String typeof;
  float halfWidth, halfHeight;
  boolean blockObject;
  int number;

  Platform(float _x, float _y, float _w, float _h, PImage _img, boolean _blockObject, int _number){
    w = _w;
    h = _h;
    x = _x;
    y = _y;
    img = _img;
    blockObject = _blockObject;

    halfWidth = w/2;
    halfHeight = h/10;
    
    number = _number;
    
  }

  void display(){
    if(blockObject == false){
      //fill(110,110,200);
      //rect(x,y,h,w);
      image(img,x,y);
    }else{
      
      halfHeight = h/2;
      halfWidth = w/2;
      //fill(255,0,255);
      //println("xNew = ",x);
      //rect(x,y,w,h);
      for(int i = 0; i < test.length; i++){
        platforms[number+i].x = test[i].x;
        platforms[number+i].y = test[i].y;
        platforms[number+i].w = test[i].w;
        platforms[number+i].h = test[i].h;        
      }
      
      
      //println(platforms[(800/img.width)+36+1].x);
      
      
      
      


      

      
      /*for(int i = 0; i < block.length; i++){
      platforms[(800/img.width)+36+i].x = block[i].x;
      platforms[(800/img.width)+36+i].y = block[i].y;
      platforms[(800/img.width)+36+i].w = block[i].w;
      platforms[(800/img.width)+36+i].h = block[i].h;
      block[i].display();
      }*/
      
      
    }
  }
}