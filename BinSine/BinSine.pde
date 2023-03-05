void setup() {
  size(400, 400);
  guiSetup();
  soundSetup();
}

void draw() {
  background(0,0,100,100);
  cp5.draw();
  for (int i = 1; i < 10; ++i) {
    text(fft.spectrum[i] ,width/2,(height/4)+(20*i));
  }
  line(0, 0, width, height);
  noFill();
  circle(mouseX, mouseY, unit);
  soundUpdate();
}
