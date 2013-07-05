import processing.net.*;

Client c;
PFont font;

void setup() {
  size(450, 255);
  background(204);
  stroke(0);
  //frameRate(5); // Slow it down a little
  font = createFont("Arial", 26);
  textFont(font);
  // Connect to the server's IP address and port
  c = new Client(this, "127.0.0.1", 8888); // Replace with your server's IP and port
}

void draw() {
  background(255);
  if (keyPressed) {
    text(key,30,30);
    c.write(key);
  }
  
  if (c.available() > 0) {
    print(c.readString());
  }
}

void mousePressed(){
   c.write(mouseX+" "+mouseY); 
}
