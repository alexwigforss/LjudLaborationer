import processing.sound.*;

SinOsc lsine,rsine;
float left_frequency = 55.0f;
float right_frequency = 55.0f;
float amp = 0.5f;

void soundSetup() {
  // skapar instanser av två oscillatorer
  lsine = new SinOsc(this);
  rsine = new SinOsc(this);
  // ställer panorering till vänster respektive höger högtalare
  lsine.pan(-1);
  rsine.pan(1);
}

void soundUpdate() {
  lsine.amp(amp);
  rsine.amp(amp);
  lsine.freq(left_frequency);
  rsine.freq(right_frequency);
}