public class Moon extends CelestialBody {
  
  double ax, ay, ex, ey, ruhelaenge, rx, ry,rlaenge, k = 10;
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
    
  }
  

  void step() {
     
    rx = otherMoon.getPx() - px; 
    ry = otherMoon.getPy() - py;
    rlaenge = Math.sqrt(Math.pow(rx,2) + Math.pow(ry,2));
    
    
    ex = rx/rlaenge;
    ey = ry/rlaenge;
    
    
    // Simulieren der Umlaufbahn
    
    // Mittelpunkt der beiden Massepunkte auf die Umlaufbahn setzen
    x = px-(px-otherMoon.getPx())/2; 
    y = py-(py-otherMoon.getPy())/2;
    r = Math.sqrt(Math.pow(px, 2) + Math.pow(py, 2));
    
    //Startimpuls geben
    if(vx == 0)
      vx = -Math.sqrt(earth.getMass()/r);
    
    //Anziehungskraft + Federkraft + Zentrifugalkraft in Beschleunigung umwandeln
    ax = -((earth.getMass())/Math.pow(r, 3)*px) + (ex*k*(rlaenge-ruhelaenge) - ex*2*ex*vx)/mass;
    ay = -((earth.getMass())/Math.pow(r, 3)*py) + (ey*k*(rlaenge-ruhelaenge) - ey*2*ey*vy)/mass;
    
    //Beschleunigung in Geschwindigkeit umwandeln
    vx = vx + (step * ax);
    vy = vy + (step * ay);

    //Geschwindigkeit in Positionsveränderung umwandeln
    py = py + (step * vy);
    px = px + (step * vx); 
  
  }
  
    void setRuhelaenge(double ruhelaenge){
    this.ruhelaenge = ruhelaenge;
  }
  
  void setOtherMoon(Moon otherMoon){
    this.otherMoon = otherMoon;
  }  
  
    void setTarget(Earth target){
    earth = target;
  }  

 
}