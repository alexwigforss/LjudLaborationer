import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class BinSine extends PApplet {

public void setup() {
  
  guiSetup();
  soundSetup();
}

public void draw() {
  background(0);
  soundUpdate();
}


ControlP5 cp5;
Slider sl, sr;
Numberbox nlMax,nlMin,nrMax,nrMin;
int col = color(255);

boolean toggleValue = false;
Knob volKnob;

float leftMax=440,leftMin=22,rightMax = 440,rightMin = 22;
float lMax=440,lMin=22,rMax = 440,rMin = 22;
float leftSlideMax=110,leftSlideMin=55,rightSlideMax = 110,rightSlideMin = 55;

boolean started = false;

public void guiSetup() {
  background(255);
  textSize(32);
  textAlign(CENTER, CENTER);

  smooth();
  cp5 = new ControlP5(this);
  setupCp5();
}

public void setupCp5(){
  PFont font = createFont("arial",20);
  int unit = width / 16, two_units = unit * 2, tri_units = unit * 3,
  four_units = unit * 4, ten_units = unit * 10, twelve_units = unit * 12;

  volKnob = cp5.addKnob("knobValue")
               .setRange(0,200)
               .setValue(50)
               .setPosition(four_units,four_units)
               .setRadius(four_units)
               .setNumberOfTickMarks(10)
               .setViewStyle(Knob.ELLIPSE)
               .setDragDirection(Knob.HORIZONTAL)
               .scrolled(-1)
               .setLabel("")
               .setFont(font)
               ;

  cp5.addNumberbox("leftMaxHz")
    .setPosition(0, 0)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(leftMin, leftMax)
    .setValue(110)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("rightMaxHz")
    .setPosition(width-tri_units, 0)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(rightMin, rightMax)
    .setValue(110)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("leftMinHz")
    .setPosition(0, height-two_units)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(leftMin, leftMax)
    .setValue(55)
    .setLabel("")
    .setFont(font)
    ;

  cp5.addNumberbox("rightMinHz")
    .setPosition(width-tri_units, height-two_units)
    .setSize(tri_units, two_units)
    .setMultiplier(-1)
    .setRange(rightMin, rightMax)
    .setValue(55)
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
    .setValue(55)
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

public void knobValue(int theValue){
    amp = map(theValue, 0, 200, 0.000001f, 1.0f);
}

public void leftMaxHz(int theValue) {
  if(started && theValue > lMin){
  lMax = theValue;
  sl.setRange(leftSlideMin,theValue);
  cp5.getController("left_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  }
}

public void leftMinHz(int theValue) {
  if(started && theValue < lMax){
  lMin = theValue;
  sl.setRange(theValue,leftSlideMax);
  cp5.getController("left_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  }
}

public void rightMaxHz(int theValue) {
  if(started && theValue > rMin){
  rMax = theValue;
  sr.setRange(rightSlideMin,theValue);
  cp5.getController("right_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  }
}

public void rightMinHz(int theValue) {
  if(started && theValue < rMax){
  rMin = theValue;
  sr.setRange(theValue,rightSlideMax);
  cp5.getController("right_slider").getValueLabel().align(ControlP5.LEFT, ControlP5.TOP).setPaddingX(0);
  }
}

public void toggle_left(boolean theFlag) {
  if(started)  {
    if (theFlag==true) {
      lsine.play();
    } else {
      lsine.stop();
    }
  }
}

public void toggle_right(boolean theFlag) {
  if(started)  {
    if (theFlag==true) {
      rsine.play();
    } else {
      rsine.stop();
    }
  }
}

public void left_slider(float theValue) {
  if(started)  {
    left_frequency = theValue;
  }
}

public void right_slider(float theValue) {
  if(started)  {
    right_frequency = theValue;
  }
}


SinOsc lsine,rsine;
float left_frequency = 55.0f;
float right_frequency = 55.0f;
float amp = 0.5f;

public void soundSetup() {
  // skapar instanser av två oscillatorer
  lsine = new SinOsc(this);
  rsine = new SinOsc(this);
  // ställer panorering till vänster respektive höger högtalare
  lsine.pan(-1);
  rsine.pan(1);
}

public void soundUpdate() {
  lsine.amp(amp);
  rsine.amp(amp);
  lsine.freq(left_frequency);
  rsine.freq(right_frequency);
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "BinSine" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
