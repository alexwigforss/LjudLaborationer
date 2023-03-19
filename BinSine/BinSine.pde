float unit5;

void setup() {
  size(400, 400);
  unit5 = width/5;
  guiSetup();
  soundSetup();
}

void draw() {
  thread("analyzeit");

  background(0,0,100,100);
  cp5.draw();


  // for (int i = 0; i < 16; ++i) {
  //   text(fft.spectrum[i] ,width/1.1,10+(10*i));
  // }
  // for (int i = 0; i < 16; ++i) {
  //   circle(width/5+map(i, 1, 16, 0, width-(2*width/5)), height-(height/5/2), 20*fft.spectrum[i]);
  // }

  // Set background color, noFill and stroke style
  //background(0);
  stroke(255);
  strokeWeight(2);
  noFill();

  // Perform the analysis
  //leftwave.analyze();
    
    // for (int i = 0; i < samples; i+=4) {
    //   circle(width/5+map(i, 1, samples, 0, width-(2*width/5)), height/5/2, 100*leftwave.data[i]);
    //   // circle(width/5+map(i, 1, samples, 0, width-(2*width/5)), height-(height/5/2), 100*leftwave.data[i]);
    // }

  beginShape();
  for(int i = 0; i < samples; i++){
    vertex(
      map(i, 0, samples, unit5+1, width-unit5+1),
      map(leftwave.data[i], -1, 1, 0, unit5-1)
    );
  }
  endShape();

  // for (int i = 0; i < 16; ++i) {
  //   text(leftwave.data[i] ,width/1.1,10+(10*i));
  // }
  // Perform the analysis
  // rightwave.analyze();
  beginShape();

  for(int i = 0; i < samples; i++){
    vertex(
      map(i, 0, samples, unit5+1, width-unit5+1),
      map(rightwave.data[i], -1, 1, height-(unit5), height-1)
    );
  }
  endShape();

  circle(mouseX, mouseY, unit);
  soundUpdate();
}
public void analyzeit()
{
  leftwave.analyze();
  rightwave.analyze();
}
/*
class Analyzer extends Thread{
   boolean parameter;

   public Analyzer(String parameter){
      this.parameter = parameter;
   }

   public void run(){
      System.out.println(parameter);
   }
}
// new MyThread("testing").start();
*/