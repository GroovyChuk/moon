public class Moon extends CelestialBody {
  
  double gx, gy; //Beschleunigung der Umlaufbahn
  double fx, fy; //Bescheunigung der Federkraft
  double erx, ery, rlaenge; //Bestandteile des Einheitvektors
  double ex, ey, vix ,viy; //Einheitsvektor
  double ruhelaenge, k = 10;// Bauteile der Federkraft
  double schwerpunkt_x, schwerpunkt_y; // Koordinaten des gemeinsamen Schwerpunkts
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
    erx = otherMoon.getPx() - px; 
    ery = otherMoon.getPy() - py;
    rlaenge = Math.sqrt(Math.pow(rx,2) + Math.pow(ry,2));
    ex = erx/rlaenge;
    ey = ery/rlaenge;
    
    
    // Berechnen der Beschleunigung der Federkraft
    fx = (ex*k*(rlaenge-ruhelaenge) - ex*2*ex*vx)/mass;
    fy = (ey*k*(rlaenge-ruhelaenge) - ey*2*ey*vy)/mass;
    
    
    // Simulieren der Umlaufbahn
    r = getOrtsvektor();
    
    //Anziehungskraft + Zentrifugalkraft in Beschleunigung umwandeln
    gx = -((earth.getMass())/Math.pow(r, 3)*px);
    gy = -((earth.getMass())/Math.pow(r, 3)*py);
    
    
    
  }
  
  
  void fuehreKraefteAus(){
    
     //Beschleunigung in Geschwindigkeit umwandeln
    vx = vx + (step * (gx + fx));
    vy = vy + (step * (gy + fy));
    
    //Berechne Mondschwerpunkt
    schwerpunkt_x = px + otherMoon.getPx()-px;
    schwerpunkt_y = py + otherMoon.getPy()-py;
    
    vix = (py - schwerpunkt_y)*0.1 ; 
    viy = -(px - schwerpunkt_x)*0.1;
    //Geschwindigkeit in Positionsveränderung umwandeln
    px = px + (step * (vx + vix)); 
    py = py + (step * (vy + viy));
    
  }
  
  double getOrtsvektor(){
    //Länge des Ortsvektors zu dem Mondmittelpunkt berechnen
    return Math.sqrt(Math.pow(px, 2) + Math.pow(py, 2));
  }
  
  void setInitialVelocity(){
      //Startimpuls geben
      vx = -Math.sqrt(earth.getMass()/r);    
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

 
}