ArrayList<Star> stars;
int numStars = 5000;


public void setup(){
  fullScreen();
//  size(800, 800);
  background(0);
  noStroke();
  fill(255);
  
  stars = new ArrayList<Star>();
  
  for(int i = 0; i < 100; i++)
    stars.add(new Star() );

}

public void draw(){
  background(0);
  for(int i = stars.size() - 1; i >= 0; i--)
    if(Math.abs(stars.get(i).getX()) > width/2 || Math.abs(stars.get(i).getY()) > width/2)
      stars.remove(i);
  if(stars.size() < numStars)
     for(int i = 0; i < (int)stars.get(0).rt; i++)
       stars.add(new Star());  
  translate(width/2, height/2);
  for(Star s : stars){
    s.drawStar();
    s.updateStar();  
  }

}
class Star{
  
  float r;
  float angle;
  float rt;
  float radius;
  float prevR;
  float prevR2;
  int counter;
  
  public Star(){
    r = random(0, width/2);
    angle = random(0, 2*PI);
    radius = 1;
    rt = 0;
  }
  
  public void updateStar(){
    prevR2 = prevR;
    prevR = r;
       
    rt = map(mouseX, 0, width, 0, 50);
    
    r += rt;
    angle += map(mouseY, 0, height, -PI/90, PI/90);
    
    radius = map(Math.abs(getX()), 0, width/2, 1, 5);
  }
  
  public float getX(){
    return r*cos(angle);
  }
  
  public float getY(){
    return r*sin(angle);
  }
  
  public void drawStar()
  {
    counter++;
    noStroke();
    circle(r*cos(angle), r*sin(angle), radius*2);
    stroke(255);
    if(counter > 3)
      line(r*cos(angle), r*sin(angle), prevR*cos(angle), prevR*sin(angle));
    
  }

}
