class WorldEntity {
  
  
  PVector pos = new PVector();
  PVector vel = new PVector();
  
  float radius = 5;
  float mass;
  int ID;
  
  void assignID (){
    ID = WECount++;
    
  }
  
  
  void render() {
  }
  void move() {
  }

  void within() {
  }


  void collide(WorldEntity entity) {
    vel = (getForce().sub(entity.getForce())).div(mass);
  }
  PVector getForce(){
   return vel.div(mass);
  }
  
  void debug(){
    println(vel.mag());
  }
  
}
