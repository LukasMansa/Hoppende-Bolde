class Wall extends WorldEntity{
  
  PVector end = new PVector();
  PVector pos = new PVector();
  
  Wall(float x, float y, float bx, float by){
    pos.set(x,y);
    end.set(bx,by);
  }
  
  
}
