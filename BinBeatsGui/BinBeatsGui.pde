import controlP5.*;

ControlP5 cp5;

int col = color(255);

boolean toggleValue = false;
Knob volKnob;

void setup() {
  size(400, 400);
  int unit = width / 16;
  int two_units = unit * 2;
  int tri_units = unit * 3;
  int four_units = unit * 4;
  int ten_units = unit * 10;
  int twelve_units = unit * 12;

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
    .setRange(55, 440)
    .setValue(440)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("rightMaxHz")
    .setPosition(width-tri_units, 0)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(55, 440)
    .setValue(440)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("leftMinHz")
    .setPosition(0, height-two_units)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(55, 440)
    .setValue(55)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("rightMinHz")
    .setPosition(width-tri_units, height-two_units)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(55, 440)
    .setValue(55)
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

  cp5.addSlider("left_slider")
    .setPosition(0, two_units)
    .setSize(tri_units, twelve_units)
    .setRange(0, 10)
    .setValue(7)
    .setNumberOfTickMarks(11)
    .showTickMarks(true)
    .setLabel("")
    .setFont(font)

    //.setLabelVisible(false)
    ;
  cp5.getController("left_slider").getValueLabel().align(ControlP5.RIGHT, ControlP5.TOP).setPaddingX(0);


  cp5.addSlider("right_slider")
    .setPosition(width-tri_units, two_units)
    .setSize(tri_units, twelve_units)
    .setRange(0, 10)
    .setValue(7)
    .setNumberOfTickMarks(11)
    .showTickMarks(true)
    .setLabel("")
    .setFont(font)
    //.setLabelVisible(false)
    ;
  cp5.getController("right_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);

  //cp5.getController("right_slider").getValueLabel().setPaddingX(-tri_units);
}


void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  fill(col);
  ellipse(0, 0, 40, 40);

  popMatrix();
}

void numberbox(int theColor) {
  println("a numberbox event. setting background to "+theColor);
}

void toggle_left(boolean theFlag) {
  if (theFlag==true) {
    col = color(255);
  } else {
    col = color(100);
  }
  println("a toggle event.");
}

void toggle_right(boolean theFlag) {
  if (theFlag==true) {
    col = color(255);
  } else {
    col = color(100);
  }
  println("a toggle event.");
}

void left_slider(float theValue) {
  println("left slider event. setting value to "+theValue);
}

void right_slider(float theValue) {
  println("right slider event. setting value to "+theValue);
}
