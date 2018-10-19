NormalParticle [] particle;
OddballParticle oddball;
JumboParticle jumbo;
void setup()
{
  size(500,500);
  particle = new NormalParticle[100];
  oddball = new OddballParticle();
  jumbo = new JumboParticle();
  for (int i = 0; i < particle.length; i++)
  {
    particle[i] = new NormalParticle();
  }
  frameRate(35);

}
void draw()
{
  background(0);
  for(int i = 0; i < particle.length; i++)
  {
    particle[i].move();
    particle[i].show();
  }
  oddball.move();
  oddball.show();
  jumbo.move();
  jumbo.show();
}

class NormalParticle implements Particle
{
  double myX, myY, speed, angle; 
  NormalParticle()
  {
    myX = myY = 250;
    angle = (double)(Math.random()*2*Math.PI);
    speed = (double)(Math.random()*20);
  }  
  
  public void move()
  {
    myX += (Math.cos(angle) * speed); 
    myY += (Math.sin(angle) * speed);
    
  }
  
  public void show()
  {
      int r = (int)(Math.random()*255);
      int g = (int)(Math.random()*255);
      int b = (int)(Math.random()*255);
      fill(r,g,b);
      ellipse((int)myX,(int)myY,6,6);
  }
}

interface Particle 
{
  public void show();
  public void move();
  
}


class OddballParticle implements Particle
{
  int myX, myY;
  OddballParticle()
  {
    myX = myY = 250;
  }
  public void move() 
  {
     myY += (int)(Math.random()*5);
     myX += (int)(Math.random()*5)-2;
     
  }
  public void show()
  {
    fill(255, 204, 102);
    rect(myX,myY,20,20);
    line(myX+10, myY, myX+10, myY+20);
    line(myX, myY+10, myX+20, myY+10);
  }
}


class JumboParticle extends NormalParticle
{
  public void show()
  {
     fill(255,255,255);
     ellipse((int)myX, (int)myY, 40,40);
  }
}

void mousePressed(){
  setup();
}