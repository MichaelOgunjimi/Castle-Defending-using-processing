//templete for defender
class Defender
{
   //this are instances variables
   float x;  //variable for the positioning 
   final float y; // this the y position of the bullet; the final makes the position constant i.e not to change it y position 
   PImage defN, defS; // this store the image in the program
  
   // the constructor this is responsible for building an object for the class defender
  Defender(float x, float y) // this is the positioning of the attacker
  {
     this.x = x; // this means the value given to x also applies to this.x
     this.y = y; // this means the value given to y also applies to this.y
     defN = loadImage("Defender N.png"); // this loads from .pde source code directory
     defS = loadImage("Defender S.png"); // this loads from .pde source code directory
  }
   
   void update() // this calls render procedeure and calls it in order
   {
     render();
   }
   
  //this a procedure
  void render() // this is display; draws the defender
  {
 image(defS,this.x,this.y);    
  }
  
  
  //this is a function
   boolean crash(Attacker attack) //this determine the colluson between the defender and attacker
   {
     return abs(this.x-attack.x) < 60 && abs(this.y - attack.y) < 100;
   }  
}

//End of class
