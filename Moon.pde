public class Moon extends CelestialBody {
  
  double ax, ay; //Beschleunigung der Umlaufbahn
  double bx, by; //Bescheunigung der Federkraft
  double erx, ery, rlaenge; //Bestandteile des Einheitvektors
  double ex, ey, vix ,viy; //Einheitsvektor
  double ruhelaenge, k = 10;// Bauteile der Federkraft
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
  void berechneKraefte(){
    
    //Berechnen des Einheitsvektors für die Federkraft
    erx = otherMoon.getPx() - px; 
    ery = otherMoon.getPy() - py;
    rlaenge = Math.sqrt(Math.pow(rx,2) + Math.pow(ry,2));
    ex = erx/rlaenge;
    ey = ery/rlaenge;
    
    
    // Berechnen der Beschleunigung der Federkraft
    bx = (ex*k*(rlaenge-ruhelaenge) - ex*2*ex*vx)/mass;
    by = (ey*k*(rlaenge-ruhelaenge) - ey*2*ey*vy)/mass;
    
    
    // Simulieren der Umlaufbahn
    //Länge des Ortsvektors zu dem Mondmittelpunkt berechnen
    r = Math.sqrt(Math.pow(px, 2) + Math.pow(py, 2));
    
    //Startimpuls geben
    if(vx == 0)
      vx = -Math.sqrt(earth.getMass()/r);
    
    //Anziehungskraft + Zentrifugalkraft in Beschleunigung umwandeln
    ax = -((earth.getMass())/Math.pow(r, 3)*px);
    ay = -((earth.getMass())/Math.pow(r, 3)*py);
    
    
    
  }
  
  
  void fuehreKraefteAus(){
    
     //Beschleunigung in Geschwindigkeit umwandeln
    vx = vx + (step * (ax + bx));
    vy = vy + (step * (ay + by));
    
    //Berechne Mondschwerpunkt
    x = px + otherMoon.getPx()-px;
    y = py + otherMoon.getPy()-py;
    
    vix = (py - y)*0.1 ; 
    viy = -(px - x)*0.1;
    //Geschwindigkeit in Positionsveränderung umwandeln
    px = px + (step * (vx + vix)); 
    py = py + (step * (vy + viy));
    
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