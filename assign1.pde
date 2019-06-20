PGraphics big;
PImage door1, door1OpenHover;
PImage title, bgA, door, doorDark, table, candle, picture, ghost;
PImage dioDown1, dioIdle1, dioLeft1, dioRight1,dioUp1;
PImage gameover, win;
PImage startHovered, startNormal, restartHovered, restartNormal;  

PImage doorB, door2OpenHover, doorInside;
PImage bg,box, money, priest,priestUp;
PImage dioDown2, dioIdle2, dioLeft2, dioRight2,dioUp2;
PImage startHovered2, startNormal2, restartHovered2, restartNormal2, title2, gameover2; 

PImage bg3, cross1,cross0, bone, boneLeft, boneRight, vampireLeft, vampireRight;
PImage dioDown3, dioIdle3, dioLeft3, dioRight3, dioUp3,doorC,doorO,doorRight, door3, door3Hover;
PImage startHovered3, startNormal3, restartHovered3, restartNormal3, title3, gameover3,gameover4,win03;          //all image


final int GAME_INIT_TIMER = 7200;
int gameTimer = GAME_INIT_TIMER;

final int GAME_INIT_TIMER2 = 0;
int gameTimer2 = GAME_INIT_TIMER2;


final int GAME_FISRT_ANIMA=0;
final int GAME_START_A = 1;
final int GAME_RUN_A = 2;
final int GAME_Fail_A = 3;
final int GAME_START_B = 4;
final int GAME_RUN_B = 5;
final int GAME_Fail_B = 6;
final int GAME_START_C = 7;
final int GAME_RUN_C = 8; 
final int GAME_WIN_C = 9; 
final int GAME_Fail_C = 10;
final int GAME_Fail_D = 11;
 
int gameState = GAME_FISRT_ANIMA;          //First game status

int space=50;
int space2=100;

final int OPENDOOR_TOP = 250;
final int OPENDOOR_BOTTOM = 600;
final int OPENDOOR_LEFT = 50;
final int OPENDOOR_RIGHT = 200;    

final int BUTTON_TOP = 500;
final int BUTTON_BOTTOM = 600;
final int BUTTON_LEFT = 250;
final int BUTTON_RIGHT = 550;   

//1
int ghost3X, ghost5X, ghost7X, ghost3Y, ghost5Y, ghost7Y, ghostSpeed3Y,  ghostSpeed5Y,  ghostSpeed7Y;                                              //about soldier Location
boolean ghostCollision=false;     //soldier Collision switch

 int pictureY=0;
 
 int table1X=145;
 int table1Y=85;
 int table2X=130;
 int table2Y=190;
 int table3X=115;
 int table3Y=295;
 int table4X=100;
 int table4Y=400;

float[] candleX={325,525,725,225,425,625,325,525,725,225,425,625};
float[] candleY={160,160,160,265,265,265,370,370,370,475,475,475};

float[] initCandleX={325,525,725,225,425,625,325,525,725,225,425,625};
float[] initCandleY={160,160,160,265,265,265,370,370,370,475,475,475};
int sp=0;
boolean drawcandle=true;        //cabbage Collision switch

int dioX1, dioY1;//about groundhog Location
final int dio_IDLE1 = 0;
final int dio_LEFT1 = 1;
final int dio_RIGHT1 = 2;
final int dio_DOWN1 = 3;
final int dio_UP1 = 4;
int dioState = dio_IDLE1;

int HP=1,SP=0,nowframeCount;                                                                 //frameCount about groundhog*
boolean upPressed, downPressed, rightPressed, leftPressed, isActive=false;                //about groundhog control


//2
int priestX, priestY, priestSpeedY;

int priestLocationY =0;
int priestLocationX =4;                                                //about soldier Location
boolean priestCollision=false;     //soldier Collision switch

 float[] boxX={0,300,500,0,100,300,700,0,500,700};
 float[] boxY={100,100,200,400,400,400,400,500,500,500};

 float[] initmoneyX={100,600,700,0,300,600,100,200,300,500,700,600,200,300};
 float[] initmoneyY={100,100,100,200,200,200,300,300,300,300,300,400,500,500};
 float[] moneyX={100,600,700,0,300,600,100,200,300,500,700,600,200,300};
 float[] moneyY={100,100,100,200,200,200,300,300,300,300,300,400,500,500};
 //int sp2=0;
 //boolean drawMoney=true;        //cabbage Collision switch

int dioX2, dioY2;//about groundhog Location
final int dio_IDLE2 = 0;
final int dio_LEFT2 = 1;
final int dio_RIGHT2 = 2;
final int dio_DOWN2 = 3;
final int dio_UP2 = 4;
int dioState2 = dio_IDLE2;

int HP2=1,SP2=0,nowframeCount2;                                                                 //frameCount about groundhog*
boolean upPressed2, downPressed2, rightPressed2, leftPressed2, isActive2=false;      

boolean isPlay=false;
boolean isHide=false;
boolean sameplace;

