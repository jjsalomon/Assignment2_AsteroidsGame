class Asteroid extends GameObject implements Interface
{

  float points;
  float rotSpeed;
  float radius;
  float rot;
  float size;
  float x, y, a, v, r, w, s; 

  float[] vertx = new float[16];
  float[] verty= new float[16];

  void applyTo(Ship ship)
  {
  }

  void applyTo2(Asteroid ast)
  {
  }

  Asteroid()
  { 
    super(width * 0.5f, height  * 0.5f, 50);
    forward.x = random(-1, 1);
    forward.y = random(-1, 1);
    //sets the forward vector to 1
    forward.normalize();
    pos.x = random(0, width);
    pos.y = random(0, height);
  }
  void render()
  {
  }

  void render2() 
  { 
    for (int i = 0; i < 16; i++) 
    { 
      // The vertices are generated radially 
      // A vertice is generated at an angle of 0 with a random distance from the center of the asteroid 
      // Then the next vertice is PI/8 radians rotated from the previous one and generated with a new random distance from the center 
      // Ask Lambert, it's a lot easier to explain in person 
      vertx[i] = sin(i*PI/8)*(s + random(-s/4, s/4)); 
      verty[i] = cos(i*PI/8)*(s + random(-s/4, s/4));
    }
    pushMatrix();
    translate(pos.x, pos.y);
    //rotate(theta);
    //white 
    fill(0);
    stroke(255);
    strokeWeight(1); 
    rotate(r); 
    // Places the vertices of the polygon 
    beginShape(); 
    int[] xpts = {
      -20, 0, 18, 22, 5, 20, 17, -3, -17, -18, -26,-20                    };
    int[] ypts = {
      -15, -24, -20, -5, 0, 10, 20, 26, 23, 14, 7,-15                    };

    beginShape(POLYGON);
    for(int i = 0; i < 12; i++) {
      vertex(xpts[i], ypts[i]);
    }
    endShape(); 
    rotate(-r);

    //ellipse(-halfW,-halfW,w,w);

    popMatrix();
  }

  void update()
  {
    pos.add(forward);
    //powerup rotation
    theta += 0.01f;
    //wrap around
    if (pos.x < 0)
    {
      pos.x = width;
    }

    if (pos.y < 0)
    {

      pos.y = height;
    }

    if (pos.x > width)
    {
      pos.x = 0;
    }
  }
}