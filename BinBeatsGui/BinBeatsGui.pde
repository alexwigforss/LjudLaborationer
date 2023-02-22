/*
TODO Skicka Max Min Värden till finetunespakarna
*/
import controlP5.*;

ControlP5 cp5;
Slider sl, sr;
Numberbox nlMax,nlMin,nrMax,nrMin;
int col = color(255);

boolean toggleValue = false;
Knob volKnob;

int leftMax=440,leftMin=55,rightMax = 440,rightMin = 55;
int lMax=440,lMin=55,rMax = 440,rMin = 55;

boolean started = false;

void setup() {
  size(400, 400);
  //leftMax=440;leftMin=55;rightMax = 440;rightMin = 55;

  int unit = width / 16, two_units = unit * 2, tri_units = unit * 3,
  four_units = unit * 4, ten_units = unit * 10, twelve_units = unit * 12;

  PFont font = createFont("arial",20);
  smooth();
  cp5 = new ControlP5(this);

  volKnob = cp5.addKnob("knobValue")
               .setRange(0,200)
               .setValue(100)
               .setPosition(four_units,four_units)
               .setRadius(four_units)
               .setNumberOfTickMarks(10)
               .setViewStyle(Knob.ELLIPSE)
               .setDragDirection(Knob.HORIZONTAL)
               .scrolled(-1)
               .setLabel("")
               .setFont(font)
               ;
 //cp5.getController("knobValue").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM).setPaddingX(0);


  cp5.addNumberbox("leftMaxHz")
    .setPosition(0, 0)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(leftMin, leftMax)
    .setValue(leftMax)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("rightMaxHz")
    .setPosition(width-tri_units, 0)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(rightMin, rightMax)
    .setValue(rightMax)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("leftMinHz")
    .setPosition(0, height-two_units)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(leftMin, leftMax)
    .setValue(leftMin)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("rightMinHz")
    .setPosition(width-tri_units, height-two_units)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(rightMin, rightMax)
    .setValue(rightMin)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addToggle("toggle_left")
    .setPosition(tri_units, 0)
    .setSize(ten_units, tri_units)
    .setValue(true)
    .setLabelVisible(false) 
    ;

  cp5.addToggle("toggle_right")
    .setPosition(tri_units, height-tri_units)
    .setSize(ten_units, tri_units)
    .setValue(true)
    .setLabelVisible(false) 
    ;     

  sl = cp5.addSlider("left_slider")
    .setPosition(0, two_units)
    .setSize(tri_units, twelve_units)
    .setRange(leftMin, leftMax)
    .setValue(leftMax/2)
    .setNumberOfTickMarks(11)
    .showTickMarks(true)
    .setLabel("")
    .setFont(font)

    //.setLabelVisible(false)
    ;
  cp5.getController("left_slider").getValueLabel().align(ControlP5.RIGHT, ControlP5.TOP).setPaddingX(0);


  sr = cp5.addSlider("right_slider")
    .setPosition(width-tri_units, two_units)
    .setSize(tri_units, twelve_units)
    .setRange(rightMin, rightMax)
    .setValue(rightMax/2)
    .setNumberOfTickMarks(11)
    .showTickMarks(true)
    .setLabel("")
    .setFont(font)
    ;
  cp5.getController("right_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  started = true;
}


void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  fill(col);
  ellipse(0, 0, 40, 40);

  popMatrix();
}

void leftMaxHz(int theValue) {
  if(started){
  lMax = theValue;
  //println(lmin + " " + theValue)
  //noLoop();
  sl.setRange(lMin,theValue);
  }
  //nlMin.setRange(leftMin,theValue);
}

void leftMinHz(int theValue) {
  if(started){
  lMin = theValue;
  sl.setRange(theValue,lMax);
  }
  //nlMax.setRange(theValue,leftMax);
}

void rightMaxHz(int theValue) {
  if(started){
  rMax = theValue;
  sr.setRange(rMin,theValue);
  }
  //println("rightMaxHz is set to "+theValue);
}

void rightMinHz(int theValue) {
  if(started){
  rMin = theValue;
  sr.setRange(theValue,rMax);
  }
  //println("rightMaxHz is set to "+theValue);
}

void toggle_left(boolean theFlag) {
  if (theFlag==true) {
    col = color(255);
  } else {
    col = color(100);
  }
  //println("a toggle event.");
}

void toggle_right(boolean theFlag) {
  if (theFlag==true) {
    col = color(255);
  } else {
    col = color(100);
  }
  //println("a toggle event.");
}

void left_slider(float theValue) {
  //println("left slider event. setting value to "+theValue);
}

void right_slider(float theValue) {
  //println("right slider event. setting value to "+theValue);
}