boolean debugMode;
int cameraOffsetY;
//boolean debugMode2;
//int cameraOffsetY2;

//3
int[] boneX, boneY, boneDirection;
int[] boneType; //1:bone 2:vampire
int[] boneSpeedX;
int boneSpeed=3, vampireSpeed=6;  //boneSpeed 3 Vampire Speed 10
int[] crossCol, crossRow, crossHealth;

final int dio_IDLE3 = 0;
final int dio_LEFT3 = 1;
final int dio_RIGHT3 = 2;
final int dio_DOWN3 = 3;
final int dio_UP3 = 4;
final int SOIL_SIZE = 100;
final float PLAYER_INIT_X = 1 * SOIL_SIZE;
final float PLAYER_INIT_Y = 5 * SOIL_SIZE;
int col,row;
float x, y;
      
int HP3=1,SP3=0;                                                                 //frameCount about dio*
boolean upPressed3, downPressed3, rightPressed3, leftPressed3;                //about dio control
int moveDirection = 0;
int moveTimer = 0;
int moveDuration = 15;
boolean leftState3 = false;
boolean rightState3 = false;
boolean downState3 = false;
boolean upState3 = false;

//bone show
int[] boneShowDuration;



void initGame(){
  initCandle();
  gameTimer = GAME_INIT_TIMER;
}

void initGame2(){
  initMoney();
  isPlay=false;
  dioX2 = 400;
  dioY2 = 100;         
  gameTimer2 = GAME_INIT_TIMER2;
}

void initCandle(){
for(int i=0;i<12;i++){
    float x=candleX[i];
    float y=candleY[i];
    image(candle,x,y);
    }
candleX=initCandleX;
candleY=initCandleY;

}

void initMoney(){
for(int i=0;i<14;i++){
    float x=moneyX[i];
    float y=moneyY[i];
    image(money,x,y);
}
}


void setup() {
  size(800,600);
  frameRate(60);                                                                          //frameRate*

  // Enter Your Setup Code Here
  //1
  door1=loadImage("img/door1.jpg");
  door1OpenHover=loadImage("img/door1OpenHover.jpg");
  
  title=loadImage("img/title.png");
  bgA=loadImage("img/bgA.png");
  door=loadImage("img/door.png");
  doorDark=loadImage("img/doorDark.png");
  table=loadImage("img/table.png");
  candle=loadImage("img/candle.png");
  picture=loadImage("img/picture.png");
  ghost=loadImage("img/ghost.png");

  dioDown1=loadImage("img/dioDown.png");
  dioIdle1=loadImage("img/dioIdle.png");
  dioLeft1=loadImage("img/dioLeft.png");
  dioRight1=loadImage("img/dioRight.png");
  dioUp1=loadImage("img/dioUp.png");
  
  startHovered=loadImage("img/startHovered.png");
  startNormal=loadImage("img/startNormal.png");
  restartHovered=loadImage("img/restartHovered.png");
  restartNormal=loadImage("img/restartNormal.png");  
  gameover=loadImage("img/gameover.png");
  win=loadImage("img/win.png");
  
  //2
  bg=loadImage("img/storage.png");
  doorB=loadImage("img/doorB.jpg");
  door2OpenHover=loadImage("img/door2OpenHover.jpg");
  doorInside=loadImage("img/doorInside.png");
  box=loadImage("img/box.png");
  money=loadImage("img/money.png");
  priest=loadImage("img/priest.png");
  priestUp=loadImage("img/priestBack.png");

  dioDown2=loadImage("img/dioDown.png");
  dioIdle2=loadImage("img/dioIdle.png");
  dioLeft2=loadImage("img/dioLeft.png");
  dioRight2=loadImage("img/dioRight.png");
  dioUp2=loadImage("img/dioUp.png");

  startHovered2=loadImage("img/startHovered.png");
  startNormal2=loadImage("img/startNormal.png");
  restartHovered2=loadImage("img/restartHovered.png");
  restartNormal2=loadImage("img/restartNormal.png");  
  title2=loadImage("img/title.png");
  gameover2=loadImage("img/gameover2.png");
  
  //3
  bg3=loadImage("img/bg3.png");
  cross1=loadImage("img/cross1.png");
  cross0=loadImage("img/cross0.png");
  bone=loadImage("img/bone.png");
  boneLeft=loadImage("img/boneLeft.png");
  boneRight=loadImage("img/boneRight.png");
  vampireLeft=loadImage("img/vampireLeft.png");
  vampireRight=loadImage("img/vampireRight.png");
  dioUp3=loadImage("img/dioUp.png");
  dioDown3=loadImage("img/dioDown.png");
  dioIdle3=loadImage("img/dioIdle.png");
  dioLeft3=loadImage("img/dioLeft.png");
  dioRight3=loadImage("img/dioRight.png");
  
  doorC=loadImage("img/doorC.png");
  doorO=loadImage("img/doorO.png");
  doorRight=loadImage("img/doorRight.png");
  door3=loadImage("img/door3.png");
  door3Hover=loadImage("img/door3Hovered.png");
  startHovered3=loadImage("img/startHovered.png");
  startNormal3=loadImage("img/startNormal.png");
  restartHovered3=loadImage("img/restartHovered.png");
  restartNormal3=loadImage("img/restartNormal.png");  
  title3=loadImage("img/title.png");
  gameover3=loadImage("img/gameover3.png");
  gameover4=loadImage("img/gameover4.png");
  win03=loadImage("img/win03.png");

////1
   ghost3X =  200;
   ghost5X =  400;
   ghost7X =  600;
   ghost3Y =  0;      
   ghost5Y =  0; 
   ghost7Y =  0; 
   ghostSpeed3Y = int(random(2,6));    
   ghostSpeed5Y = int(random(2,6));  
   ghostSpeed7Y = int(random(2,6));  
                                               
      
  dioX1 = 100;
  dioY1 = 500; 
  
  ////2
   priestX =  priestLocationX * 100;
   priestY =  priestLocationY * 100;                                      
   priestSpeedY = 3;                                                                   
                                                 //cabbage status
       
      
  dioX2 = 400;
  dioY2 = 100;  
  
  
  ////3
  crossCol = new int[7];
  crossRow = new int[7];
  crossHealth = new int[7];
  boneShowDuration = new int[7];
  boneX = new int[7];
  boneY = new int[7];
  boneDirection = new int[7];
  boneType = new int[7];
  boneSpeedX = new int[7];
  
  init_dior_cross_bone();
}

