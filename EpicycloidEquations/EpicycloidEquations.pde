// Parametric Equations Tutorial
// https://www.youtube.com/watch?v=LaarVR1AOvs
// https://archive.org/details/experimentsinmotiongraphics

static final int NUM_LINES = 10;
float a;
float b;
float c;
float t;
float din;

void setup(){
  background(51);
  size(500,500);
}

void draw(){
  background(51);
  stroke(255, 100);
  strokeWeight(3);
  translate(width/2, height/2);
  //rotate(t/10);
  a = 100;
  b = 50;
  c = 25;
  for (int i = 0; i < NUM_LINES; i++){
    line(x1(t + i), y1(t + i),x2(t + i), y2(t + i));
    //point(x1(t), y1(t));
    //point(x2(t), y2(t));
  }

  t+=0.1;
  din = noise(1.25 + t*0.02);
}

float x1(float t){
  // Epicycloid
  //return (a+b)*cos(t)-b*cos((a/b+1)*t);
  // Epitrochoid
  //return -(a+b)*cos(t) - c * cos((a / b + t) * t);
  //Archimedie Spiral
  return t * cos(t);
}

float y1(float t){
  // Epicycloid
  //return (a+b)*sin(t)-b*sin((a/b+1)*t);
  // Epitrochoid
  //return -(a+b)*sin(t) - c * sin((a / b + t) * t);
  //Archimedie Spiral
  return t * sin(t);
}

float x2(float t){
    // Epicycloid
  //return -(a+b)*sin(t)-b*sin((a/b+1)*t);
  // Epitrochoid
  //return -(a+b)*cos(t) - c * cos((a / b + t) * t);
    //Archimedie Spiral
  return -t * cos(t);
}

float y2(float t){
    // Epicycloid
  //return (a+b)*cos(t)-b*cos((a/b+1)*t);
  // Epitrochoid
  //return -(a+b)*sin(t) - c * sin((a / b + t) * t);
    //Archimedie Spiral
  return -t * sin(t);
}
