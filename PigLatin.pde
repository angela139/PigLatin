public void setup() 
{
  // Translates the Lowell Hymn to Pig Latin but all words are lowercase and no punctuations
	// String[] lines = loadStrings("LowellHymn.txt");
  String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
     String newString = lines[i].replace(",", "").replace(".", "").toLowerCase();
	   System.out.println(pigLatin(newString));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  for (int i = 0; i < sWord.length(); i++){
   if (sWord.charAt(i) == 'a' || sWord.charAt(i) == 'e' || 
          sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o' || sWord.charAt(i) == 'u'){
     return i;
   }
  }
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  // separates words in string 
  String[] words = sWord.split("\\s+");
  String end = "";
  for (int i = 0; i < words.length; i++){
    // all consonant words
  	if(findFirstVowel(words[i]) == -1)
  	{
  		end += words[i] + "ay ";
  	}
    // words that begin with vowels
    else if (findFirstVowel(words[i]) == 0){
      end += words[i] + "way ";
    }
    // words that begin with qu
    else if (words[i].substring(0, 2).equals("qu")){
      end += words[i].substring(2) + "quay "; 
    }
    // words that begin with consonants
    else if (findFirstVowel(words[i]) != 0){
      end += words[i].substring(findFirstVowel(words[i])) + 
      words[i].substring(0, findFirstVowel(words[i])) +"ay ";
    }
  	else
  	{
  		end = "ERROR!";
  	}
  }
  return end;
}
