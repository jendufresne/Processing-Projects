int wide= 500;
int height = 500;

void setup () {
  size (500, 500);
  background (#FFFFFF); //white background color
  stroke(#000033); //navy shape outline 
  fill (#FF3366); //hot pink triangle fill color
  noLoop(); 


for(int x=0; x< width; x = x + 50){
  for(int y=0; y < height; y = y + 50) { 
 triangle (x, y, x + 50, y, x+25, y+50); 
  }
}
}