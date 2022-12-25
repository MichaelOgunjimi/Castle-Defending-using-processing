class Stone
{
  //this are instances variables
  float x, y; //this is the position for the stone
  int speed = 7;
  PImage stone; // this store the image in the program
  boolean isShot;
  
   // the constructor this is responsible for building an object for the class stone
  Stone (float y, float x) // the position of the stone
  {
    this.x = def.x; // this means the value given to x also applies to this.x
    this.y = def.y; // this means the value given to x also applies to this.x
    stone = loadImage("stone.png"); // this loads from .pde source code directory
  }
  
  void update() // this calls the move and render procedure in order
   {
     draw();
     move();
   }
  
  //this is called method or a procedure
  void draw() // this is used to draw the stone
  {
    image(stone,this.x,this.y);
  }
  
  //this is called method or a procedure
  void move()// this is the functon that tiggers the movemet ofn the stone
  {
    this.y = y + speed ; // this is the speed of the stone 
  }
  //this a function
  boolean crash(Attacker attack) 
  {
   return abs(this.x-attack.x) < 60 && abs(this.y - attack.y) < 20;
  }
   
   void shot()
   {
    this.isShot = true;
   }
}
//End of class
