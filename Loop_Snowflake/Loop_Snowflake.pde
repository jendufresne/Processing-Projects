void setup () {
  size (960, 960);
  background (#FFFFFF); //white background color
  noLoop();
}

void draw () {
  pinkQuad(); //call pink quad function created below
  navyQuad (); //call navy quad function created below
}

void pinkQuad () {
  for (int x=60; x<= width; x = x + 120) {
    for (int y=60; y<= height; y = y + 120) { 
      fill (#FF3366); //hot pink fill color
      quad (x, y, x + 40, y - 20, x+60, y-60, x+20, y-40); // quad on top right
      quad (x, y, x-20, y- 40, x-60, y-60, x-40, y-20); //quad on top left
      quad (x, y, x - 40, y + 20, x - 60, y + 60, x - 20, y + 40); // quad on bottom left
      quad (x, y, x + 20, y + 40, x + 60, y + 60, x + 40, y + 20); // quad on bottom right
    }
  }
} // end pinkQuad function

void navyQuad () {
  for (int x=60; x<= width; x = x + 120) {
    for (int y=60; y<= height; y = y + 120) { 
      fill(#000033);
      quad (x, y, x - 40, y - 20, x - 60, y, x-40, y+20); // left most quad
      quad (x, y, x + 20, y- 40, x, y-60, x-20, y-40); //top quad
      quad (x, y, x + 40, y + 20, x + 60, y, x + 40, y - 20); // right most quad
      quad (x, y, x - 20, y + 40, x, y + 60, x + 20, y + 40); // quad on bottom
    }
  }
} //end navyQuad function