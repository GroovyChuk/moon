public class Earth extends CelestialBody{
  
  int counter = 0;

  Earth(){
    px = 0;
    py = 0;
    radius = 150;
    colour = c_earth;
    mass = 10000;
    photo = loadImage("earth.png");
  }
  
  void draw(){
    pushMatrix();
    rotate(-(PI/1440)*counter);
    image(photo,getPx()-Radius()/2, getPy()-Radius()/2,Radius(),Radius());
    counter++;
    popMatrix();
  }
}