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
    vel.x -= entity.vel.x;
    vel.y -= entity.vel.y;
  }
  PVector getKE(){
    float mag = vel.mag();
   return vel.normalize().mult((mag*mag));
  }
  
  void debug(){
    println(vel.mag());
  }
  
}
