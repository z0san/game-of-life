int MMwidth, MMheight;
int sizex, sizey;
boolean [][] cells;

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