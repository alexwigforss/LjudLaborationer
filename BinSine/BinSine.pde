void setup() {
  size(400, 400);
  guiSetup();
  soundSetup();
}

void draw() {
  background(0,0,100,100);
  cp5.draw();
  text(fft.spectrum[10] ,width/2,height/2);
  line(0, 0, width, height);
  noFill();
  circle(mouseX, mouseY, unit);
  soundUpdate();
}
