//Wind Chill Project

//Defining Project Variables
float T; //T= Temperature (in degrees Farenheight)
float V; //V= Wind Speed (in MPH)
float windChill;  // windChill= Wind Chill Equation 

//Set Values for the Equation's Variables (NUMBERS CAN CHANGE)
T = -30; 
V = 50; 

//Wind Chill Equation (REMAINS CONSTANT)
windChill = 35.74 + 0.6215 * T - 35.75 * pow(V, 0.16) + 0.4275 * T * pow(V, 0.16);

//Defining Output Variables (REMAINS CONSTANT)
String tEquals;
tEquals= "When T=";
String degrees;
degrees = "degrees";
String vEquals;
vEquals="and V=";
String mPH;
mPH= "MPH";
String wcEquals; 
wcEquals= "then the Wind Chill=";

//Change the printed text
size(1500,700); //change the size of the window
background(#ffeff5); //change background color of the window
PFont windChillFont; //declare font
windChillFont = loadFont("Lato-Light-99.vlw"); //load font
textFont (windChillFont); //change font
fill(#1b3c72); //change font color


//Print Wind Chill Equation Output
text(tEquals, 300, 200);
text(T, 690, 200);
text(degrees, 1050, 200);
text(vEquals, 300, 300);
text(V, 600, 300);
text(mPH, 950,300);
text(wcEquals, 300, 400);
text (windChill, 300, 500);
text (degrees,650,500);