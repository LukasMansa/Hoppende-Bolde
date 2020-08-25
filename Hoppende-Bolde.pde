int WECount = 0;
World world;


float density = 1;


void setup()
{
  world = new World();
  size(1000, 1000);
}


void draw()  
{
  fill(220, 220, 220, 150);
  rect(0, 0, width, height);
  world.run();
}
