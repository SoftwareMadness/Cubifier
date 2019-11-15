float rotX, rotY, camX, camY, camZ;
float count = 0;
int[]cubes;
void setup() {
  fullScreen(P3D);
  count = random(0, 10);
  cubes = new int[((int)count*(int)count)];
  for (int i = 0; i < (int)count; i++) {
    for (int o = 0; o < (int)count; o++) {
      cubes[i] = (int)map(noise(i, o), 0, 1, 0, 10);
    }
  }
}
void draw() {
  background(255);
  lights();
  fill(192);
  stroke(0);

  //navigation style 1
  translate(camX, camY, camZ);
  translate(width/2.0-camX, height/2.0-camY);
  rotateY(rotY);
  rotateX(rotX);
  translate(-(width/2.0-camX), -(height/2.0-camY));

  rotateY(0.5);
  noFill();
     translate(width/2, height/2, 0);
     int p = 0;
  for (int i = 0; i < (int)count; i++) {
    for (int o = 0; o < (int)count; o++) {
      for (int l = 0; l < cubes[p]; l++) {
        translate(0,40,0);
      box(40);
      }
      translate(40,-(cubes[p]*40), 0);
      p++;
      
    }
    translate((-40*count)+10,0,40);
  }
}
void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    //navigation style 1
    rotY += (pmouseX - mouseX)*0.01;
    rotX += (pmouseY - mouseY)*0.01;
    //navigation style 2
    //    rotX += (mouseX - pmouseX)*0.01;
    //    rotY += (mouseY - pmouseY)*0.01;
  }
  if (mouseButton == RIGHT)
  {
    //navigation style 1
    camX -= (pmouseX - mouseX);
    camY -= (pmouseY - mouseY);
    //navigation style 2
    //    camX -= (mouseX - pmouseX);
    //    camY -= (mouseY - pmouseY);
  }
  if (mouseButton == CENTER)
  {
    //navigation style 1
    camZ += (pmouseY - mouseY);
    //navigation style 2
    //    camZ += (mouseY - pmouseY);
  }
}
