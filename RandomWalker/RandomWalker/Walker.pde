class Walker {
  float x;
  float y;
  
  Walker() {
    x = width/2;
    y = height/2;    
  }
  
  void display(){
    stroke(0);
    point(x,y);
  }
  
  void step(){
    /*int choice = (int)random(4);
    
    if(choice == 0){
      x++;
    }else if(choice == 1){
      x--;
    }else if(choice == 2){
      y++;
    }else {
      y--;
    }
    */
    
    int xstep = (int)random(3) -1;
    int ystep = (int)random(3) -1;
    
    x += xstep;
    y += ystep;
  }
}

