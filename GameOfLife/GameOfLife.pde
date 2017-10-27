int MMwidth, MMheight;
int sizex, sizey;
boolean [][] cells;
PVector current = new PVector(-1, -1);
int posx = -1, posy = -1;

void setup(){
  size(1500, 900);
  //fullScreen();
  stroke(255/2);
  
  MMwidth = width;
  MMheight = height-100;
  
  sizex = MMwidth/15;
  sizey = MMheight/15;
  
  cells= new boolean[sizex][sizey];
}



void draw(){
  println(frameRate);
  display();
  if(mouseButton == LEFT){
    if(mouseX >= 0 && mouseX < MMwidth){
      //I know this is more inefficient however it is much more clear for me while developing
      if(mouseY >= 0 && mouseY < MMheight){
        posx = (mouseX * sizex)/MMwidth;
        posy = (mouseY * sizey)/MMheight;
        if(current.x != posx || current.y != posy){
          cells[posx][posy] = !cells[posx][posy];
          current.x = posx;
          current.y = posy;
        }
      }
    }
  }else{
    current.x = -1;
    current.y = -1;
  }
}


void display(){
  for (int x = 0; x < sizex; x++){
    for (int y= 0; y < sizey; y++){
      if(cells[x][y]){
        fill(255);
      }else{
        fill(0);
      }
      rect((MMwidth*x)/sizex, (MMheight*y)/sizey, MMwidth/sizex, MMheight/sizey);
    }
  }
}