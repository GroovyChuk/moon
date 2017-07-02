public class Moon extends CelestialBody {
  
  double gx, gy; //Beschleunigung der Umlaufbahn
  double fx, fy; //Bescheunigung der Federkraft
  double erx, ery, rlaenge; //Bestandteile des Einheitvektors
  double ex, ey, vix ,viy; //Einheitsvektor
  double ruhelaenge, k = 10;// Bauteile der Federkraft
  double schwerpunkt_x, schwerpunkt_y; // Koordinaten des gemeinsamen Schwerpunkts
  boolean mouseDown = false;
  Moon otherMoon;
  Earth earth;

  Moon(double px, double py) {
    this.px = px;
    this.py = py;
    vx = 0;
    vy = 0;
    radius = 20;
    colour = c_moon;
    mass = 1000;
    r = getOrtsvektor();    
  }
  void berechneKraefte(){
    
    //Berechnen des Einheitsvektors für die Federkraft
    rx = otherMoon.getPx() - px;
    ry = otherMoon.getPy() - py;
    
    rlaenge = Math.sqrt(Math.pow(rx,2) + Math.pow(ry,2));
    ex = rx/rlaenge;
    ey = ry/rlaenge;
    
    // Berechnen der Beschleunigung der Federkraft
    //fx = (ex*k*(rlaenge-ruhelaenge) - ex*4*ex*vx)/mass;
    //fy = (ey*k*(rlaenge-ruhelaenge) - ey*4*ey*vy)/mass;
    fx = ex *(k*(rlaenge-ruhelaenge) - 4*(vx-otherMoon.getVx())*ex) /mass;
    fy = ey *(k*(rlaenge-ruhelaenge) - 4*(vy-otherMoon.getVy())*ey) /mass;
    
    // Simulieren der Umlaufbahn
    
    //Anziehungskraft + Zentrifugalkraft in Beschleunigung umwandeln
    gx = -((earth.getMass())/Math.pow(getOrtsvektor(), 3)*px);
    gy = -((earth.getMass())/Math.pow(getOrtsvektor(), 3)*py);
    
  }
  
  
  void fuehreKraefteAus(){
      
    //Beschleunigung in Geschwindigkeit umwandeln
    vx = vx + (step * (0*gx + fx));
    vy = vy + (step * (0*gy + fy));
    
    //Berechne Mondschwerpunkt
    schwerpunkt_x = px + otherMoon.getPx()-px;
    schwerpunkt_y = py + otherMoon.getPy()-py;
    
    vix = (py - schwerpunkt_y)*0.1 ; 
    viy = -(px - schwerpunkt_x)*0.1;    
    //Geschwindigkeit in Positionsveränderung umwandeln
    px = px + (step * (vx + vix*0)); 
    py = py + (step * (vy + viy*0));
  }
  
  double getOrtsvektor(){
    //Länge des Ortsvektors zu dem Mondmittelpunkt berechnen
    return Math.sqrt(Math.pow(px, 2) + Math.pow(py, 2));
  }
  
  void setInitialVelocity(){
      //Startimpuls geben
      vx = -Math.sqrt(earth.getMass()/getOrtsvektor());    
  } 
  
  void setRuhelaenge(double ruhelaenge){
    this.ruhelaenge = ruhelaenge;
  }
  
  void setOtherMoon(Moon otherMoon){
    this.otherMoon = otherMoon;
  }  
  
  void setTarget(Earth target){
    earth = target;
   // setInitialVelocity();
  }  
  
  float getVix() { 
    return (float)vix;
  }
  
  float getViy() { 
    return (float)viy;
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
}