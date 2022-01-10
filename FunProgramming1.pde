int numMaxRect = 200;
int numRect = 0;

void setup()
{
  //fullScreen();
  size(800, 800);
  background(255);
}

void draw() 
{
  fill(random(255),random(255),255);
  noStroke();
  ellipse(random(width), random(height), random(200), random(200));
   
  numRect++;
  if(numRect > numMaxRect){
    background(255);
    numRect = 0;
  }
  
}
