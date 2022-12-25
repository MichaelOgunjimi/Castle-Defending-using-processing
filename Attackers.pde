//templete for attacker
class Attacker
{  
  //this are instances variables
  float x, y; //variables in which the postion are been inputed
  float speedY = 1;
  float animateClimber = 0;
  PImage climb1, climb2, climb3;// this store the image in the program
  boolean isShot;

  // the constructor this is responsible for building an object fof the class attacker 
  Attacker(float x, float y, float speed) //the position for the attackers
   {
    this.x = x;  // this means the value given to x also applies to this.x
    this.y = y; // this means the value given to y also applies to this.y
    this.speedY = speed;// this means the value given to speed also applies to this.speed
    climb1 = loadImage("climber1.png");// this loads from .pde source code directory
    climb2 = loadImage("climber2.png");// this loads from .pde source code directory
    climb3 = loadImage("climber3.png");// this loads from .pde source code directory

   }
   
   void update() // this calls the move and render procedure in order
   {
     render();
     move();
   }
   
   //this is a procedure
   void render() // this is used cycle through the images and back to the first image i.e it displays the first, second and third imagr respectively
   {
     if (animateClimber > 0 & animateClimber < 6)
     {
       image(climb1,this.x,this.y);
     }
     else if (animateClimber > 6 & animateClimber <= 12)
     {
       image(climb2,this.x,this.y);
     }
    else if (animateClimber > 12 & animateClimber <= 17)
     {
       image(climb3,this.x,this.y);
     }
     else 
     {
       image(climb3,this.x,this.y);
     }
     animateClimber = animateClimber +  1;
     if (animateClimber > 17)
       animateClimber = 0;
  }
  
    //this is a procedure
  void move() //this triggers for the movement of the attackers
  {
    y = y - speedY;
    x = x + (int)random(-4, 4); //this makes the attackers move left or right randomly
    if (y < 0)
    {
      y = height;
    }
  }
   //function
  void shot()
  {
    this.isShot = true;
  }
}

//End of class
