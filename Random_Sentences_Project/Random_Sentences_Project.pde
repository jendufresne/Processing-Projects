void setup (){
  //Create Strings with uploading files
  String [] article = loadStrings("articles.txt");
  String [] adj = loadStrings("adj.txt");
  String [] noun = loadStrings("noun.txt");
  String [] adv = loadStrings("adv.txt");
  String [] verb = loadStrings("verb.txt"); 

  // To get number of words in the String arrays. 
  //Allows for new words to be added to files
  int articleNum = article.length;
  int adjNum = adj.length;
  int nounNum = noun.length;
  int advNum = adv.length;
  int verbNum = verb.length;
  
  //Generate random numbers for each part of sentence
  int randomArticle = int (random (articleNum));
  int randomAdj = int ( random (adjNum));
  int randomNoun = int (random (nounNum));
  int randomAdverb = int ( random (advNum));
  int randomVerb = int (random (verbNum)); 
  int randomArticle2 = int (random (articleNum));
  int randomAdj2 = int (random (adjNum));
  int randomNoun2 = int (random (nounNum));
  
  println( 
  article[randomArticle] + " " 
  + adj[randomAdj] + " "
  + noun[randomNoun] + " "
  + adv[randomAdverb] + " "
  + verb[randomVerb] + " "
  + article[randomArticle2] + " "
  + adj[randomAdj2] + " "
  + noun[randomNoun2]
  );
}