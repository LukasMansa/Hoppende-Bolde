class Ball extends WorldEntity
{
  World world;
  
  float size = 35;
  color clr = #14BAAF;

  Ball (World wrld) { // default cunstructor
    pos.set(width/2, height/2);
    vel.set(0.5, -2);
    world = wrld;
  }

  Ball (float x, float y, PVector vel_, World wrld) { // default cunstructor
    pos.set(x, y);
    vel.set(0.5, -2);
    vel = vel_;
    world = wrld;
  }

  void render () {
    fill(clr);
    circle(pos.x, pos.y, size);
  }
  void move() {
    
    float specX = vel.x + pos.x;
    float specY = vel.y + pos.y;
    

    if (specX < world.xBounds[0] || specX > world.xBounds[1]) {
      vel.x *= -0.96;
    }
    
    if (specY < world.yBounds[0] || specY > world.yBounds[1]) {
      vel.y *= -0.96;
    }
    pos.x += vel.x;
    pos.y += vel.y;
    
    vel.y += world.g;
    //vel.mult(0.995); // drag
  }
}
