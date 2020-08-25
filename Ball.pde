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




  void collide(WorldEntity ent) {
    PVector lpos = pos.copy();
    
    if (ent instanceof Wall) {
      Wall w = ((Wall)ent);
      

      PVector AB = new PVector(w.end.x - w.pos.x, w.end.y-w.pos.y);
      
      PVector BE = new PVector( w.end.x- pos.x,w.end.y -pos.y);
      PVector AE = new PVector(pos.x - w.pos.x, pos.y - w.pos.y);

      float AB_BE = AB.dot(BE);
      float AB_AE = AB.dot(AE);
      
      float distance = 99999999;


      // If dot is left from left dot
      if (AB_AE < 0) { 
        //println("Left", AB_AE);
        distance = w.pos.dist(pos);
      }
      // if dot is right from right dot
      else if (AB_BE < 0) {
        //println("Right", AB_BE);
        distance = w.end.dist(pos);
      }
      
      // if dot is perpendicular to wall
      else {
        //distance = abs((y2-y1)*x0-(x2-x1)*y0 + x2*y1 -y2*x1)/sqrt(sq(y2-y1)+sq(x2-x1));
        //println(distance);
        //println("perp");
        distance = abs((w.end.y - w.pos.y)* lpos.x - (w.end.x - w.pos.x)*lpos.y + (w.end.x*w.pos.y) - (w.end.y*w.pos.x))  / w.end.copy().sub(w.pos).mag();
      }
      if (distance < size) {
        vel.mult(-1);
        //println("wut");
        clr=#ff1010;
      }
      return;
    }


    if (pos.dist(ent.pos) < size && ID != ent.ID) {
      //println("collision", pos.dist(ent.pos), size);
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
