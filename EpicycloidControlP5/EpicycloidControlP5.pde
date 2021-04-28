// Parametric Equations Tutorial
// https://www.youtube.com/watch?v=LaarVR1AOvs
// https://archive.org/details/experimentsinmotiongraphics

import controlP5.*;

ControlP5 cp5;


int NUM_LINES = 10;
float A;
float B = 10;
float C = 5;
float t;
int speed;

Slider abc;


void setup(){
  background(51);
  size(500,500);
  
  cp5 = new ControlP5(this);
  
  cp5.addSlider("A")
     .setPosition(-(height/2)+30,-(width/2)+30)
     .setRange(0,250)
     .setValue(50)
     ;
  
  cp5.addSlider("B")
     .setPosition(-(height/2)+30,-(width/2)+50)
     .setRange(0,250)
     .setValue(10)
     ;
     
  cp5.addSlider("C")
     .setPosition(-(height/2)+30,-(width/2)+70)
     .setRange(0,250)
     .setValue(5)
     ;
    
  cp5.addSlider("Speed")
     .setPosition(-(height/2)+30,-(width/2)+90)
     .setRange(0,100)
     .setValue(10)
     ;
  
}

void draw(){
  background(51);
  stroke(255, 100);
  strokeWeight(3);
  translate(width/2, height/2);
  //rotate(t/10);
  //a = 50;
  //b = 50;
  //c = 25;
  for (int i = 0; i < NUM_LINES; i++){
    //line(x1(t + i), y1(t + i),x2(t + i), y2(t + i));
    point(x1(t), y1(t));
    point(x2(t), y2(t));
  }

  //t+=(speed/100);
  t+=0.01;
}

float x1(float t){
  // Epicycloid
  return (A+B)*cos(t)-B*cos((A/B+1)*t);
  // Epitrochoid
  //return -(a+b)*cos(t) - c * cos((a / b + t) * t);

}

float y1(float t){
  // Epicycloid
  return (A+B)*sin(t)-B*sin((A/B+1)*t);
  // Epitrochoid
  //return -(a+b)*sin(t) - c * sin((a / b + t) * t);

}

float x2(float t){
  // Epicycloid
  return -(A+B)*sin(t)-B*sin((A/B+1)*t);
  // Epitrochoid
  //return -(a+b)*cos(t) - c * cos((a / b + t) * t);

}

float y2(float t){
  // Epicycloid
  return (A+B)*cos(t)-B*cos((A/B+1)*t);
  // Epitrochoid
  //return -(a+b)*sin(t) - c * sin((a / b + t) * t);

}