void init_dior_cross_bone() {
  //inital dior  
  x = PLAYER_INIT_X;
  y = PLAYER_INIT_Y;
  col = (int) x / SOIL_SIZE;
  row = (int) y / SOIL_SIZE;
  moveTimer = 0;
  //initial cross and bone
  crossCol[0] = 2;
  crossRow[0] = 1;
  crossCol[1] = 4;
  crossRow[1] = 1;
  crossCol[2] = 3;
  crossRow[2] = 2;
  crossCol[3] = 2;
  crossRow[3] = 3;
  crossCol[4] = 4;
  crossRow[4] = 3;
  crossCol[5] = 6;
  crossRow[5] = 2;
  crossCol[6] = 6;
  crossRow[6] = 4;

  boneX[0] = crossCol[0]*100;
  boneY[0] = crossRow[0]*100;
  boneX[1] = crossCol[1]*100;
  boneY[1] = crossRow[1]*100;
  boneX[2] = crossCol[2]*100;
  boneY[2] = crossRow[2]*100;
  boneX[3] = crossCol[3]*100;
  boneY[3] = crossRow[3]*100;  
  boneX[4] = crossCol[4]*100;
  boneY[4] = crossRow[4]*100;
  boneX[5] = crossCol[5]*100;
  boneY[5] = crossRow[5]*100;
  boneX[6] = crossCol[6]*100;
  boneY[6] = crossRow[6]*100;
  
  for (int i=0; i<7; i++) {
    crossHealth[i] = 1;
    boneShowDuration[i] = 60;
    boneDirection[i] = 0;
    boneType[i] = 0;
  }
}


