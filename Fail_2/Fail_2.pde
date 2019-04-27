
Unicorn u;
Platform [] platforms;


boolean left,right,up,down,space, shift;

PImage [] spriteImages;
PImage [] shape;
PImage F;

PImage cs;
PImage laser;
PImage img;
int frames;
int frame_shape;
int t, n,m,nm,k,z,q,r,number;

PFont text;
String str_right;
String str_left;

String str_jump;
String str_hit;

int X[];
int Y[];

int Xblock[];
int Yblock[];

Bullet [] bullets;

Test1 [] test;
Test1 test0;

int nextBullet;

Timer firingTimer;

Block [] block;
Block block0;

Animation_enemy []animation_E;

boolean step;
int step_go;

float Xx;
boolean flag;

int BlockNumber;
int BlockNumberAnim;
int Anm;
int c;
int l = 0;
void setup() {
  //fullScreen(P2D);
  size(1300,800,P2D);
  frameRate(38);
  frames = 24;
  frame_shape = 10;
  
  spriteImages = new PImage[frames];
  shape = new PImage[frame_shape];
  
  for (int i = 0; i<frames; i++){
    if( i < 12){
      println("frame - ",i);
      spriteImages[i]=loadImage("image/right"+(i+1)+".png");
    }else{
      spriteImages[i]=loadImage("image/left"+(i+1)+".png");
    }
  }
  
  for (int i = 1; i<=frame_shape; i++){
    if( i <= 5){
      println("i = ",i);
      shape[i-1]=loadImage("image/shape/shape_right_"+(i)+".png");
    }else{
      println("i = ",i-5);
      shape[i-1]=loadImage("image/shape/shape_left_"+(i-5)+".png");
    }
  }
  
  img = loadImage("../data/1.png");
  cs = loadImage("image/cs.png");
  F = loadImage("image/fon2.jpg");
  
  text = loadFont("JasmineUPCBold-48.vlw");
  str_right = "R";
  str_left = "L";
  str_jump = "X";
  str_hit = "O";
  n = width;
  m = img.width;
  k = 0;
  q = 0;
  r = 0;
  nm = int(n/m);
  u = new Unicorn();
  Map();
  bullets = new Bullet [800];
  for (int i = 0; i < bullets.length; ++i) {
    bullets[i] = new Bullet();
  }
  nextBullet = 0;

  left = false;
  right = false;
  up = false;
  down = false;
  space = false;
  shift = false;

  firingTimer = new Timer(300.0);
  firingTimer.start();
  
}

void draw() {
  //background(20);
  image(F,0,0);
  int temp = 0;
    //f();
    
  
    //println("fire: ",l);
    //l = 0;
    
      
      
    for(int i = 0; i < Anm; i++){
      test[BlockNumber+i].x = (int)animation_E[i].animation_e(test[BlockNumber+i].y);
      test[BlockNumber+i].rangeX0 = (int)animation_E[i].animation_e(test[BlockNumber+i].y) - 25;
      test[BlockNumber+i].rangeX1 = (int)animation_E[i].animation_e(test[BlockNumber+i].y) + 25;
      test[BlockNumber+i].range_x0 = (int)animation_E[i].animation_e(test[BlockNumber+i].y) - 50;
      test[BlockNumber+i].range_x1 = (int)animation_E[i].animation_e(test[BlockNumber+i].y) + 50;
    }
    //platforms[number+BlockNumber-1] = new Platform (test[BlockNumber-1].x,test[BlockNumber-1].y,test[BlockNumber-1].w,test[BlockNumber-1].h,img,true,number);
    
  u.update();
  for (int i = 0; i < platforms.length; ++i) {
    rectangleCollisions(u,platforms[i]);
    u.checkPlatforms();
    u.checkBoundaries();
  if (space){
    if (firingTimer.isFinished()){
      bullets[nextBullet].fire(u.x, u.y, u.w, u.facingRight);
      nextBullet = (nextBullet+1)%bullets.length;
      firingTimer.start();
      
    }
  }
  }
  u.display();

  for (int i = 0; i < platforms.length; ++i) {
    platforms[i].display();
  }
  
  for (int i = 0; i < bullets.length; ++i) {
    bullets[i].update();
    bullets[i].display(); 
}
  
  
  //fill(255,0,0);
  //rect(400,650,30,70);
  boolean a = false;
  for(int i = 0; i < test.length; i++){
    fill(255,0,0,100);
    rect(width-130,height-760,80,80);
    test[i].printBullet();
    temp =((100 - test[i].K)/2); 
  }      
  
  
  if(temp < 0){
    //if(!a){
  for(int i = 0; i < test.length; i++){
    test[i].K = 100;
}
    for (int i = 0; i < bullets.length; ++i) {
      bullets[i].firing = true;   
    } 
  }

  
  
  
  /*if((u.x < 400 && u.x > 600) && u.y == 650){
    println("YES");
  for(int o = 0; o < test.length; o++){
    test[o].K = 0;
  }
    }*/
  
  place();
  }

