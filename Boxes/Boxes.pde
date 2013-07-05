float ow = 100;
float oh = 100;
float diff = 10;
boolean stripe = true;

void setup() {
  size(600, 600);
  rectMode(CENTER);
}

void draw() {
  float w = ow;
  float h = oh;
  stroke(0);
  fill(0);

  ellipse(width/2, height/2, w, h);
  while (w-diff > 0) {
    w -= diff;
    h -= diff;
    if (stripe) {
      fill(175);
    }
    else {
      fill(0);
    }

    stripe = !stripe;   
    ellipse(width/2, height/2, w, h);
  }
  
  ow += 2;
  oh += 2;
}
