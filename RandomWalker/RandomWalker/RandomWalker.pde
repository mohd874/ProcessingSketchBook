PVector loc = new PVector(200,200);
PVector up = new PVector(0,1);
PVector dw = new PVector(0,-1);
PVector rt = new PVector(1,0);
PVector lf = new PVector(-1,0);

Walker w;

void setup(){
  size(600,600);
  background(255);
  w = new Walker();
}

void draw(){
  int ran = (int)random(4);
  
  switch(ran){
    case 0:
      loc.add(up);
      break;
    case 1:
      loc.add(dw);
      break;
    case 2:
      loc.add(rt);
      break;
    case 3:
      loc.add(lf);
      break;
  }  
  
  fill(175);
  stroke(0);
  ellipse(loc.x, loc.y, 16,16);
  
  w.step();
  w.display();
}

