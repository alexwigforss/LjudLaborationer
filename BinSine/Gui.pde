import controlP5.*;

ControlP5 cp5;
Slider sl, sr;
//Numberbox nlMax,nlMin,nrMax,nrMin;
int col = color(55);
//int col = color(255);

boolean toggleValue = false;
Knob volKnob;

float leftMax=880,leftMin=22,rightMax = 880,rightMin = 22;
float lMax=440,lMin=22,rMax = 440,rMin = 22;
float leftSlideMax=440,leftSlideMin=440,rightSlideMax = 440,rightSlideMin = 440;
float lVal=440,rVal=440,lminVal = 55,rminVal = 22,lmaxVal = 440,rmaxVal = 440;
boolean started = false;
int unit;

void guiSetup() {
  textSize(32);
  textAlign(CENTER, CENTER);

  smooth();
  cp5 = new ControlP5(this);
  setupCp5();
}

void setupCp5(){
  PFont font = createFont("arial",20);
  unit = width / 16;
  int two_units = unit * 2, tri_units = unit * 3,
  four_units = unit * 4, ten_units = unit * 10, twelve_units = unit * 12;
  cp5.setAutoDraw(false);
  // volKnob = cp5.addKnob("knobValue")
  //              .setRange(0,200)
  //              .setValue(50)
  //              .setPosition(four_units,four_units)
  //              .setRadius(unit)
  //              .setNumberOfTickMarks(10)
  //              .setViewStyle(Knob.ELLIPSE)
  //              .setDragDirection(Knob.HORIZONTAL)
  //              .scrolled(-1)
  //              .setLabel("")
  //              .setFont(font)
  //              ;

  cp5.addNumberbox("leftMaxHz")
    .setPosition(0, 0)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(leftMin, leftMax)
    .setValue(lmaxVal)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("leftMinHz")
    .setPosition(0, height-two_units)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(leftMin, leftMax)
    .setValue(lminVal)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("rightMaxHz")
    .setPosition(width-tri_units, 0)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(rightMin, rightMax)
    .setValue(rminVal)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("rightMinHz")
    .setPosition(width-tri_units, height-two_units)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(rightMin, rightMax)
    .setValue(rminVal)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addToggle("toggle_left")
    .setPosition(tri_units, 0)
    .setSize(ten_units, tri_units)
    .setValue(false)
    .setLabelVisible(false)
    ;

  cp5.addToggle("toggle_right")
    .setPosition(tri_units, height-tri_units)
    .setSize(ten_units, tri_units)
    .setValue(false)
    .setLabelVisible(false) 
    ;     

  sl = cp5.addSlider("left_slider")
    .setPosition(0, two_units)
    .setSize(tri_units, twelve_units)
    .setRange(leftSlideMin, leftSlideMax)
    .setValue(lVal)
    //.setValue(55)
    .setNumberOfTickMarks(11)
    .showTickMarks(true)
    .setLabel("")
    .setFont(font)
    ;
  cp5.getController("left_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  sr = cp5.addSlider("right_slider")
    .setPosition(width-tri_units, two_units)
    .setSize(tri_units, twelve_units)
    .setRange(rightSlideMin, rightSlideMax)
    .setValue(55)
    .setNumberOfTickMarks(11)
    .showTickMarks(true)
    .setLabel("")
    .setFont(font)
    ;
  cp5.getController("right_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  started = true;
}

//void knobValue(int theValue){
//    amp = map(theValue, 0, 200, 0.000001, 1.0);
//}

void leftMaxHz(int theValue) {
  if(started && theValue > lMin){
  lMax = theValue;
  sl.setRange(leftSlideMin,theValue);
  cp5.getController("left_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  }
}

void leftMinHz(int theValue) {
  if(started && theValue < lMax){
  lMin = theValue;
  sl.setRange(theValue,leftSlideMax);
  cp5.getController("left_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  }
}

void rightMaxHz(int theValue) {
  if(started && theValue > rMin){
  rMax = theValue;
  sr.setRange(rightSlideMin,theValue);
  cp5.getController("right_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  }
}

void rightMinHz(int theValue) {
  if(started && theValue < rMax){
  rMin = theValue;
  sr.setRange(theValue,rightSlideMax);
  cp5.getController("right_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  }
}

void toggle_left(boolean theFlag) {
  if(started)  {
    if (theFlag==true) {
      lsine.play();
    } else {
      lsine.stop();
    }
  }
}

void toggle_right(boolean theFlag) {
  if(started)  {
    if (theFlag==true) {
      rsine.play();
    } else {
      rsine.stop();
    }
  }
}

void left_slider(float theValue) {
  if(started)  {
    left_frequency = theValue;
  }
}

void right_slider(float theValue) {
  if(started)  {
    right_frequency = theValue;
  }
}
