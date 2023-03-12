import processing.sound.*;

FFT fft;
int fftBands = 16;

Waveform rightwave;
Waveform leftwave;
int samples = 256;

SinOsc lsine,rsine;
float left_frequency = 440.0f;
float right_frequency = 440.0f;
float amp = 0.5f;

void soundSetup() {
  // skapar instanser av två oscillatorer
  lsine = new SinOsc(this);
  rsine = new SinOsc(this);

  rightwave = new Waveform(this, samples);
  leftwave = new Waveform(this, samples);
  leftwave.input(lsine);
  rightwave.input(rsine);

  // ställer panorering till vänster respektive höger högtalare
  lsine.pan(0);
  rsine.pan(0);
  

  // BUG TO RESOLVE
  // rsine.pan(-1); // får båda att synas, så analyze() läser tydligen endast vänsterkanalen.
  // WorkAround sålänge får bli att ställa båda ljudkällorna i mitten.
  // och hoppas att det går lättare att fixa med pd4p3 senare.
}

void soundUpdate() {
  lsine.amp(amp);
  rsine.amp(amp);
  lsine.freq(left_frequency);
  rsine.freq(right_frequency);
  //fft.analyze();
  // // Perform the analysis
  // leftwave.analyze();
  // rightwave.analyze();
}