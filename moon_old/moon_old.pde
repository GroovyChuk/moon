color c_earth = color(0,0,255);
color c_moon = color(255,255,153);
CelestialBody earth, moon;
double step = 0.0;
PVector a = new PVector(350,0);
PVector b = new PVector();
float angle;

void setup() {
    background(0,0,0);
    size(700, 700, P3D);
    earth = new CelestialBody(false);
    moon = new CelestialBody(true);        
}

void draw() {
    background(0,0,0);
    
    b.set(moon.Px()-width/2,moon.Py()-height/2,0);
    //moon.setPos(mouseX,mouseY);

    angle = degrees(PVector.angleBetween(a,b));

    stroke(255);
    line(350,350,moon.Px(),moon.Py());
    fill(255);
    text(int(angle), 350, 100);
    moon.step(angle);
    text(moon.vy+ "", 350, 150);
    text(moon.vx+ "", 350, 180);
    earth.draw();
    moon.draw();
    
}