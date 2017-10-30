boolean [][] cells;
PVector MM = new PVector(0, 0), size = new PVector(0, 0), current = new PVector(-1, -1), pos = new PVector(-1, -1); 
boolean playing = false;
int zoom = 2;
boolean clicked = false;
float lastT = millis(), speed = 60;

void setup(){
  //size(1500, 900);
  fullScreen();
  stroke(255/2);
  preDisplay();
  
}



void draw(){
  println("frame rate:  ", frameRate);
  println("speed:  ", speed);
  if(playing && millis() >= (lastT + (1000/speed))){
    compute();
    lastT = millis();
  }
  checkMouse();
  display();
  
  if(keyPressed){
    if(key == ' ' && !clicked){
      playing = !playing;
      clicked = true;
    }else if(key == 'm' || key == 'M'){
      randomise();
    }else if (key == 'c' || key == 'C'){
      for(int x = 0; x < size.x; x++){
        for(int y = 0; y < size.y; y++){
          cells[x][y] = false;
        }
      }
    }else if(keyCode == UP && speed < 256){
      speed += 0.1;
    }else if(keyCode == DOWN && speed > 1){
      speed -= 0.1;
    }
  }else{
    clicked = false;
  }
}

void compute(){
  boolean [][] newCells = new boolean[int(size.x)][int(size.y)];
  for(int x = 0; x < size.x; x ++){
    for(int y = 0; y < size.y; y ++){
      int nei = countN(x, y);
      if(nei == 3){
        newCells[x][y] = true;
      }else if(nei == 4 && cells[x][y]){
        newCells[x][y] = true;
      }else{
        newCells[x][y] = false;
      }
    }
  }
  cells = newCells;
}

int countN(int xpos, int ypos){
  int counter = 0;
  for(int x = -1; x <= 1; x ++){
    for(int y = -1; y <= 1; y++){
      if(xpos+x >= 0 && xpos+x < size.x && ypos+y >= 0 && ypos+y < size.y){
        if(cells[xpos + x][ypos + y]){
          counter ++;
        }
      }
    }
  }
  return counter;
}

void randomise(){
  for(int x = 0; x < size.x; x++){
    for(int y = 0; y < size.y; y ++){
      cells[x][y] = boolean(int(random(2)));
    }
  }
}

void checkMouse(){
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
  MM.y = height;
  
  size.x = int(MM.x/zoom);
  size.y = int(MM.y/zoom);
  
  cells= new boolean[int(size.x)][int(size.y)];
  
}

void display(){
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