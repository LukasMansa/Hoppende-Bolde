class World {
  float[] xBounds = {0, width};
  float[] yBounds = {0, height};
  float g = 0;
  float stdVel = 10;
  PImage p;

  int BallCount = 50;


  Wall[] walls ={ new Wall(0, 630, 180, 680), new Wall(180, 680, 320, 585), new Wall(320, 585, 460, 663), new Wall(460, 663, 620, 640), new Wall(620, 640, 750, 675), new Wall(750, 675, 1000, 400 )};



  ArrayList<WorldEntity> entities = new ArrayList<WorldEntity>();

  World () {
    entities.clear();
    entities = new ArrayList<WorldEntity>();
    for (int i = 0; i < BallCount; i++) {
      entities.add(new Ball(random(xBounds[0], xBounds[1]), random(yBounds[0], yBounds[1]), PVector.random2D().mult(stdVel), this));
    }
    for (Wall wall : walls) {
      entities.add(wall);
    }
  }




  void run() {
    p = loadImage("billed.jpg");
    image(p, 0, 0);
    {
      for (WorldEntity ent : entities) {
        ent.render();
        ent.move();
        ent.debug();
      }

  void run()
  {
    // insert background
    for (WorldEntity ent : entities) {
      ent.render();
      ent.move();
      ent.debug();
      

    }
  }
}
