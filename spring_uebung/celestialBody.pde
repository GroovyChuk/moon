public class CelestialBody{
  
  String name;
  double radius;
  double mass;
  double px, py;
  double vx , vy;
  color colour;
  double r, x, y;
  
  void draw(){
      pushMatrix();
      fill(colour);
      noStroke();
      specular(colour);
      
      translate(getPx(), getPy(), 0 );
      sphere(this.Radius());
      popMatrix();
  }
  
 float Radius() { 
    return (float)radius;
  }
  float getPx() { 
    return (float)px;
  }
  float getPy() { 
    return (float)py;
  }
  float getX() { 
    return (float)x;
  }
  float getY() { 
    return (float)y;
  }
  
  void setPos(float x,float y){
    px = x;
    py = y;
  }
  
  public float getMass(){
    return (float)mass;
  }
  
  float getR() { 
    return (float)r;
  }
  
}