class World {
  float[] xBounds = {0, width};
  float[] yBounds = {0, height};

  float g = 0;
  float stdVel = 4;

  int BallCount = 100;
  
  
  float[] wallVals = {0,height};
  
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
