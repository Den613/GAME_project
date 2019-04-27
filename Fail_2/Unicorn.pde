class Unicorn {

  float w,h,x,y,vx,vy,
  accelerationX,accelerationY,
  speedLimit,friction,bounce,gravity;
  boolean isOnGround;
  float jumpForce;
  float halfWidth,halfHeight;
  int currentFrame;
  String collisionSide;
  boolean facingRight;
  int frameSequence;

  Unicorn(){
    w = 30;
    h = 70;
    x = 0;
    y = 0;
    vx = 0;
    vy = 0;
    accelerationX = 0;
    accelerationY = 0;
    speedLimit = 5;
    friction = 0.96;
    bounce = -0.5;
    
    gravity = 3;
    isOnGround = false;
    jumpForce = -8;

    halfWidth = w/2;
    halfHeight = h/2;

    currentFrame = 0;
    collisionSide = "";
    frameSequence = 12;
  }

  void update(){
    if (left){
      // vx =-5;
      accelerationX = -0.2;
      friction = 0.96;
      facingRight = false;
      // if(currentFrame <= startLeft){currentFrame=startLeft;}

    }
    if (right){
      // vx =5;
      accelerationX = 0.2;
      friction = 0.96;
      facingRight = true;
    }
    if(!left&&!right) {
      // vx=0;
      accelerationX = 0;
      friction = 0.8;
      gravity = 0.3;
    }else if (left&&right){
      // vx=0;
      accelerationX = 0;
      friction = 0.8;
      gravity = 0.3;
    }

    
    if (up && isOnGround){
      vy += jumpForce;
      isOnGround = false;
      friction = 0;
    }

    vx += accelerationX;
    vy += accelerationY;

    ////apply the forces of the universe
    if (isOnGround){
      vx *= friction;
    }
    vy += gravity;

    ////correct for maximum speeds
    if (vx > speedLimit){
      vx = speedLimit;
    }
    if (vx < -speedLimit){
      vx = -speedLimit;
    }
    if (vy > speedLimit * 2){
      vy = speedLimit * 2;
    }

    ////move the player
    x+=vx;
    y+=vy;

  }
  void checkPlatforms(){
    ////update for platform collisions
    if (collisionSide == "bottom" && vy >= 0){
      isOnGround = true;
      ////flip gravity to neutralize gravity's effect
      vy = -gravity;
    }else if (collisionSide == "top" && vy <= 0){
      vy = 0;
    }else if (collisionSide == "right" && vx >= 0){
      vx = 0;
    }else if (collisionSide == "left" && vx <= 0){
      vx = 0;
    }
    if (collisionSide != "bottom" && vy > 0){
      isOnGround = false; 
    }
  }
  void checkBoundaries(){
    ////check boundaries
    ////left
    if (x < -w){
      // vx *= bounce;
      // x = 0;
      x = width;
    }
    if (x  > width){
    //// right
      // vx *= bounce;
      // x = width - w;
      x = -w;
    }
    ////top
    if (y < 0){
       //vy *= bounce;
       //y = 0;
    }
    if (y + h > height){
      y = height - h;
      isOnGround = true;
      vy = -gravity;
    }    
  }
  void display(){
    //fill(0,255,255,128);
    if(x > width-60)
      x = width-60;
    
    
    if(x < 10)
      x = 10;
    
    
    //rect(x ,y ,w ,h);
    
    if (facingRight){
      
      image(spriteImages[currentFrame],x,y+3);
    }else{
      
      image(spriteImages[currentFrame+12],x,y+3);

    }
    // image(spriteImages[currentFrame],x,y+3);
    if (abs(vx)>1 && isOnGround){
      //println("currentFrame: "+currentFrame);
        currentFrame = (currentFrame+1)%frameSequence;
    }else{
      currentFrame = 0;
    }

  }

}