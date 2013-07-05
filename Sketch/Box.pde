class Box {

  float w;
  float h;
  boolean inverted;

  Box(boolean inverted_) {
    w = 20;
    h = 20;
    inverted = inverted_;
  }

  void display() {
    if (inverted) {
      rectMode(CENTER);
      fill(-mouseX+width);
      rect(-mouseX+width, -mouseY+height, w, h);
    }
    else {
      rectMode(CENTER);
      fill(mouseX);
      rect(mouseX, mouseY, w, h);
    }
  }
  
}

