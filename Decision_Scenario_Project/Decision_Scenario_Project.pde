// Variables for the Decision 
float money = 150;

//Boolean Variables
boolean responsibilities = false ; 
boolean friendsWantTo = true ; 
boolean specialOccasion = false ; 

//Conditions
void setup ()
{
if ((responsibilities == false && friendsWantTo == true && money >= 100) || specialOccasion == true) 
{
 println("You can go out no problem"); 
}
else 
{
 println ("You must stay in"); 
}
}