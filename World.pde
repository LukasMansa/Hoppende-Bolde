class World {
  float[] xBounds = {0, width};
  float[] yBounds = {0, height};

  float g = 0;
  float stdVel = 4;

  int BallCount = 100;
  
  
  Wall[] wall ={ new Wall(0, 70, 180, 20), new Wall(180, 20, 320, 115), new Wall(320, 115, 460, 27), new Wall(460, 27, 620, 60), new Wall(620, 60, 750, 25), new Wall(750, 25, width, 300 )};


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
