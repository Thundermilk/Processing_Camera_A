import processing.video.*;

Capture vCam;

color[][] lVar;
color[][] kVar;
color[][] mVar;
int szVar = 360;
int fVar = int(random(12,36));
int ncw = int(szVar/fVar);
int nch = int(szVar/fVar);
boolean onoff = true;

void setup() {
  size(360,360);
  vCam = new Capture(this,640,360,30);
  vCam.start();
  cursor(CROSS);
  //frameRate(30);
}
  
void captureEvent(Capture vCam) {  
  vCam.read();
}

void draw() {
  lVar = new color[ncw][nch];
  kVar = new color[ncw][nch];
  mVar = new color[ncw][nch];
  
  //if (vCam.available()) {    
  //  vCam.read();  
  //}
  //vCam.resize(width,height);
  //vCam.loadPixels();
  for (int x = 0; x < ncw; x++) {
    for (int y = 0; y < nch; y++) {
      color c1 = vCam.get((vCam.width/4)+x*fVar+int(random(fVar)),y*fVar+int(random(fVar)));
      color c2 = vCam.get((vCam.width/4)+x*fVar+int(random(fVar)),y*fVar+int(random(fVar)));
      color c3 = vCam.get((vCam.width/4)+x*fVar+int(random(fVar)),y*fVar+int(random(fVar)));
      lVar[x][y] = c1;
      kVar[x][y] = c2;
      mVar[x][y] = c3;
      //println(kVar[x][y],lVar[x][y],mVar[x][y]);
    }
  }
  for (int x = 0; x < ncw; x++) {
    for (int y = 0; y < nch; y++) {
        //stroke(kVar[x][y]+random(-5,5),lVar[x][y]+random(-5,5),mVar[x][y]+random(-5,5));
        stroke(kVar[x][y],150+random(-5,5));
        line (x*fVar,y*fVar,x*fVar+random(fVar),y*fVar+random(fVar));
        stroke(lVar[x][y],150+random(-5,5));
        line (x*fVar+fVar,y*fVar+fVar,x*fVar+random(fVar),y*fVar+random(fVar));
        stroke(mVar[x][y],150+random(-5,5));
        line (x*fVar,y*fVar+fVar,x*fVar+random(fVar),y*fVar+fVar-random(fVar));
     }
    }
}

void mousePressed () {
            if (onoff == true) {
            noLoop();
            onoff = false;
            println(onoff);
          } else if (onoff == false) {
            loop();
            onoff = true;
            println(onoff);
          }
}

void keyPressed () {
  println ("pressed" + key);
  if (key == CODED) {
  fVar = int(random(12,36));
  ncw = int(szVar/fVar);
  nch = int(szVar/fVar);
    //rect (width/4, height/4, width/4 * 3, height/4 * 3);
   background (int(random(0,255) ) ); 
  }
}