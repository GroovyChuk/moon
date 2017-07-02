public class Moon extends CelestialBody {
  
  
  double fx, fy; //Bescheunigung der Federkraft
  
  double erx, ery, rlaenge; //Bestandteile des Einheitvektors
  double ex, ey; //Einheitsvektor
  double ruhelaenge, feder_k, daempfungs_k;// Bauteile der Federkraft
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
    
    
   /*
   Hier Federgleichung verwenden.
    fx = 
    fy = 
     */
  }
  
  
  void fuehreKraefteAus(){
      
    //Beschleunigung in Geschwindigkeit umwandeln
    vx = vx + (step * fx);
    vy = vy + (step * fy);
    
   
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