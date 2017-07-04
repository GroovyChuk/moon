public class CelestialBody{
  
  String name;
  double radius;
  double mass;
  double px, py;
  double vx , vy;
  color colour;
  double step = 0.1;
  
  CelestialBody(boolean isMoon){
    if (isMoon) {
      px = 600;
      py = 100;
      vx = 0;
      vy = 0;
      radius = 20;
      colour = c_moon;
      
    } else {
      px = width/2;
      py = height/2;
      radius = 60;
      colour = c_earth;
    }
  }
  
  void step(float angle) {
      float percent_x, percent_y;
      if (angle <= 90){
        percent_x = 1 - angle/90;
        percent_y = angle/90;
      } else {
        percent_x = angle/90 - 1;
        percent_y = 2- angle/90;
      }
      
      if (py <= height /2){
        vx = vx + (step * 9.81) * percent_x;
        vy = vy + (step * 9.81) * percent_y;
      } else {
        vx = vx + (step * -9.81) * percent_x;
        vy = vy + (step * -9.81) * percent_y;
      }
      
      py = py + (step * vy);
      px = px - (step * vx);

  }
  
 float Radius() { 
    return (float)radius;
  }
  float Px() { 
    return (float)px;
  }
  float Py() { 
    return (float)py;
  }
  
  void setPos(int x,int y){
    px = x;
    py = y;
  }
  
  void draw(){
      pushMatrix();
      fill(colour);
      noStroke();
      specular(colour);
      
      translate(Px(), Py(), 0 );
      sphere(this.Radius());
      popMatrix();
  }
}