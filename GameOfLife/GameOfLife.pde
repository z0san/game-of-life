boolean [][] cells;
PVector MM = new PVector(0, 0), size = new PVector(0, 0), current = new PVector(-1, -1), pos = new PVector(-1, -1);

void setup(){
  size(1500, 900);
  //fullScreen();
  stroke(255/2);
  preDisplay();
}



void draw(){
  //println(frameRate);
  display();
  if(mouseButton == LEFT){
    if(mouseX >= 0 && mouseX < MM.x){
      //I know this is more inefficient however it is much more clear for me while developing
      if(mouseY >= 0 && mouseY < MM.y){
        pos.x = int((mouseX * size.x)/MM.x);
        pos.y = int((mouseY * size.y)/MM.y);
        if(current.x != pos.x || current.y != pos.y){
          cells[int(pos.x)][int(pos.y)] = !cells[int(pos.x)][int(pos.y)];
          current.x = pos.x;
          current.y = pos.y;
        }
      }
    }
  }else{
    current.x = -1;
    current.y = -1;
  }
}

void preDisplay(){
  MM.x = width;
  MM.y = height-100;
  
  size.x = int(MM.x/15);
  size.y = int(MM.y/15);
  
  cells= new boolean[int(size.x)][int(size.y)];
  
}

void display(){
  println(size.x, size.y);
  for (int x = 0; x < size.x; x++){
    for (int y= 0; y < size.y; y++){
      if(cells[x][y]){
        fill(255);
      }else{
        fill(0);
      }
      rect((MM.x*x)/size.x, (MM.y*y)/size.y, MM.x/size.x, MM.y/size.y);
    }
  }
}