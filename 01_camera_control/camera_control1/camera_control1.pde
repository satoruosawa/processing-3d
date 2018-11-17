float cameraZ = 0.0;

void setup() {
  size(1080, 1080, P3D);
  noStroke();
  frameRate(60);
}

void draw() {
  background(255);
  cameraControl();
  translate(width / 2, height / 2, width / 2);
  stroke(0);
  box(45);
  translate(0, 0, -50);
  box(30);
}

void cameraControl() {
  beginCamera(); {
    camera();
    translate(0, 0, cameraZ);
  } endCamera();
  translate(width / 2, height / 2, width / 2);
  rotateX(mouseY / float(width) * TWO_PI);
  rotateY(mouseX / float(height) * TWO_PI);
  translate(-width / 2, -height / 2, -width / 2);
}

void mouseWheel(MouseEvent event) {
  float fov = PI / 3.0;
  float e = event.getCount();
  cameraZ -= e / 10.0;
}
