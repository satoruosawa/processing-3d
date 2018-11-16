import controlP5.*;

ControlP5 slider;
float fov;
float aspect;
float zNear;
float zFar;
float cameraZ = (height / 2.0) / tan(PI * 60.0 / 360.0);
boolean isControlCamera = true;

void setup(){
  size(1080, 1080, P3D);
  smooth();
  frameRate(60);
  slider = new ControlP5(this);
  slider.addSlider("fov")
    .setLabel("FOV")
    .setRange(0, 2 * PI)
    .setValue(PI / 3.0)
    .setPosition(10, 10)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
  slider.addSlider("aspect")
    .setLabel("ASPECT")
    .setRange(-1, 2)
    .setValue(float(width) / float(height))
    .setPosition(10, 40)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
  slider.addSlider("zNear")
    .setLabel("Z NEAR")
    .setRange(0, cameraZ * 20.0)
    .setValue(cameraZ / 10.0)
    .setPosition(10, 70)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
  slider.addSlider("zFar")
    .setLabel("Z FAR")
    .setRange(0, cameraZ * 20.0)
    .setValue(cameraZ * 20.0)
    .setPosition(10, 100)
    .setColorCaptionLabel(color(0))
    .setSize(200, 20);
}

void draw() {
  background(255);
  pushMatrix(); {
    if (isControlCamera) {
      perspective(fov, aspect, zNear, zFar);
    }
    translate(width / 2, height / 2, 0);
    rotateX(-PI/6);
    rotateY(PI/3);
    box(150);
    perspective();
  } popMatrix();

}

void keyPressed() {
  if (key == ' ') {
    isControlCamera = !isControlCamera;
  }
}
