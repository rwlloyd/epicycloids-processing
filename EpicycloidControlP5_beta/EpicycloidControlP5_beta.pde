// Parametric Equations Tutorial
// https://www.youtube.com/watch?v=LaarVR1AOvs
// https://archive.org/details/experimentsinmotiongraphics

import controlP5.*;

int NUM_LINES = 10;

int a = 50;
int b = 50;
int c =20;

int sliderb = 10;
int sliderc = 5;
float t;
int sliderspeed = 10;

boolean lines;
boolean dots;
boolean wipe;

ControlP5 cp5;

void setup(){
  background(51);
  size(500,500);
  
  cp5 = new ControlP5(this);
  sliders();
  
  dots = false;
  lines = true;
  wipe = true;
}

void draw(){
  pushMatrix();
  if (wipe == true){
    background(51);
  }
  stroke(255, 100);
  strokeWeight(3);
  translate(width/2, height/2);
  ////rotate(t/10);

  for (int i = 0; i < NUM_LINES; i++){
    if(lines == true){
      line(x1(t), y1(t + i*t),x2(t), y2(t + i*t));
    }
    if (dots == true){
      point(x1(t), y1(t));
      point(x2(t), y2(t));
    }
  }

  ////t+=(speed/100);
  t+=0.01;
  popMatrix();
  
  if(mousePressed){
    background(51);
  }
  //println(a,b,c);
}

public void sliders() {
   cp5.addSlider("a")
     .setPosition(30,30)
     .setRange(0,250)
     ;
     
  cp5.addSlider("b")
     .setPosition(30,60)
     .setRange(0,250)
     ;
     
  cp5.addSlider("c")
     .setPosition(30,90)
     .setRange(0,250)
     ;
}

void keyPressed(){
 if(key == 'd'){
   dots = !dots;
 }
 if(key == 'l'){
   lines = !lines;  
 }
 if(key == 'b'){
   wipe = !wipe;  
 }
 if (key == CODED) {
   if (keyCode == UP) {
     NUM_LINES++;
   }  else if (keyCode == DOWN) {
        NUM_LINES--;
      }
   }
}

float x1(float t){
  // Epicycloid
  //return (a+b)*cos(t)-b*cos((a/b+1)*t);
  // Epitrochoid
  return (a+b)*cos(t) - c * cos((a / b + t) * t);

}

float y1(float t){
  // Epicycloid
  //return (a+b)*sin(t)-b*sin((a/b+1)*t);
  // Epitrochoid
  return (a+b)*sin(t) - c * sin((a / b + t) * t);

}

float x2(float t){
  // Epicycloid
  //return -(a+b)*sin(t)-b*sin((a/b+1)*t);
  // Epitrochoid
  return -(a+b)*cos(t) - c * cos((a / b + t) * t);

}

float y2(float t){
  // Epicycloid
  //return (a+b)*cos(t)-b*cos((a/b+1)*t);
  // Epitrochoid
  return -(a+b)*sin(t) - c * sin((a / b + t) * t);

}