void Map(){
  BlockNumber = 0;
  
  BlockNumberAnim = 0;
  Anm = 0;
  
  int [] XblockNumber;
  int [] YblockNumber;
  
  int [] XblockNumberAnim;
  int [] YblockNumberAnim;

  int [] XblockAnimStop;
  int [] YblockAnimStop;
  
  X = new int[n*height/30];
  Y = new int[n*height/30];
  
  XblockNumber = new int[n*height/30];
  YblockNumber = new int[n*height/30];
  
  XblockNumberAnim = new int[n*height/30];
  YblockNumberAnim = new int[n*height/30];
  
  XblockAnimStop = new int[n*height/30];
  YblockAnimStop = new int[n*height/30];
  
  Xblock = new int[28];
  Yblock = new int[54];
  
  String [][] MAP = {
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","2A","_","_","_","S","_","_","_","_","_","_","_","_","2","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","1","1","1","1","1","_","_","_","_","_","_","_","1","1","1","_","_","_","_","_"},
  {"_","_","_","_","2A","S","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","1","1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","2","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","1","1","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","1","1","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","2","_","2A","_","S","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","1","1","_","1","1","1","_","_","1","1","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","2","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","1","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","1","_","_","_","_","_","_","_","_","-","_"},
  {"1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","2A","_","S","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","1","1","1","1"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","2","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","1","1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","2A","_","S","_"},
  {"_","_","_","_","_","_","_","_","1","1","_","1","_","_","_","_","_","_","_","_","_","_","1","1","1","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","2","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","1","1","1","1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","2","2A","_","_","_","_","_","_","_","S","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","1","1","1","1","1","1","1","1","1","1","_"},
  {"1","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","2A","_","_","_","_","S","_","2A","_","_","_","_","_","_","_","S","2A","_","_","_","_","_","S","_"},
  {"1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"},
  {"_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_","_"}
};
  //MAP[nm][int(height/30)] = ['a','s'];
  println(height);
  
    //for(int Z = 0; Z < 26; T++){
  for(int j = 0; j < 52; j++){
    for(int i = 0; i < 26; i++){
      
       if(MAP[j][i] == "1"){
         k++;
         println("Y = ",j, " X = ",i);
         X[k] = i;
         Y[k] = j;
       }
       
       if(MAP[j][i] == "2"){
         BlockNumber++;
         XblockNumber[BlockNumber-1] = i;
         YblockNumber[BlockNumber-1] = j;
       }
       
       if(MAP[j][i] == "2A"){
           Anm++; 
           XblockNumberAnim[Anm-1] = i;
           YblockNumberAnim[Anm-1] = j;
       }
       if(MAP[j][i] == "S"){
           BlockNumberAnim++;
           XblockAnimStop[BlockNumberAnim-1] = i;
           YblockAnimStop[BlockNumberAnim-1] = j;
       }
   }
  }
  number = k+1;
  println("Anm = ",Anm," ->> ",BlockNumberAnim);
  platforms = new Platform[number+BlockNumber+Anm];
  test = new Test1[BlockNumber+Anm];
  
  animation_E = new Animation_enemy[Anm];
  
  
  z = k;
  println("z = ",z);
  //z = 0;
  k = 0;
  for(int i = 0; i < n; i=i+50){
    k++;
    Xblock[k-1] = i;
  }
  println(" -=>",k);
  k = 0;
  //println(int(height/30));
  for(int i = 0; i < height; i=i+15){
    k++;
    Yblock[k-1] = i;
  }
  k = 0;
  
  println("nm = ",nm," n = ",n," k = ",k);
  
  println("Z = ", z);
 // println("Animation : ",animation_E[0].animation_e());
 
 for(int i = 0; i < z; i++){
    platforms[i] = new Platform (Xblock[X[i+1]],Yblock[Y[i+1]],img.width,img.height,img,false,number);
  }
  platforms[z] = new Platform (500,300,img.width,img.height,img,false,number);
  println(Xblock[X[1]]," y = ",Yblock[Y[1]]);
  k = 0;
  for(int i = 0; i < Anm; i++)
    animation_E[i] = new Animation_enemy(Xblock[XblockNumberAnim[i]],Xblock[XblockNumberAnim[i]],Xblock[XblockAnimStop[i]]);
  
  for(int i = 0; i <BlockNumber; i++)
    test[i] = new Test1(Xblock[XblockNumber[i]]-35,Xblock[XblockNumber[i]]+35,Xblock[XblockNumber[i]],Yblock[YblockNumber[i]]-35,true);
  for(int i = 0; i < Anm; i++)
    test[BlockNumber+i] = new Test1(Xblock[XblockNumber[i]]-35,Xblock[XblockNumber[i]]+35,Xblock[XblockNumber[i]],Yblock[YblockNumberAnim[i]]-35,false);
    
  println(" = ",test.length, " -> ",BlockNumber);
  
  for(int i = 0; i < test.length; i++){
      //println("platform = ",number+i);
      platforms[number+i] = new Platform (test[i].x,test[i].y,test[i].w,test[i].h,img,true,number);
      
  }
  
  
}

void f(){
  
  if(flag){
    println("anim");
      if(c < 630){
        c += 1;  
      }else{
        flag = false;
      }
    }
  
    if(!flag){
      if(c > 200){
        c -= 1;  
      }else{
        flag = true;
      }
    }
}

void mousePressed(){
 if(mouseX < 100 && mouseX > 20 && mouseY < (height-40) && mouseY > (height - 120)){
    //fill(255,0,0,100);
    //rect(20,height-120,80,80);
    left = true;
  }else{
    left = false;
  }
  
  if(mouseX < 200 && mouseX > 120 && mouseY < (height-40) && mouseY > (height - 120)){
    fill(255,0,0,100);
    rect(120,height-120,80,80);
    right = true;
  }else{
    right = false;
  }
  
  if(mouseX < (width-140) && mouseX >width-220 && mouseY < (height-40) && mouseY > (height - 120)){
    //fill(255,0,0,100);
    //rect(width-220,height-120,80,80);
    up = true;
  }else{
    up = false;
  }
  
  if(mouseX < width - 40 && mouseX > width-120 && mouseY < (height-140) && mouseY > (height - 220)){
    //fill(255,0,0,100);
    //rect(width-120,height-220,80,80);
    space = true;
  }else{
    space = false;
  }
}

void mouseReleased(){
  left = false;
  right = false;
  space = false;
  up = false;
}

void place(){
 //=======================================//
  fill(0,0,0,100);
  rect(20,height-120,80,80);
  
  fill(255,255,255);
  textFont(text,100);
  text(str_left,40,height-60);
  
  
  //=======================================//
  
  //=======================================//
  fill(0,0,0,100);
  rect(120,height-120,80,80);
  
  fill(255,255,255);
  textFont(text,100);
  text(str_right,140,height-60);
  
  
  //=======================================//
  
  //=======================================//
  fill(0,0,0,100);
  rect(width-220,height-120,80,80);
  
  fill(255,255,255);
  textFont(text,100);
  text(str_jump,width-200,height-60);
  
  //=======================================//
  
  //=======================================//
  
  fill(0,0,0,100);
  rect(width-120,height-220,80,80);
  
  fill(255,255,255);
  textFont(text,100);
  text(str_hit,width-105,height-160);
   
  if(left == true){
    fill(255,0,0,100);
    rect(20,height-120,80,80);
  }
  if(right == true){
    fill(255,0,0,100);
    rect(120,height-120,80,80);
  }
  if(up == true){
    fill(255,0,0,100);
    rect(width-220,height-120,80,80);
  }
  if(space == true){
    fill(255,0,0,100);
    rect(width-120,height-220,80,80);
  }
}

void keyPressed(){
  switch (keyCode){
    case 37://left
      left = true;
      break;
    case 39://right
      right = true;
      break;
    case 32://up
      up = true;
      break;
    case 40://down
      down = true;
      break;
    case 38: //space
      space = true;
      break;
    case 16: //shift
      shift = true;
  }
}
void keyReleased(){
    switch (keyCode){
    case 37://left
      left = false;
      break;
    case 39://right
      right = false;
      break;
    case 32://up
      up = false;
      break;
    case 40://down
      down = false;
      break;
    case 38: //space
      space = false;
      break;
    case 16: //shift
      shift = false;
  }
}
void rectangleCollisions(Unicorn r1, Platform r2){
  ////r1 is the player
  ////r2 is the platform rectangle
  float dx = (r1.x+r1.w/2) - (r2.x+r2.w/2);
  float dy = (r1.y+r1.h/2) - (r2.y+r2.h/2);

  float combinedHalfWidths = r1.halfWidth + r2.halfWidth;
  float combinedHalfHeights = r1.halfHeight + r2.halfHeight;

  if (abs(dx) < combinedHalfWidths){
    ////a collision may be happening
    ////now check on the y axis
    if (abs(dy) < combinedHalfHeights){
      ////excellent. they are overlapping
      //determine the overlap on each axis
      float overlapX = combinedHalfWidths - abs(dx);
      float overlapY = combinedHalfHeights - abs(dy);
      ////the collision is on the axis with the 
      ////SMALLEST about of overlap
      if (overlapX >= overlapY){
        if (dy > 0){
          r1.collisionSide = "top";
          ////move the rectangle back to eliminate overlap
          ////before calling its display to prevent
          ////drawing object inside each other
          r1.y += overlapY;
          // println("collisionSide: "+r1.collisionSide);
        }else{
          r1.collisionSide = "bottom";
          r1.y -= overlapY;
          // println("collisionSide: "+r1.collisionSide);
        }
      }else{
        if (dx > 0){
          r1.collisionSide = "left";
          r1.x += overlapX;
          // println("collisionSide: "+r1.collisionSide);
        }else{
          r1.collisionSide = "right";
          r1.x -= overlapX;
          // println("collisionSide: "+r1.collisionSide);
        }
      }
    } else {
      r1.collisionSide = "none";
    }
  }else {
    r1.collisionSide = "none";
  }
  // return collisionSide;
}
