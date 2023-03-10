import processing.sound.*;

FFT fft;
int fftBands = 32;
SinOsc lsine,rsine;
float left_frequency = 440.0f;
float right_frequency = 440.0f;
float amp = 0.5f;

void soundSetup() {
  // skapar instanser av två oscillatorer
  lsine = new SinOsc(this);
  rsine = new SinOsc(this);
  // ställer panorering till vänster respektive höger högtalare
  lsine.pan(-1);
  rsine.pan(1);
  fft = new FFT(this, 32);
  //lsine.play();
  fft.input(lsine);
}

void soundUpdate() {
  lsine.amp(amp);
  rsine.amp(amp);
  lsine.freq(left_frequency);
  rsine.freq(right_frequency);
  fft.analyze();
}