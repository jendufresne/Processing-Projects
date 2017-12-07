float maxLatitude = 30.0 ;    // Reject latitude numbers greater than this
float minLatitude = 27.0  ;   // Reject latitude numbers less than this
float maxLongitude = -83.0 ;  // Reject longitude numbers less than this
float minLongitude = -79.0 ;  // Reject longitude numbers greater than this

String lines[] ;              // Holds lines from file read with loadStrings ( )
String fields[] ;             // Split each line into these, using spaces as a delimiter

int lineNo = 0 ;              // count lines read
int nDropped = 0 ;            // count lines ignored for bad latitude or longitude

ArrayList<Coordinate> points ; // Holds the latitude, longitude and altitude for each line

int pointCounter = 0;        // counts the total number of lines (observations) kept


// One time stuff
void setup ( )
{
  // Instantiate a collection to hold the lat, long, and altitude
  points = new ArrayList<Coordinate> ( ) ; 

  // **** (1) Set the size and background color as you wish
  size ( 500, 500 ) ;
  background ( 0 ) ;

  // In constrast to RBG, HSV allows us to adjust the "hotness" of colors to correspond
  // to altitudes. This allows 100 possible shades of color
  colorMode ( HSB, 100, 100, 100 ) ;

  print( "Loading data..." ) ;
  // **** (2) Insert code here to loadStrings from the file into the lines array
  String lines[]= loadStrings("planes_project.txt");
  println ( "Done, read " + lines.length + " lines" ) ;


  print ( "Picking values within lat and long limits:..." ) ;
  for ( int i = 0; i < lines.length; i++ )
  {
    // (3) **** add code here using splitTokens ( ) to split each line [ i ] into the fields String array, using 
    // **** spaces as the delimiter

    String [] fields= splitTokens(lines[i], " ");

    // (4) **** Only keep lines for which all data is present AND which have the date you selected.
    if ( (fields.length == 9) && (fields[0].equals ("20160317")))
    {
      // (5) **** add code here to set a float variable for each of latitude, longitude and altitude
      // **** Use float to convert the Strings in the fields array to floats.
      // ****
      // **** Note that field #5 is latitude, field #6 is longitude and field #4 is altitude
      // **** You will need to declare a float variable for latitude, longitude and altitude, too.

      float altitude = float(fields[4]);
      float latitude =  float(fields[5]);
      float longitude = float(fields[6]);

      // (6) **** add a logical expression here that will keep only those observations where the 
      // **** latitude and longitude meet the constraints set up in maxLatitude, maxLongitude,
      // **** and so on. 

      if ((latitude >= minLatitude) && (latitude <= maxLatitude)  && (longitude <= minLongitude) && (longitude >= maxLongitude)  ) 
      {
        points.add ( new Coordinate(latitude, longitude, altitude) ) ;
      } else
      {
        nDropped ++ ;
      } // end has sane lat and long
    } // endif has enough fields
  } // end for each line

  println ( "Dropped: " + nDropped ) ;
  println ( "Left: " + points.size ( ) ) ;
}

void draw ( )
{
  Coordinate c = points.get (pointCounter);

  // **** (7) Declare and initialize three float variables -- x, y and z.  Variable x
  // **** is based on longitude, variable y on latitude, and variable z on altitude
  // ****
  // **** Use c.lat to get the latitude for this point, c.lng to get the longitude, and c.alt to get the
  // **** altitude.
  float x = c.lng;
  float y = c.lat;
  float z = c.alt;
  // **** (8) Use the map ( ) function (see the NBA project for examples) to map c.lat values between maxLatitude and
  // **** minLatitude into y values from 0 to height (the height of the display window).
  // **** Use map to map c.lng values between maxLongitude and minLongitude to x values between 0 and width
  // **** Use map to map c.alt values between 0 and 35000 feet into values between 0 and 100 (the range of color
  // **** we set with colorMode ( ) in setup ( )

  x = map (x, minLongitude, maxLongitude, 0, 500);
  y = map (y, minLatitude, maxLatitude, 0, 500);
  z = map (z, 0, 35000, 0, 100);

  stroke ( z, 100, 100 ) ;  // Set the color of the point to represent altitude
  point ( x, y ) ;          // draw the point
  pointCounter ++ ;

  // Stop when we run out of data (takes a LONG time)
  if ( pointCounter >= points.size ( ) )
  {
    println ( "Done!" + hour ( ) + ":" + minute ( ) + ":" + second ( ) );
    noLoop();
  }
}

// Example for OO programming.  A very simple class to hold the latitude
// longitude and altitude numbers in a single object
// You don't need to change any of this...
class Coordinate
{
  float lat ;
  float lng ;
  float alt ;

  Coordinate ( float pLat, float pLng, float pAlt )
  {
    lat = pLat ;
    lng = pLng ;
    alt = pAlt ;
  }
}