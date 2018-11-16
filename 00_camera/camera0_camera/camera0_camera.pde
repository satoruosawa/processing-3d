import controlP5.*;

ControlP5 slider;
float eyeX;
float eyeY;
float eyeZ;
float centerX;
float centerY;
float centerZ;
boolean isControlCamera = true;

void setup(){
  size(1080, 1080, P3D);
  smooth();
  frameRate(60);
  slider = new ControlP5(this);
  slider.addSlider("eyeX")
    .setLabel("EYE X")
    .setRange(-2 * width, 2 * width)
    .setValue(width / 2.0)
    .setPosition(10, 10)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
  slider.addSlider("eyeY")
    .setLabel("EYE Y")
    .setRange(-2 * height, 2 * height)
    .setValue(height / 2.0)
    .setPosition(10, 40)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
  slider.addSlider("eyeZ")
    .setLabel("EYE Z")
    .setRange(0, 10.0 * height)
    .setValue((height / 2.0) / tan(PI * 30.0 / 180.0))
    .setPosition(10, 70)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
  slider.addSlider("centerX")
    .setLabel("CENTER X")
    .setRange(-2 * width, 2 * width)
    .setValue(width / 2.0)
    .setPosition(10, 100)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
  slider.addSlider("centerY")
    .setLabel("CENTER Y")
    .setRange(-2 * height, 2 * height)
    .setValue(height / 2.0)
    .setPosition(10, 130)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
  slider.addSlider("centerZ")
    .setLabel("CENTER Z")
    .setRange(-2 * height, 2 * height)
    .setValue(0.0)
    .setPosition(10, 160)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
}

void draw() {
  background(255);
  pushMatrix(); {
    if (isControlCamera) {
      camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, 0, 1, 0);
    }
    translate(width / 2, height / 2);
    box(50);
  } popMatrix();
}

void keyPressed() {
  if (key == ' ') {
    isControlCamera = !isControlCamera;
  }
}
