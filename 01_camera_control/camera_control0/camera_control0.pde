void setup() {
  size(1080, 1080, P3D);
  noStroke();
  frameRate(60);
}

void draw() {
  background(255);
  cameraControl();
  stroke(0);
  box(45);
  translate(0, 0, -50);
  box(30);
}

void cameraControl() {
  translate(width/2, height/2, 0);
  float cameraY = height/2.0;
  float fov = mouseY/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  perspective(fov, aspect, cameraZ / 10.0, cameraZ * 10.0);
  rotateY(PI/3 + mouseX/float(height) * PI);
}
