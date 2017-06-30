public class Moon extends CelestialBody {
  
  double gx, gy; //Beschleunigung der Umlaufbahn
  double fx, fy; //Bescheunigung der Federkraft
  double erx, ery, rlaenge; //Bestandteile des Einheitvektors
  double ex, ey, vix ,viy; //Einheitsvektor
  double ruhelaenge, k = 10;// Bauteile der Federkraft
  double schwerpunkt_x, schwerpunkt_y; // Koordinaten des gemeinsamen Schwerpunkts
  boolean euler = false ; // normal euler set false use semi-explicit
  Moon otherMoon;
  Earth earth;

  Moon(double px, double py, color colour) {
    this.px = px;
    this.py = py;
    vx = 0;
    vy = 0;
    radius = 20;
    this.colour = colour;
    mass = 1000;
    r = getOrtsvektor();    
  }
  void berechneKraefte(){
    
    // Simulieren der Umlaufbahn
    
    //Anziehungskraft + Zentrifugalkraft in Beschleunigung umwandeln
    gx = -((earth.getMass())/Math.pow(getOrtsvektor(), 3)*px);
    gy = -((earth.getMass())/Math.pow(getOrtsvektor(), 3)*py);
    
  }
  
  
  void fuehreKraefteAus(){
    
    if (euler){
      
      // Neue Position mit aktueller Geschwindigkeit berechnen
      px = px + (step * (vx + vix)); 
      py = py + (step * (vy + viy));
    
      // Geschwindigkeit für nächsten Schritt
      vx = vx + (step * (gx + fx));
      vy = vy + (step * (gy + fy));
    
    } else {
      //Beschleunigung in Geschwindigkeit umwandeln
      vx = vx + (step * (gx + fx));
      vy = vy + (step * (gy + fy));
      
      //Geschwindigkeit in Positionsveränderung umwandeln
      px = px + (step * (vx + vix)); 
      py = py + (step * (vy + viy));
    
    }  

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
  
  float getVix() { 
    return (float)vix;
  }
  
    float getViy() { 
    return (float)viy;
  }
  
  void setEuler() {
    euler =! euler;
  }
  
  float getVx(){
    return (float)vx;
  }
  
  
  float getVy(){
    return (float)vy;
  }
  
}