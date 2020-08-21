
World world;
Ball b;

void setup()
{
  world = new World();
  world.init();
  size(512, 512);
}


void draw()  
{
  fill(220,220,220, 150);
  rect(0, 0, width, height);
  world.run();
}
