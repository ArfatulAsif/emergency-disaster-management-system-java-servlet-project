package JavaFiles;

public class PrintCharacter {
       
	  public String Print_200_Characters(String a)
	  {
		  String temp="";
		  
		  int min = 200;
		  
		  if(min>a.length())
		  {
			  min = a.length();
		  }
		  
		  for(int i=0;i<min;i++)
		  {
			  temp += a.charAt(i);
		  }
		  
		  temp+=".";
		  temp+=".";
		  temp+=".";
		 
		  return temp;
	  }
}
