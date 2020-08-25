class World {
  float[] xBounds = {0, width};
  float[] yBounds = {0, height};

  float g = 0;
  float stdVel = 4;

  int BallCount = 100;
  
  
  Wall[] wall ={ new Wall(0, 930, 180, 980), new Wall(180, 980, 320, 885), new Wall(320, 885, 460, 963), new Wall(460, 963, 620, 940), new Wall(620, 940, 750, 975), new Wall(750, 975, width, 700 )};


  ArrayList<WorldEntity> entities = new ArrayList<WorldEntity>();

  World () {
    entities.clear();
    entities = new ArrayList<WorldEntity>();
    for (int i = 0; i < BallCount; i++) {
      entities.add(new Ball(random(xBounds[0], xBounds[1]), random(yBounds[0], yBounds[1]), PVector.random2D().mult(stdVel), this));
    }
  }



  void run()
  {
    for (WorldEntity ent : entities) {
      ent.render();
      ent.move();
      ent.debug();
      
    }
  }
}
