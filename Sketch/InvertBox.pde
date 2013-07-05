class InvertBox {

  float w;
  float h;

  InvertBox() {
    w = 20;
    h = 20;
  }
  
  void display(){
    rectMode(CENTER);
    fill(-mouseX+width);
    rect(-mouseX+width, -mouseY+height, w, h);  
  }
}

