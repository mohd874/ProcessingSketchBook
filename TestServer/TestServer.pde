import processing.net.*;

Server s;
String input;
PFont font;

void setup() {
  size(450, 255);
  background(204);
  stroke(0);
  font = createFont("Arial", 26);
  textFont(font);
  s = new Server(this, 8888);
}

void draw() {
  background(255);
  if (keyPressed) {
    text(key,30,30);
    s.write(key);
  }
  
  Client c = s.available();
  if (c != null) {
    print(c.readString());
  }
}

void mousePressed(){
   s.write(mouseX+" "+mouseY); 
}
