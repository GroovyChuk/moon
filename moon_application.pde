color c_earth = color(0,0,255);
color c_moon = color(255,255,153);
boolean forceFreeze = false;     // toggle game physics 
Moon moon;
Moon moon2;
Earth earth;
double step = 1, rx, ry, ruhelaenge;
PVector a = new PVector(350,0);
PVector b = new PVector();
float angle;

void setup() {
    
    background(0,0,0);
    
    size(1200, 1200, P3D);
    earth = new Earth();
    moon = new Moon(250 * Math.cos(radians(90)),250 * Math.sin(radians(90)));
    moon2 = new Moon(250 * Math.cos(radians(85)),250 * Math.sin(radians(85)));
    
    // configure moons by adding references of eachother and setting earth as target
    moon.setOtherMoon(moon2);
    moon2.setOtherMoon(moon);
    moon.setTarget(earth);
    moon2.setTarget(earth);
    
    //Einmaliges Berechnen der Ruhelaenge
    rx = moon2.getPx() - moon.getPx(); 
    ry = moon2.getPy() - moon.getPy();
    ruhelaenge = Math.sqrt(Math.pow(rx,2) + Math.pow(ry,2));
    
    moon.setRuhelaenge(ruhelaenge);
    moon2.setRuhelaenge(ruhelaenge);
}

void draw() {
    background(0,0,0);
    translate(width/2, height/2);
    
    
    stroke(255);
    /*line(0,0,moon.getPx(),moon.getPy());
    line(0,0,moon2.getPx(),moon2.getPy());
    fill(255);*/
    
    if(!forceFreeze)
      moon.step();
      moon2.step();
    text("Vx: " + moon.vx,  50, 50);
    text("Vy: " + moon.vy, 50, 80);
    text("r: " + moon.getR(), 50, 110);
    earth.draw();
    moon.draw();
    moon2.draw();
   
   }
    
    
void keyPressed(){
  switch(key)
  {
  case ESC:
    exit();
    break;
  case ' ':
    forceFreeze = !forceFreeze;
    break;
  }
}