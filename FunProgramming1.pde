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
