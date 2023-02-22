import processing.sound.*;

SinOsc lsine,rsine;
float minFreq = 55.0;
float maxFreq = 880.0;

void setup() {
  size(360, 360);
  background(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  // skapar instanser av två oscillatorer
  lsine = new SinOsc(this);
  rsine = new SinOsc(this);
  // ställer panorering till vänster respektive höger högtalare
  lsine.pan(-1);
  rsine.pan(1);
  // startar oscillatorerna
  lsine.play();
  rsine.play();
}

void draw() {
  background(0);
  lsine.amp(0.8);
  rsine.amp(0.8);
  // Beräknar vänster frekvens utifrån musens position i x-led
  float left_frequency = map(mouseX, 0, width, minFreq, maxFreq);
  lsine.freq(left_frequency);
  // Beräknar höger frekvens utifrån musens position i y-led
  float right_frequency = map(mouseY, 0, width, minFreq, maxFreq);
  rsine.freq(right_frequency);
  // Berättar för användaren vilka frekvenser vi har
  text("< " + left_frequency + " Hz \n" + right_frequency + " Hz >" ,width/2,height/2);
}
