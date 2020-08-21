class Ball extends WorldEntity
{
  World world;

  float size = 35;
  color clr = #14BAAF;
  float radius = 5;

  Ball (World wrld) { // default cunstructor
    pos.set(width/2, height/2);
    vel.set(0.5, -2);
    world = wrld;

    assignID();
    mass = sqrt(radius) * PI;
  }

  Ball (float x, float y, PVector vel_, World wrld) { // default cunstructor
    pos.set(x, y);
    vel.set(0.5, -2);
    vel = vel_;
    world = wrld;
    mass = sqrt(radius) * PI;

    assignID();
  }

  void render () {
    fill(clr);
    circle(pos.x, pos.y, size);
  }
  
  void collide(){
    // ball collision
    for (WorldEntity e : world.entities) {
      if (pos.dist(e.pos) < radius + e.radius && ID != e.ID) {

        println("collision", pos.dist(e.pos), radius);
        collide(e);
      }
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

    

    pos.x += vel.x;
    pos.y += vel.y;

    vel.y += world.g;
    //vel.mult(0.995); // drag
  }
}
