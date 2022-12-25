//instance variables
PImage sky, grass, wall, gameover, gamewon; // this store the image in the program
int bgx, bgX= 0;
int Score = 0;
int Lives = 3;
Defender def; // this is not object but a reference that point to a Defender object
Stone stone; // stone point to the Stone object
boolean gameMode = false; // this indicates the state of the game
int spawnTimer = 0;

//when array list is created it empty to begin but can add things to it using the add method
//first attacker will be allocated to index 0
//second attacker will be allocated to index 1
ArrayList<Attacker> attackList = new ArrayList(); //attackList point to a Attacker object
ArrayList<Stone> stoneList = new ArrayList(); //stoneList point to a Stone object

void setup()
{
  size(1000,800); // set the size of the screen
  sky = loadImage("partly sky.jpg");;// this loads from .pde source code directory
  sky.resize(width,height/5);
  wall = loadImage("castle wall.jpg");;// this loads from .pde source code directory
  wall.resize(width,550);
  grass = loadImage("green grass.png");;// this loads from .pde source code directory
  grass.resize(width,height/5); 
  gameover = loadImage("gameover.png");;// this loads from .pde source code directory
  gameover.resize(width,height);
  gamewon = loadImage("youwin.png");;// this loads from .pde source code directory
  gamewon.resize(width,height);
  def = new Defender(random(width),22); // this is the position of te defender whe first lunched before it been move with keyPress
  stone = new Stone(random(width),22); //this is the position of the bullet in recpect to the defender whe first lunched
  stoneList = new ArrayList<Stone>();
  
  
  //Loop 7 times to draw the attacker
  for(int attackCounter = 0; attackCounter < 7; attackCounter++)
  {
    attackList.add( new Attacker((int)random(800),height+(int)random(200),1 ) );
  }

}


void draw()
{
  if (gameMode == false)
  {
    drawBackground();
    def.update();
    stone.update();
    
    spawnTimer++;
    if (spawnTimer % 360 == 0) // this is every 6  seconds
    {
      attackList.add(new Attacker((int)random(800),height+(int)random(200),1 )); // display attacker every 6 seconds
    }
     for(int attackCounter = 0; attackCounter < attackList.size(); attackCounter++)
    {
        Attacker currentAttacker = attackList.get(attackCounter); // this is NOT to draw an attaker but serves as refrence for the object that point to Attacker
        currentAttacker.update();
      if (attackList.get(attackCounter).isShot)
      {
        attackList.remove(attackCounter);
      }
       
      //if defender crash into the current attacker, 
      if(def.crash(currentAttacker))
      {
        attackList.remove(attackCounter); //remove current attacker
        Lives = Lives - 1; // subtract 1 from lives when the defender crashes with attacker
      }
      
      //if the score is 100
      else if (Score == 100)//When the score hit 100 the game will display a gamewon screen 
      {
        gameMode = true; // when the score is 100 it sets gamemode to true 
        GameWon(); //this displays the game won screen when the gamemode is set to true since the score equals 100
      } 
    }
    
    //if lives is 0
    if (Lives == 0)//When the lives hit 0 the game will display a gameover screen 
    {
      gameMode = true; // when the lives is 0 it sets gamemode to true 
      GameOver(); //this displays the gameover screen
    } 
    // if the stone is shot remove the currentAttacker
     for (int attackCounter = stoneList.size()-1; attackCounter > 0; attackCounter--) 
     {
       if (stoneList.get(attackCounter).isShot) //stone touches the attacker
       {
         stoneList.remove(attackCounter); // remove attacker
         attackList.add(new Attacker((int)random(800),height+(int)random(200),1 )); //displays a new atacker when the alien is shot.
         Score = Score + 1; // add 1 to score when the stone collides with attacker
       }
     }
     
    //remove both stone and attacker when stone crashes with attacker
    for(int i=0; i < stoneList.size(); i++)
    {
        stoneList.get(i).update();
        for(int attackCounter = 0; attackCounter < attackList.size(); attackCounter++)
        {
          if (stoneList.get(i).crash(attackList.get(attackCounter))) // when stone crashes with attacker
          {
            attackList.get(attackCounter).shot(); // remove current attacker
            stoneList.get(i).shot(); // remove stone
          }
       }
    }  
  }
}


void drawBackground()
{
  image(sky, bgX, 0 );
   //draw image again off the right of the canvas
  image(sky, bgX+sky.width, 0);    // this indirectly makes background move
  bgX = bgX- 4;
  if(bgX == -sky.width) //if first image completely off the canvas
  {
   bgX=0; //reset back to initial value background
  }
  
  textSize(30);
  fill(255);
  text("Seige Game", 30, 30); // ths is to display text as in title of the game 
  text("Score:", 800, 30); // this dislays a text at the right upper corner of the screen at 0 that will increase when an Attacker as been shot by stone
  text(Score, 890, 30); 
  text("Lives:", 800, 60); // this dislays a text at the right upper corner of the screen at 3 that will reduce when the defender collides with an attacker
  text(Lives, 890, 60);
  image(wall, bgx, 160);
  image(grass, bgx, 640);
}

void GameOver()
{
 image(gameover, 0, 0 );
}


void GameWon()
{
 image(gamewon, 0, 0 );
}


void keyPressed() 
{
  if(keyCode == LEFT) // the defender should move up when up is hit
  {
    def.x=def.x - 10; 
  }
  
  if(keyCode == RIGHT)  // the defender should move up when up is hit
  {
    def.x = def.x + 10; 
  } 
  if (key == ' ')
  {
    stoneList.add(new Stone(def.x, def.y));// press the key Space to get a new bullet
  }
}
