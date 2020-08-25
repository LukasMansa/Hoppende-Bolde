class WorldEntity {


  PVector pos = new PVector();
  PVector vel = new PVector();

  Wall[] wall ={ new Wall(0,70,180,20) , new Wall(180,20,320,115) , new Wall(320,115,460,27) , new Wall(460,27,620,60) , new Wall(620,60,750,25) , new Wall(750,25,width, 300 )}

  float mass;
  int ID;

  void assignID () {
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
  PVector getKE() {
    float mag = vel.mag();
    return vel.normalize().mult((mag*mag));
  }

  void debug() {
    println(vel.mag());
  }
}
