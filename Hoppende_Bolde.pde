int WECount = 0;
World world;
Ball b;


float density = 1;


void setup()
{
  world = new World();
  size(512, 512);
}


void draw()  
{
  fill(220,220,220, 150);
  rect(0, 0, width, height);
  world.run();
}