void draw() {
  /* ------ Debug Function ------ 

    Please DO NOT edit the code here.
    It's for reviewing other requirements when you fail to complete the camera moving requirement.

  */
  if (debugMode) {
    pushMatrix();
    translate(0, cameraOffsetY);
  }
  /* ------ End of Debug Function ------ */
  switch(gameState){
    case GAME_FISRT_ANIMA:
    image(title,0,0,800,600);
            if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT  && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){ 
        image(startHovered,BUTTON_LEFT,BUTTON_TOP);                                                         //BUTTON status
        if(mousePressed){
          HP=1;
          SP=0;
          gameState=GAME_START_A;          //BUTTON Click gameState to GAME_RUN
          mousePressed = false;
        }    
      }else{
        image(startNormal,BUTTON_LEFT,BUTTON_TOP);
      }
    break;
    case GAME_START_A:
      
      image(door1,0,0,800,600);
      if(mouseX > OPENDOOR_LEFT && mouseX < OPENDOOR_RIGHT  && mouseY > OPENDOOR_TOP && mouseY < OPENDOOR_BOTTOM){ 
        image(door1OpenHover,0,0);                                                         //BUTTON status
        if(mousePressed) {HP=1;SP=0; gameState=GAME_RUN_A; mousePressed = false;}                                                                //BUTTON Click gameState to GAME_RUN
     }
   
    break;
    case GAME_RUN_A:
    
      image(bgA,0,0,800,600);
      
      image(door,0,300);
      
      //draw table
      image(table,table1X,table1Y);
      image(table,table2X,table2Y);
      image(table,table3X,table3Y);
      image(table,table4X,table4Y);      //draw table
       
      //draw candle
      for(int i=0;i<12;i++){
    float x=candleX[i];
    float y=candleY[i];
    image(candle,x,y);
       //candle collision
       if (isHit ( dioX1, dioY1, dioX1+space , dioY1+space ,candleX[i],candleY[i], candleX[i] +  space, candleY[i] + space)==true){
             candleX[i] = candleY[i] = -1000;
             SP++;
       }
      }
     
      if (isActive==false) dioState=dio_IDLE1;
      
      switch(dioState) {
        case dio_IDLE1:
          image(dioIdle1, dioX1, dioY1); 
        break;
        case dio_LEFT1:
            
            if((frameCount-nowframeCount)<=15) {
              if ((frameCount-nowframeCount)%3==0)
                dioX1-=20;
              image(dioLeft1, dioX1, dioY1);                                                  //dioLeft status
            }
            else {
              isActive=false;
            }
        break;
        case dio_RIGHT1:
            //draw bg

            if((frameCount-nowframeCount)<=15) {
              if ((frameCount-nowframeCount)%3==0)
                dioX1+=20;
              image(dioRight1, dioX1, dioY1);
              
            }
            else {
              isActive=false;
            }
        break;
        case dio_DOWN1:
             //draw bg

            if((frameCount-nowframeCount)<=15) {
              if ((frameCount-nowframeCount)%3==0)
                dioY1+=20;
              image(dioDown1, dioX1, dioY1);
              
            }
            else {
              isActive=false;
            }
         break;
         case dio_UP1:
             //draw bg

            if((frameCount-nowframeCount)<=15) {
              if ((frameCount-nowframeCount)%3==0)
                dioY1-=20;
              image(dioUp1, dioX1, dioY1);
              
            }
            else {
              isActive=false;
            }
         break;
      }
      
      //draw picture
      image(picture,ghost3X,pictureY);
      image(picture,ghost5X,pictureY);
      image(picture,ghost7X,pictureY);
      
   
      //draw ghost
      
       ghost5Y+=ghostSpeed5Y; 
       if(gameTimer>120){
         image(ghost, ghost3X, ghost3Y); 
         ghost3Y+=ghostSpeed3Y;   
       }
       image(ghost, ghost5X, ghost5Y); 
       if(gameTimer>300){
         image(ghost, ghost7X, ghost7Y); 
         ghost7Y+=ghostSpeed7Y; 
       }
       if(ghost3Y>600)ghost3Y=0;
       if(ghost5Y>600)ghost5Y=0;
       if(ghost7Y>600)ghost7Y=0;
       
 
      //ghost collision detect
      if(dioX1<ghost3X+100 && dioX1+100>ghost3X && dioY1<ghost3Y+100 && dioY1+100>ghost3Y) {
        ghostCollision=true;
        dioState = dio_IDLE1;
        isActive=false;
        dioX1 = 100;
        dioY1 = 500;
        HP--; 
      }
      if(dioX1<ghost5X+100 && dioX1+100>ghost5X && dioY1<ghost5Y+100 && dioY1+100>ghost5Y) {        //soldier collision condition
        ghostCollision=true;
       dioState = dio_IDLE1;
        isActive=false;
        dioX1 = 100;
        dioY1 = 500;
        HP--; 
      }
      if(dioX1<ghost7X+100 && dioX1+100>ghost7X && dioY1<ghost7Y+100 && dioY1+100>ghost7Y) {        //soldier collision condition
        ghostCollision=true;
       dioState = dio_IDLE1;
        isActive=false;
        dioX1 = 100;
        dioY1 = 500;
        HP--; 
      }
      
      if(dioY1==400 ){
        image(table,table4X,table4Y);
        for(int i=0;i<12;i++){
    float x=candleX[i];
    float y=candleY[i];
    image(candle,x,y);
       //money collision
       if (isHit ( dioX1, dioY1, dioX1+space , dioY1+space ,candleX[i],candleY[i], candleX[i] +  space, candleY[i] + space)==true){
             candleX[i] = candleY[i] = -1000;
             SP++;
       }
      } image(ghost, ghost3X, ghost3Y); 
        image(ghost, ghost5X, ghost5Y); 
        image(ghost, ghost7X, ghost7Y); 
      }
      if(dioY1==300){
        image(table,table3X,table3Y);
        for(int i=0;i<12;i++){
    float x=candleX[i];
    float y=candleY[i];
    image(candle,x,y);
       //ghost collision
       if (isHit ( dioX1, dioY1, dioX1+space , dioY1+space ,candleX[i],candleY[i], candleX[i] +  space, candleY[i] + space)==true){
             candleX[i] = candleY[i] = -1000;
             SP++;
       }
      }
        image(ghost, ghost3X, ghost3Y); 
        image(ghost, ghost5X, ghost5Y); 
        image(ghost, ghost7X, ghost7Y); 
      }
      if(dioY1==200){
        image(table,table2X,table2Y);
        for(int i=0;i<12;i++){
    float x=candleX[i];
    float y=candleY[i];
    image(candle,x,y);
       //money collision
       if (isHit ( dioX1, dioY1, dioX1+space , dioY1+space ,candleX[i],candleY[i], candleX[i] +  space, candleY[i] + space)==true){
             candleX[i] = candleY[i] = -1000;
             SP++;
       }
      }
        image(ghost, ghost3X, ghost3Y); 
        image(ghost, ghost5X, ghost5Y); 
        image(ghost, ghost7X, ghost7Y); 
      }
     
       //timer
       gameTimer--;
       //drawTimerUI();
      if(HP<1) gameState = GAME_Fail_A ;     
      if(SP>=0) {
        image(doorDark,0,300); 
        if(dioX1==100 && dioY1==500)gameState = GAME_START_B;
      }//GAME_OVER condition
    break;
   
    case GAME_Fail_A :                                                                                                      //GAME_OVER status
      image(gameover, 0, 0);
      image(restartNormal,BUTTON_LEFT,BUTTON_TOP);
      if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT  && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(restartHovered,BUTTON_LEFT,BUTTON_TOP);
        if(mousePressed) {HP=1;SP=0;mousePressed = false;initGame(); gameState=GAME_START_A;}                                                  //GAME_RUN reset life
      }
    break;
    
     case GAME_START_B:
      
      image(doorB,0,0,800,600);
      if(mouseX > 300 && mouseX < 500  && mouseY > OPENDOOR_TOP && mouseY < OPENDOOR_BOTTOM){ 
        image(door2OpenHover,0,0);                                                         //BUTTON status
        if(mousePressed) {HP2=1;SP2=0; gameState=GAME_RUN_B; mousePressed = false;}                                                                //BUTTON Click gameState to GAME_RUN
     }
      break;
      
      case GAME_RUN_B:
      //int HP=1;
      image(bg,0,0,800,600);
     
      if (isActive2==false) dioState2=dio_IDLE2;
      //draw box
      for(int i=0;i<10;i++){
        float x=boxX[i];
        float y=boxY[i];
        image(box,x,y);
      }
      
      switch(dioState2) {
        case dio_IDLE2:
          image(dioIdle2, dioX2, dioY2); 
        break;
        case dio_LEFT2:
            
            
            if((frameCount-nowframeCount2)<=15) {
              if ((frameCount-nowframeCount2)%3==0)
                dioX2-=20;
              image(dioLeft2, dioX2, dioY2);                                                  //dioLeft status
            }
            else {
              isActive2=false;
            }
        break;
        case dio_RIGHT2:
            //draw bg

            //image(bg,0,0,800,600);
            if((frameCount-nowframeCount2)<=15) {
              if ((frameCount-nowframeCount2)%3==0)
                dioX2+=20;
              image(dioRight2, dioX2, dioY2);
              
            }
            else {
              isActive2=false;
            }
        break;
        case dio_DOWN2:
             if((frameCount-nowframeCount2)<=15) {
              if ((frameCount-nowframeCount2)%3==0)
                dioY2+=20;
              image(dioDown2, dioX2, dioY2);
              
            }
            else {
              isActive2=false;
            }
                   for(int i=0;i<10;i++){
      if (isHide ( dioX2, dioY2+100, dioX2+space2 , dioY2+space2+100 ,boxX[i],boxY[i],boxX[i] +  space2, boxY[i] + space2)==true){
          isActive2=false;
             }else{
               isHide=false;
             }
      }
         break;
         case dio_UP2:
             //draw bg

            if((frameCount-nowframeCount2)<=15) {
              if ((frameCount-nowframeCount2)%3==0)
                dioY2-=20;
              image(dioUp2, dioX2, dioY2);
              
            }
            else {
              isActive2=false;
            }
            for(int i=0;i<10;i++){
      if (isHide ( dioX2, dioY2, dioX2+space2 , dioY2+space2 ,boxX[i],boxY[i],boxX[i] +  space2, boxY[i] + space2)==true){
          isActive2=false;
               }else{
               isHide=false;
             }
      }
         break;
      }
        //draw money
      for(int i=0;i<14;i++){
    float x=moneyX[i];
    float y=moneyY[i];
    image(money,x,y);
       //money collision
       if (isHit ( dioX2, dioY2, dioX2+space2 , dioY2+space2 ,moneyX[i],moneyY[i], moneyX[i] +  space2, moneyY[i] + space2)==true){
             moneyX[i] = moneyY[i] = -1000;
             SP2++;
       }

      }
   
      //draw priest
      
       if(isPlay){
        image(doorInside,400,2);
          priestY+=priestSpeedY;                                                                            
          if(priestY+100>=600||priestY<=0)priestSpeedY*=-1;
        if (priestSpeedY > 0 ) {
        image(priest, priestX,priestY); 
      } else {
        image(priestUp, priestX,priestY); 
      }
          if(priestSpeedY<0&&priestY<=50){
            isPlay=false;
            priestY=0;
            priestSpeedY*=-1;
          }
         }
         
         if(gameTimer2%600==0&&gameTimer2/60>=5){  
       isPlay = true;
        }
      
 
      //priest collision detect
      if(dioX2<priestX+100 && dioX2+100>priestX && dioY2<priestY+100 && dioY2+100>priestY) {        //soldier collision condition
        priestCollision=true;
       dioState2 = dio_IDLE2;
        isActive=false;
        dioX2 = 400;
        dioY2 = 100;
  
        //println(soldierLocationY);
        priestY = 100+priestLocationY * 100; 
        HP2--; 
      }
      
      //movement limit
    
         for(int i=0;i<10;i++){
           if(isPlay==true){
    if (sameplace(boxX[1],boxY[1])==true||sameplace(boxX[2],boxY[2])==true||sameplace(boxX[3],boxY[3])==true||sameplace(boxX[4],boxY[4])==true||sameplace(boxX[5],boxY[5])==true||sameplace(boxX[6],boxY[6])==true||sameplace(boxX[7],boxY[7])==true||sameplace(boxX[8],boxY[8])==true||sameplace(boxX[9],boxY[9])==true||sameplace(boxX[0],boxY[0])==true){
    break;
    }else{
       gameState=GAME_Fail_B;
      }
           }
         }
      
      //collect all money
      if(SP>14){image(doorInside,400,2);}
      
       //timer
       gameTimer2++;
       drawTimerUI();
      if(HP2<1) gameState = GAME_Fail_B;     
      if(SP2>=2&&dioX2==400) gameState = GAME_START_C;      //GAME_OVER condition
      break;
      
      case GAME_Fail_B:
      image(gameover2, 0, 0);
      image(restartNormal2,BUTTON_LEFT,BUTTON_TOP);
      if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT  && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(restartHovered2,BUTTON_LEFT,BUTTON_TOP);
        if(mousePressed) {
        HP2=1;SP2=0;mousePressed = false;initGame2();
        moneyX=initmoneyX; moneyY=initmoneyY;priestY=0;gameState=GAME_START_A;
      }                                                  //GAME_RUN reset life
      }
      break;
      case GAME_START_C:
      image(door3,0,0,800,600);
      init_dior_cross_bone();
      if(mouseX > 550 && mouseX < 750  && mouseY > 200 && mouseY < 600){ 
        image(door3Hover,0,0);                                                         //BUTTON status
        if(mousePressed) {HP3=1;SP3=0;x=PLAYER_INIT_X;y=PLAYER_INIT_Y; gameState=GAME_RUN_C;}                                                                //BUTTON Click gameState to GAME_RUN
     }
      break;
      case GAME_RUN_C:
      PImage dioDisplay3 = dioIdle3;
      image(bg3,0,0,800,600);
      if(SP3<7)
        image(doorC,500,0);
      else {
        image(doorO,500,0);
        image(doorRight,0,300);
      }
      //draw cross
      for (int i=0; i<7; i++) {
        if (crossHealth[i] < 1) { //crossHealth=0 : cross be hit
          image(cross0, crossCol[i]*SOIL_SIZE, crossRow[i]*SOIL_SIZE);
          if  (crossHealth[i] < 0) { //crossHealth=-1 : cross be hit and player leave cross
            if (boneDirection[i] == 0) { // boneDirection=0 : unknow boneDirection;
              if (col*100 > boneX[i])
                boneDirection[i] = 1; // boneDirection 1 : Right -1 : Left
              else
                boneDirection[i] = -1;
            }
            if (boneShowDuration[i] > 0) {
              //Bone flash effect
              if ((boneShowDuration[i]<60 && boneShowDuration[i]>50) || (boneShowDuration[i]<40 && boneShowDuration[i]>30) || (boneShowDuration[i]<35 && boneShowDuration[i]>25)) {
                if (boneType[i] == 1 ) { // boneType = 1 -> show bone flash; boneDirection = 1 -> show right
                  if (boneDirection[i] == 1) 
                    image(boneRight, crossCol[i]*SOIL_SIZE, crossRow[i]*SOIL_SIZE);
                  else
                    image(boneLeft, crossCol[i]*SOIL_SIZE, crossRow[i]*SOIL_SIZE);
                }
                else  if (boneType[i] == 2) { // boneType = 2 -> Show vampire flash; boneDirection = 1 -> show right
                  if (boneDirection[i] == 1)
                    image(vampireRight, crossCol[i]*SOIL_SIZE, crossRow[i]*SOIL_SIZE);
                  else
                    image(vampireLeft, crossCol[i]*SOIL_SIZE, crossRow[i]*SOIL_SIZE);
                }
              }
              boneShowDuration[i]--;
            }
            if (boneShowDuration[i] == 0) { //Bone Run
              if (boneType[i] == 1) { //Bone run right
                if (boneDirection[i] == 1) {
                  boneX[i] += boneSpeedX[i];
                  image(boneRight, boneX[i]%width, boneY[i]);
                }
                else { //Bone run reft
                  boneX[i] -= boneSpeedX[i];
                  if (boneX[i]<0)
                    boneX[i]=width;
                  image(boneLeft, boneX[i], boneY[i]);
                }
              }
              else if (boneType[i] == 2) { // Vampire Run
                if (boneDirection[i] == 1) {
                  boneX[i] += boneSpeedX[i];
                  image(vampireRight, boneX[i]%width, boneY[i]);
                }
                else {
                  boneX[i] -= boneSpeedX[i];
                  if (boneX[i]<0)
                    boneX[i]=width;
                  image(vampireLeft, boneX[i], boneY[i]);
                }
              }
            }
          }
        }
        else {
          image(cross1, crossCol[i]*SOIL_SIZE, crossRow[i]*SOIL_SIZE);
        }
        if (boneType[i] >0 && isHit3(boneX[i], boneY[i], col*100, row*100))
          HP3--;
      }

      //setting dior moveTimer/mvoeDirection/diorDisplay
      if(moveTimer == 0){
        dioDisplay3 = dioDown3;
        if(leftState3) {
          if (col>1) {
            dioDisplay3 = dioLeft3;
            moveDirection = LEFT;
            moveTimer = moveDuration;
          }
        }else if(rightState3){
          if (col < 7) {
            dioDisplay3 = dioRight3;
            moveDirection = RIGHT;
            moveTimer = moveDuration;
          }
        }else if(upState3){
          if (row >0) {
            dioDisplay3 = dioUp3;
            moveDirection = UP;
            moveTimer = moveDuration;
          }
        }else if(downState3){
          if (row<5) {
            dioDisplay3 = dioDown3;
            moveDirection = DOWN;
            moveTimer = moveDuration;
          }
        }
      }else{
        switch(moveDirection){
          case LEFT:  dioDisplay3 = dioLeft3;  break;
          case RIGHT:  dioDisplay3 = dioRight3;  break;
          case DOWN:  dioDisplay3 = dioDown3;  break;
          case UP:  dioDisplay3 = dioUp3;  break;
        }
      }
      
      image(dioDisplay3, x, y);

      if(moveTimer > 0){
        moveTimer --;
        switch(moveDirection){
          case LEFT:
            dioDisplay3 = dioLeft3;
            if(moveTimer == 0){
              col--;
              x = SOIL_SIZE * col;
            }else{
              x = (float(moveTimer) / moveDuration + col - 1) * SOIL_SIZE;
            }
          break;
          case RIGHT:
            dioDisplay3 =dioRight3;
            if(moveTimer == 0){
              col++;
              x = SOIL_SIZE * col;
            }else{
              x = (1f - float(moveTimer) / moveDuration + col) * SOIL_SIZE;
            }
          break;
          case DOWN:
            dioDisplay3 = dioDown3;
            if(moveTimer == 0){
              row++;
              y = SOIL_SIZE * row;
            }else{
              y = (1f - float(moveTimer) / moveDuration + row) * SOIL_SIZE;
            }
          break;
          case UP:
            dioDisplay3 = dioUp3;
            if(moveTimer == 0){
              row--;
              y = SOIL_SIZE * row;
            }else{
              y = (float(moveTimer) / moveDuration + row - 1) * SOIL_SIZE;
            }
          break;
        }
      }
      //hit cross detect
      for (int i=0; i<crossHealth.length; i++) {
        if (crossHealth[i]==1 && isHit3(crossCol[i]*100, crossRow[i]*100, col*100, row*100)) { //dio on cross
          crossHealth[i]=0;
          SP3++;
        }
        if (crossHealth[i]==0 && !isHit3(crossCol[i]*100, crossRow[i]*100, col*100, row*100)) {//dio leave cross
          crossHealth[i]=-1;
          boneType[i]= int(random(1,3));
          if (boneType[i] == 2) boneSpeedX[i] = vampireSpeed;
          else boneSpeedX[i] = boneSpeed;
        }
      }
  
      if(HP3<1) gameState = GAME_Fail_C;                                                                                      //GAME_OVER condition
      if(SP3==7 && HP3>0) {
        if(col==5 && row==0)
          gameState = GAME_Fail_D;
        if(col==1 && row==5)
          gameState = GAME_WIN_C;
      }

      break;
      case GAME_WIN_C:
      image(win03, 0, 0);
      break;
      case GAME_Fail_C:
      image(gameover3, 0, 0);
      image(restartNormal3,BUTTON_LEFT,BUTTON_TOP);
      if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT  && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(restartHovered3,BUTTON_LEFT,BUTTON_TOP);
        if(mousePressed) {HP3=1;SP3=0;x=PLAYER_INIT_X;y=PLAYER_INIT_Y; gameState=GAME_START_A;}                                                  //GAME_RUN reset
      }
      break;
      case GAME_Fail_D:
      image(gameover4, 0, 0);
      image(restartNormal3,BUTTON_LEFT,BUTTON_TOP);
      if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT  && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(restartHovered3,BUTTON_LEFT,BUTTON_TOP);
        if(mousePressed) {HP3=1;SP3=0;x=PLAYER_INIT_X;y=PLAYER_INIT_Y; gameState=GAME_START_A;}                                                  //GAME_RUN reset
        }
      break;
  }
}

