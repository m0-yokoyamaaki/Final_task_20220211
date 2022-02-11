PShape moguran;
PShape moguran2;
PShape moguran3;
PShape moguran4;
PShape moguran5;

int scene = 0;
int base = 200;

int armW = 80;
int arm1L = 600;
int arm2L = 400;
int arm3L = 400;
int arm4L = 300;
int head = 200;
int headW = 100;

int jointW = 150;

int mogura = 1;
int face = 1;

int point = 0;
int p = 0;

int e = 0;


float i1 =0;
float i2=0;
float i3=0;
float i4=0;
int d = 100;
float k1 =0;
float k2 =0;
float headX = 0;
float headY = 0;
float headZ = 0;

float moguraX = 0;
float moguraY = 0;
float moguraZ = 0;

void setup(){
size(1350,700,P3D);
frameRate(30);
lights();
 camera(500, 100, 1500, 500, 300, 0, 0, 0, 1); 
  moguran = loadShape("moguran.obj");
  moguran2 = loadShape("moguran2.obj");
   moguran3 = loadShape("moguran3.obj");
   moguran4 = loadShape("moguran4.obj");
   moguran5 = loadShape("moguran5.obj");
   moguran.scale(55);
   moguran2.scale(55);
   moguran3.scale(55);
   moguran4.scale(80);
   moguran5.scale(80);
}

void draw(){
 background(0);
  textAlign(CENTER,CENTER);
  
  if(scene==0){
  fill(250,0,0);
  textSize(400);
  text("Moguratataki!",width/2,height/5);
  textSize(300);
  text("Type A to NEXT",width/2,4*height/5);
  textSize(150);
  text("End:Esc",width,3*height/2);
  pushMatrix();
  translate(-width/2,height,200);
   rotateX(PI);
 rotateY(PI);
 rotateZ(PI/4);
  shape(moguran);
  popMatrix();
  }
  
  if(scene==1){
    fill(250,0,0);
     textSize(300);
    text("Type A to START",width/2,height/2);
    textSize(150);
  text("End:Esc",width,3*height/2);
  }
  
 if(scene>=2){
  background(0);
 float s = random(1);
float t = random(1);

 fill(250,0,0);
  textSize(100);
   textAlign(LEFT,CENTER);
   text("Mouse",-width/2,-7*height/10,-50);
  text("Left Click : hit",-width/2,-6*height/10,-50);
   text("Middle or Right drag : Move arm position",-width/2,-5*height/10,-50);
   text("E : Show aim",-width/2,-4*height/10,-50);
  text("End : Esc",-width/2,-3*height/10,-50);
  
  

  if(p==1){
 pushMatrix();
 translate(headX,headY,headZ);
 noStroke();
 fill(255,0,0);
 sphere(50);
 popMatrix();
 }
 
  pushMatrix();
  translate(width/2, height, -300);
  fill(200);
 stroke(150);
  box(base,base,base);
   translate(0, -arm1L/2, 0);
   rotateY(i1);
   box(armW, arm1L, armW);
   translate(0,-arm1L/2,0);
   box(jointW,jointW,jointW);
   rotateZ(i2);
   translate(-arm2L/2,0,0);
   box(arm2L,armW,armW);
   translate(-arm2L/2,0,0);
   rotateX(i3);
   box(jointW,jointW,jointW);
   translate(-arm3L/2,0,0);
   box(arm3L,armW,armW);
   translate(-arm3L/2,0,0);
   box(jointW,jointW,jointW);
  
   rotateZ(i4);
   translate(-arm4L/2,0,0);
   fill(238,160,87);
   box(arm4L,armW,armW);
   translate(-arm4L/2,0,0);
   fill(255,240,0);
   box(headW,head,headW);
  popMatrix();
  
 for(float i4a=0; i4a<PI/3;){
  i4a+=0.001;
  i4= i4a;
 }
 


 pushMatrix();
  translate(width/2-900,height+d/2,0);
  pushMatrix();
 noStroke();
  
  translate(0,d/2,0);
  fill(250);
  box(12000,200,12000);
  popMatrix();
  
   if (mogura ==1){
  rotateY(k1);
  rotateZ(k2);
  translate(0,-d,0);
  rotateZ(-k2*0.5);
 
  if(face<=4){
 shape(moguran);
  }
  if((face==5)||(face==6)||(face==7)){
 shape(moguran2);
  }
  if((face==8)||(face==9)){
 shape(moguran3);
  }
  
  
  
  k1+=0.05*s;
  k2+=0.2*t;
   }
  popMatrix();
 
  if(mogura==2){
  pushMatrix();
  translate(moguraX,moguraY,moguraZ);
   rotateX(PI);
 rotateY(PI);
  shape(moguran5);
  popMatrix();
  
  noLoop();
  e=1;
  textAlign(CENTER,CENTER);
  fill(0);
  face=0;
  textSize(150);
  text("Game Clear",width/2,2*height/4,800);
  textSize(100);
   text("A : ReStart",width/2,3*height/4,800);
   loop();
  }
  
  if(mogura==3){
     pushMatrix();
  translate(moguraX,moguraY,moguraZ);
  rotateX(PI);
 rotateY(PI);
 shape(moguran4);
  popMatrix();
  
  noLoop();
  e=2;
  textAlign(CENTER,CENTER);
  fill(0);
  textSize(150);
  text("Game Over",width/2,2*height/4,800);
   textSize(100);
   text("A : ReStart",width/2,3*height/4,800);
  loop();
  }
 }
  
}

void mouseDragged(){
  if(mouseButton==CENTER){
    i1 += (mouseX - pmouseX) * 0.01;
    i2 -= (mouseY - pmouseY) * 0.01;
  }
  if(mouseButton==RIGHT){
    i3 -= (mouseY - pmouseY)*0.01;
  }
  if(point==1){
    p = 1;
  }
  float s1 = sin(i1);
  float s2 = sin(-i2);
  float s3 = sin(i3);
  float c1 = cos(i1);
  float c2 = cos(-i2);
  float c3 = cos(i3);
  
   headX = width/2-(c1*c2*(arm2L+arm3L+arm4L)-c1*s2*c3*head/2-s2*c3*head/2);
   headY = height-(arm1L-s2*(arm2L+arm3L+arm4L)-c2*c3*head/2);
   headZ = -300+s1*c2*(arm2L+arm3L+arm4L)-s1*s2*c3*head/2+c1*s3*head/2;
  
}

void mouseClicked(){
  if(mouseButton==LEFT){
    i4 -=1; 
    
    float cm1 = cos(-k1);
    float cm2 = cos(k2);
    float sm1 = sin(-k1);
    float sm2 = sin(k2);
    moguraX = width/2-900-cm1*cm2*d;
    moguraY = height+d/2-cm2*d;
    moguraZ = sm1*sm2*d;
    float r = dist(headX,headY,headZ,moguraX,moguraY,moguraZ);
    if(r<=d){
      mogura=2;
    }
    if(r>d){
      face+=1;
      if(face==10){
        mogura=3;
      }
    }
    
    
  }
}

void keyTyped(){
  if((key=='a')||(key=='A')){
    scene+=1;
    if(((e==1)||(e==2))&&(scene>=2)){
      i1=0;
      i2=0;
      i3=0;
      i4=0;
      mogura=1;
      face=0;
      point=0;
      p=0;
      e=0;
      scene=1;
    }
  }
  if((key=='e')||(key=='E')){
    point=1;
  }
}
