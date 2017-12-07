String [][] nbaData = { // Columns go across, rows go down.  Each is numbered starting from 0
  //          0      1             2              3     4    5       6        7        8       9   10   11    12    13    14   15     16   17     18   19    20   
/* 0 */  { "Rank", "PlayerFname", "PlayerLname", "Age", "Tm", "First", "PtsWon", "PtsMax", "Share", "G", "MP", "PTS", "TRB", "AST", "STL", "BLK", "FG%", "3P%", "FT%", "WS", "WS/48" }, 
/* 1 */  { "1", "Stephen", "Curry", "26", "GSW", "100.0", "1198.0", "1300", "0.922", "80", "32.7", "23.8", "4.3", "7.7", "2.0", "0.2", ".487", ".443", ".914", "15.7", ".288" }, 
/* 2 */  { "2", "James", "Harden", "25", "HOU", "25.0", "936.0", "1300", "0.720", "81", "36.8", "27.4", "5.7", "7.0", "1.9", "0.7", ".440", ".375", ".868", "16.4", ".265" }, 
/* 3 */  { "3", "LeBron", "James", "30", "CLE", "5.0", "552.0", "1300", "0.425", "69", "36.1", "25.3", "6.0", "7.4", "1.6", "0.7", ".488", ".354", ".710", "10.4", ".199" }, 
/* 4 */  { "4", "Russell", "Westbrook", "26", "OKC", "0.0", "352.0", "1300", "0.271", "67", "34.4", "28.1", "7.3", "8.6", "2.1", "0.2", ".426", ".299", ".835", "10.6", ".222" }, 
/* 5 */  { "5", "Anthony", "Davis", "21", "NOP", "0.0", "203.0", "1300", "0.156", "68", "36.1", "24.4", "10.2", "2.2", "1.5", "2.9", ".535", ".083", ".805", "14.0", ".274" }, 
/* 6 */  { "6", "Chris", "Paul", "29", "LAC", "0.0", "124.0", "1300", "0.095", "82", "34.8", "19.1", "4.6", "10.2", "1.9", "0.2", ".485", ".398", ".900", "16.1", ".270" }, 
/* 7 */  { "7", "LaMarcus", "Aldridge", "29", "POR", "0.0", "6.0", "1300", "0.005", "71", "35.4", "23.4", "10.2", "1.7", "0.7", "1.0", ".466", ".352", ".845", "8.6", ".165" }, 
/* 8 */  { "9T", "Marc", "Gasol", "30", "MEM", "0.0", "3.0", "1300", "0.002", "81", "33.2", "17.4", "7.8", "3.8", "0.9", "1.6", ".494", ".176", ".795", "10.2", ".182" }, 
/* 9 */  { "9T", "Blake", "Griffin", "25", "LAC", "0.0", "3.0", "1300", "0.002", "67", "35.2", "21.9", "7.6", "5.3", "0.9", "0.5", ".502", ".400", ".728", "9.0", ".183" }, 
/* 10 */  { "12T", "Tim", "Duncan", "38", "SAS", "0.0", "1.0", "1300", "0.001", "77", "28.9", "13.9", "9.1", "3.0", "0.8", "2.0", ".512", ".286", ".740", "9.6", ".207" }, 
/* 11 */  { "12T", "Kawhi", "Leonard", "23", "SAS", "0.0", "1.0", "1300", "0.001", "64", "31.8", "16.5", "7.2", "2.5", "2.3", "0.8", ".479", ".349", ".802", "8.6", ".204" }, 
/* 12 */  { "12T", "Klay", "Thompson", "24", "GSW", "0.0", "1.0", "1300", "0.001", "77", "31.9", "21.7", "3.2", "2.9", "1.1", "0.8", ".463", ".439", ".879", "8.8", ".172" }
} ;//end arrayA

String [][] teamColors = {
/* 0 */  {"team", "color value 1R", "color value 1G", "color value 1B", "color value 2R", "color value 2G", "color value 2B"}, 
/* 1 */  {"GSW", "0", "17", "255", "255", "205", "0"}, 
/* 2 */  {"HOU", "206", "17", "65", "162", "169", "177"}, 
/* 3 */  {"CLE", "134", "0", "56", "#253", "187", "48"}, 
/* 4 */  {"OKC", "0", "122", "193", "239", "59", "36"}, 
/* 5 */  {"NOP", "0", "43", "92", "180", "151", "90"}, 
/* 6 */  {"LAC", "237", "23", "76", "0", "107", "182"}, 
/* 7 */  {"POR", "224", "58", "62", "0", "0", "0"}, 
/* 8 */  {"MEM", "0", "40", "94", "97", "137", "185"}, 
/* 9 */  {"SAS", "0", "0", "0", "196", "206", "212"}


};//end arrayB

int high = 500;
int wide = 500;

void labelXAxis ( String title )
{
  text ( title, (wide / 2) - ( title.length ( ) / 2 ), 10 ) ;
} // end labelXAxis ( )

void labelYAxis ( String title )
{
  pushMatrix();
  translate(10, high/2);
  rotate(HALF_PI);
  text(title, 0, 0);
  popMatrix();
} // end labelYAxis ( )

void setup ( )
{
  size ( 500, 500 ) ;
  background ( #FFFFFF ) ; //
  noLoop ( ) ;

  fill(#000000);
  labelXAxis ( "Free Throw %" ) ;
  fill(#000000);
  labelYAxis ( "Points" ) ;

  line(50, 50, 450, 50);
  line(50, 50, 50, 450);

  //Loop starts at 1 because that is where the data begins
  for ( int rowA = 1; rowA <= 12; rowA++ ) {
    float fT = float ( nbaData[rowA][18] ); 
    float tP = float ( nbaData[rowA][11] );

    float mapFT = map(fT, 0.7, 1, 50, 450);
    float mapTP = map(tP, 12, 30, 50, 450);
    String arrayATeam = (nbaData[rowA][4]);

    for (int rowB = 1; rowB <= 9; rowB++) {
      String arrayBTeam = (teamColors[rowB][0]);
      int cv1R = int(teamColors[rowB][1]);
      int cv1G = int(teamColors[rowB][2]);
      int cv1B = int(teamColors[rowB][3]);
      int cv2R = int(teamColors[rowB][4]);
      int cv2G = int(teamColors[rowB][5]);
      int cv2B = int(teamColors[rowB][6]);

      if (arrayATeam == arrayBTeam) { //to match up team names between arrays 
        fill(cv1R, cv1G, cv1B); //team color 1
        stroke(cv2R, cv2G, cv2B); //team color 2
        strokeWeight(2);
        ellipse(mapFT, mapTP, 10, 10);
        text(nbaData[rowA][2], mapFT+7, mapTP+7); //show player last names
      }// end if
    }//end 2nd for
  } // end 1st for
}// end setup ()