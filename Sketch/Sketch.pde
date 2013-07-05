Box b;
Box ib;
//InvertBox ib;

void setup() {
  size(255, 255);
  
  b = new Box(false);
  ib = new Box(true);
  //ib = new InvertBox();
}

void draw() {
  background(255);

  b.display();
  ib.display();
}

