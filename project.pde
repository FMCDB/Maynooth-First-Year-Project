void setup()
{
  background(209);
  size(620,650);
}

String bin = "", s1 = "";
  
void draw()
{ 
  textSize(15);
  fill(255);
  text("Hello and welcome to my Decimal/Binary number converter.\nPlease enter a decimal or binary number then press 'b' to convert it to binary \nor 'd' to convert it to decimal.\nWhen you are finished using the converter, please press 'q'.",30,50);
}

int w = 30, h = 150;
boolean q = false;

void keyPressed() //Obtained from https://processing.org/reference/keyPressed_.html
{ 
  try
  {
    if(q == true)
    {
      exit();
    }
    s1 += key;
  
    if(key != 'd' && key != 'b')
      print(key);

    for(int i = 0; i <= s1.length()-2; i++)
    {
      if(Character.isLetter(s1.charAt(i)) == true)  //Obtained from http://docs.oracle.com/javase/7/docs/api/java/lang/Character.html#isLetter(char)
      {
        fill(0);
        text("Please enter a valid decimal or binary number.",w,h);
        println();
        h += 40;
        s1 = "";
        return;
      }
    }
    
    if(h > height )
    {
      background(209);
      h = 130;
    }
    
    //decimal to binary
    if(key == 'b')
    {
      int num = Integer.parseInt(s1.substring(0,s1.length()-1));  //Obtained from https://docs.oracle.com/javase/7/docs/api/java/lang/Integer.html#parseInt(java.lang.String)
      textSize(15);  //Obtained from https://processing.org/reference/textSize_.html
      fill(255,0,0);
      text("Number Entered: "+num+"\nBinary Equivalent: "+Integer.toBinaryString(num),w,h);  //Obtained from https://docs.oracle.com/javase/7/docs/api/java/lang/Integer.html#toBinaryString(int)
      println();
      s1 = "";
      h += 70;
    }
    
    //binary to decimal
    else if(key == 'd')
    {
      for(int i = 0; i <= s1.length()-2; i++)
      {
        if(Character.getNumericValue(s1.charAt(i)) > 1)  //Obtained from http://docs.oracle.com/javase/7/docs/api/java/lang/Character.html#getNumericValue(char)
        {
          fill(0);
          text("You pressed 'd' but the number you entered is already in decimal form.\nIf you would like to convert your decimal number to its equivalent binary form,\nenter the number again and press 'b' to perfrom the conversion.",w,h);
          println();
          h += 90;
          s1 = "";
          return;
        }
      }
      
      int num2 = Integer.parseInt(s1.substring(0,s1.length()-1), 2);
      textSize(15);
      fill(0,0,255);
      text("Number Entered: "+s1.substring(0,s1.length()-1)+"\nDecimal Equivalent: "+num2,w,h);
      println();
      s1 = "";
      h += 70;  
    }
    else if (key == 'q')
    {
      fill(0);
      text("Thank you for using this converter. I hope you had a pleasant experience.\nPlease press any key to exit.",w,h);
      q = true;
    }
  }
  catch(NumberFormatException e)
  {
    fill(0);
    text("Please enter a valid decimal or binary number.",w,h);
    println();
    h += 40;
    s1 = "";
    return;
  }
      
}