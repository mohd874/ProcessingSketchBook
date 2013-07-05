class Concave {
  Vec2[] vertices;
  Body body;
  
  Concave(Vec2[] pixelPoints){
    vertices = new Vec2[pixelPoints.length];
    for(int i = 0; i < pixelPoints.length; i++){
       Vec2 point = pixelPoints[i];
       vertices[i] = box2d.coordPixelsToWorld(point); 
    }
    
    PolygonShape shape = new PolygonShape();
    shape.set(vertices, vertices.length);
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);
    body.createFixture(shape, 1);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    
    beginShape();
    for(int i = 0; i < ps.getVertexCount(); i++){
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
