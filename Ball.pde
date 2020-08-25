class Ball extends WorldEntity
{
  World world;

  float size = 35;
  color clr = #14BAAF;

  Ball (World wrld) { // default cunstructor
    pos.set(width/2, height/2);
    vel.set(0.5, -2);
    world = wrld;

    assignID();
    mass = sqrt(size) * PI;
  }

  Ball (float x, float y, PVector vel_, World wrld) { // default cunstructor
    pos.set(x, y);
    vel.set(0.5, -2);
    vel = vel_;
    world = wrld;
    mass = sqrt(size) * PI;

    assignID();
  }

  void render () {
    fill(clr);
    circle(pos.x, pos.y, size);
  }
  void collide(Wall w){
    
    float leftDot = pos.dot(w.pos);
    
    float rightDot = pos.dot(w.end);
    float distance;
    float angle;
    
    // If dot is left from left dot
    if(leftDot < 0){   
      distance = w.pos.dist(pos);
    }
    // if dot is right from right dot
    else if( rightDot > 0){
      distance = w.end.dist(pos);
    }
    // if dot is perpendicular to wall
    else { 
      distance = abs((w.end.y - w.pos.y)*pos.x - (w.end.x - w.pos.x)*pos.y + (w.end.x*w.pos.y);
    }
  }

  void collide(WorldEntity ent) {
    if (pos.dist(ent.pos) < size && ID != ent.ID) {

      println("collision", pos.dist(ent.pos), size);
      vel.mult(-1);
    }
  }

  void move() {
    float specX = vel.x + pos.x;
    float specY = vel.y + pos.y;

    // world bounds collision
    if (specX < world.xBounds[0] || specX > world.xBounds[1]) {
      vel.x *= -1;
    }
    if (specY < world.yBounds[0] || specY > world.yBounds[1]) {
      vel.y *= -1;
    } 


    // ball collision
    for (WorldEntity e : world.entities) {
      collide(e);
      e.collide(e);
    }


    pos.x += vel.x;
    pos.y += vel.y;

    vel.y += world.g;
    //vel.mult(0.999); // drag
  }
}
