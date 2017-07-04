color c_earth = color(0,0,255);
color c_moon = color(255,255,153);
boolean forceFreeze = false;    // toggle game physics
Moon moon;
Moon moon2;
Earth earth;
double step = 0.5, rx, ry, ruhelaenge;

void setup() {
    
    background(0,0,0);
    
    size(1200, 1200, P3D);
    earth = new Earth();
    moon = new Moon(250 * Math.cos(radians(90)),250 * Math.sin(radians(90)), c_moon);
    moon2 = new Moon(250 * Math.cos(radians(90)),250 * Math.sin(radians(90)),color(255,30,50));
    
    // configure moons by adding references of eachother and setting earth as target
    moon.setOtherMoon(moon2);
    moon2.setOtherMoon(moon);
    moon.setTarget(earth);
    moon2.setTarget(earth);
    
    moon2.setEuler();
}

void draw() {
    //background(0,0,0);
    stroke(255);
    fill(0);
    rect(0,0,230,200);
    fill(255);
    translate(width/2, height/2);
    


    if(!forceFreeze){
      moon.berechneKraefte();
      moon2.berechneKraefte();
      
      moon.fuehreKraefteAus();
      moon2.fuehreKraefteAus();
    }
    text("Moon 1: ", -570, -570);
    text("Velocity X: " + String.format("%.2f",moon.getVx()), -500, -570);
    text("Velocity Y: " + String.format("%.2f",moon.getVy()), -500, -540);
    text("Ortsvektor: " + String.format("%.2f",moon.getOrtsvektor()), -500, -510);
    text("Moon 2: ", -570, -470);
    text("Velocity X: " + String.format("%.2f",moon2.getVx()), -500, -470);
    text("Velocity Y: " + String.format("%.2f",moon2.getVy()), -500, -440);
    text("Ortsvektor: " + String.format("%.2f",moon2.getOrtsvektor()), -500, -410);
    fill(255);
    
    earth.draw();
    //moon.draw();
    //moon2.draw();
    stroke(moon.getColor());
    line(moon.getPx(), moon.getPy(), moon.getPx() - moon.getVx()*4, moon.getPy() - moon.getVy()*4);
    stroke(moon2.getColor());
    line(moon2.getPx(), moon2.getPy(), moon2.getPx() - moon2.getVx()*4, moon2.getPy() - moon2.getVy()*4);
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
  case 'e':
    moon2.setEuler();
    break;
  }
}