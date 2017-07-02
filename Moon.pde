public class Moon extends CelestialBody {
  
  double gx, gy; //Beschleunigung der Umlaufbahn
  double fx, fy; //Bescheunigung der Federkraft
  double erx, ery, rlaenge; //Bestandteile des Einheitvektors
  double ex, ey, vrotX ,vrotY; //Einheitsvektor, Initiale Rotationsgeschwindigkeit
  double ruhelaenge, feder_k = 50, daempfungs_k = 4;// Bauteile der Federkraft
  double schwerpunkt_x, schwerpunkt_y; // Koordinaten des gemeinsamen Schwerpunkts
  double VRot = 0.1; // Rotationskonstante
  boolean mouseDown = false;
  Moon otherMoon;
  Earth earth;


  Moon(double px, double py) {
    this.px = px;
    this.py = py;
    vx = 0;
    vy = 0;
    radius = 50;
    colour = c_moon;
    mass = 1000;
    r = getOrtsvektor();    
    photo = loadImage("moon.png");
  }
  
  void berechneKraefte(){
    
    //Berechnen des Einheitsvektors für die Federkraft
    rx = otherMoon.getPx() - px;
    ry = otherMoon.getPy() - py;
    
    // Abstand zwischen den beiden Massepunkten
    rlaenge = Math.sqrt(Math.pow(rx,2) + Math.pow(ry,2));
    //Einheitsvektor
    ex = rx/rlaenge;
    ey = ry/rlaenge;
    
    // Berechnen der Beschleunigung der Federkraft
    fx = ex *(feder_k*(rlaenge-ruhelaenge) - daempfungs_k*(vx-otherMoon.getVx())*ex) /mass;
    fy = ey *(feder_k*(rlaenge-ruhelaenge) - daempfungs_k*(vy-otherMoon.getVy())*ey) /mass;
    
    // Simulieren der Umlaufbahn
    
    //Anziehungskraft + Zentrifugalkraft in Beschleunigung umwandeln
    gx = -((earth.getMass())/Math.pow(getOrtsvektor(), 3)*px);
    gy = -((earth.getMass())/Math.pow(getOrtsvektor(), 3)*py);
  }
  
  
  void fuehreKraefteAus(){
      
    //Beschleunigung in Geschwindigkeit umwandeln
    vx = vx + (step * (gx + fx));
    vy = vy + (step * (gy + fy));


    //Geschwindigkeit in Positionsveränderung umwandeln
    px = px + (step * vx); 
    py = py + (step * vy);
  }
  
  double getOrtsvektor(){
    //Länge des Ortsvektors zu dem Mondmittelpunkt berechnen
    return Math.sqrt(Math.pow(px, 2) + Math.pow(py, 2));
  }
  
  void setInitialVelocity(){
      //Startimpuls geben
          
      //Berechne Mondschwerpunkt
      schwerpunkt_x = px + otherMoon.getPx()-px;
      schwerpunkt_y = py + otherMoon.getPy()-py;
    
      // Initial Rotation 
      vrotX = (py - schwerpunkt_y)*VRot ; 
      vrotY = -(px - schwerpunkt_x)*VRot; 
      vx = Math.sqrt(earth.getMass()/getOrtsvektor()) + vrotX;    
      vy = vrotY;
  } 
  
  void setRuhelaenge(double ruhelaenge){
    this.ruhelaenge = ruhelaenge;
  }
  
  void setOtherMoon(Moon otherMoon){
    this.otherMoon = otherMoon;
  }  
  
  void setTarget(Earth target){
    earth = target;
    setInitialVelocity();
  }  
  
  float getVx(){
    return (float)vx;
  }
  
  float getVy(){
    return (float)vy;
  }
  void mouse(){
     if((getPx() - Radius() <= (mouseX-width/2) && getPx() + Radius() >= (mouseX-width/2)) && (getPy() - Radius() <= (mouseY-height/2) && getPy() + Radius() >= (mouseY-height/2)) || mouseDown){
      mouseDown = true;
      px = (mouseX-width/2);
      py = (mouseY-height/2);
     }
  }
  
  void setVRot(double vrot){
    this.VRot = vrot;
  }
}