void drawTimerUI(){
  String timeString = convertFramesToTimeString (gameTimer2);
  if(gameTimer2/60%10==8||gameTimer2/60%10==9||gameTimer2/60%10==0&&gameTimer2/60>=5){
    textSize(50);
  textAlign(LEFT, BOTTOM);
  fill(0,240);
  text(timeString,13, height +3);
  fill(#fff222);
  text(timeString, 10, height);
  }else{
  textSize(50);
  textAlign(LEFT, BOTTOM);
  fill(0, 240);
  text(timeString,13, height +3);
  fill(#ffffff);
  text(timeString, 10, height);
  }
  }
  
String convertFramesToTimeString(int frames){  // Requirement #4
 int num,ber;
 num=frames/60/60;
 //println(num);
 ber=(frames/60)%60;
 
 String frontNum=nf(num,2);
 String backNum=nf(ber,2);
 
  return frontNum+":"+backNum;
}

boolean isHide(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
 if(ax==bx && aw==bw && ay==by && ah==bh){  
 return true;                // Requirement #3
 }else{
 return false;
 }
 }
boolean sameplace (float bx,float by){
       if(dioX2==bx&&dioY2==by){
         return true;                // Requirement #3
 }else{
 return false;
 }
     }
     
boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
 if(ax<bw && aw>bx && ay<bh && ah>by){  
 return true;                // Requirement #3
 }else{
 return false;
 }
 }

void keyPressed(){  //path control
    if (!isActive) {
      switch(keyCode){
        case DOWN:
        if (dioY1 < height-100 && dioX1<200) {
          isActive = true;
          dioState = dio_DOWN1;
          nowframeCount=frameCount;
        }
        else dioState = dio_IDLE1;
        break;
        case UP:
        if (dioY1 > 200 && dioX1<200) {
          isActive = true;
          dioState = dio_UP1;
          nowframeCount=frameCount;
        }
        else dioState = dio_IDLE1;
        break;
        case RIGHT:
        if (dioX1 < width-100) {
          isActive = true;
          dioState = dio_RIGHT1;
          nowframeCount=frameCount;
        }
        else dioState = dio_IDLE1;
        break;
        case LEFT:
        if (dioX1 > 100) {
          isActive = true;
          dioState = dio_LEFT1;
          nowframeCount=frameCount;
        }
        else dioState = dio_IDLE1;
        break;
      }
    }
  if (!isActive2) {
      switch(keyCode){
        case DOWN:
        if (dioY2 < height-100) {
          isActive2 = true;
          dioState2 = dio_DOWN2;
          nowframeCount2=frameCount;
        }
        else dioState2 = dio_IDLE2;
        break;
        case UP:
        if (dioY2 > 100) {
          isActive2 = true;
          dioState2 = dio_UP2;
          nowframeCount2=frameCount;
        }
        else dioState2 = dio_IDLE2;
        break;
        case RIGHT:
        if (dioX2 < width-100) {
          isActive2 = true;
          dioState2 = dio_RIGHT2;
          nowframeCount2=frameCount;
        }
        else dioState2 = dio_IDLE2;
        break;
        case LEFT:
        if (dioX2 > 0) {
          isActive2 = true;
          dioState2 = dio_LEFT2;
          nowframeCount2=frameCount;
        }
        else dioState2 = dio_IDLE2;
        break;
      }
    }
    if(key==CODED){
    switch(keyCode){
      case UP:
      upState3 = true;
      break;
      case LEFT:
      leftState3 = true;
      break;
      case RIGHT:
      rightState3 = true;
      break;
      case DOWN:
      downState3 = true;
      break;
    }
  }else if(key == 'r'){
   if(HP3>0)HP3 --;
      print(HP3);
  }
      switch(key){
      case 'z':
      if(SP3>0)SP3 --;
      print(SP3);
      break;
      case 'x':
       if(SP3<7)SP3++;
      print(SP3);
      break;
    }
}

void keyReleased(){
  switch(keyCode){
    case UP:
    upPressed = false;
    upPressed2 = false;
    upPressed3 = false;
    break;
    case DOWN:
    downPressed = false;
    downPressed2 = false;
    downPressed3= false;
    break;
    case RIGHT:
    rightPressed = false;
    rightPressed2 = false;
    rightPressed3 = false;
    break;
    case LEFT:
    leftPressed = false;
    leftPressed2 = false;
    leftPressed3 = false;
    break;
  }
  if(key==CODED){
    switch(keyCode){
      case UP:
      upState3 = false;
      break;
      case LEFT:
      leftState3 = false;
      break;
      case RIGHT:
      rightState3 = false;
      break;
      case DOWN:
      downState3 = false;
      break;
    }
  }
}


boolean isHit3(float ax, float ay, float bx, float by){
  if (ax + SOIL_SIZE > bx
     && ax < bx + SOIL_SIZE
     && ay + SOIL_SIZE > by
     && ay < by + SOIL_SIZE
     )  
    return true;
  else 
    return false;
}
