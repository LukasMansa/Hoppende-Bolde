class Wall extends WorldEntity{
  
  PVector end = new PVector();
  PVector pos = new PVector();
  
  Wall(float x, float y, float bx, float by){
    pos.set(x,y);
    end.set(bx,by);
  }
  void render(){
  fill(0);
  strokeWeight(4);
  line(pos.x, pos.y, end.x, end.y);
  }
  
}
