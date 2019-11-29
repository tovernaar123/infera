PImage back;
PImage char1;
public player up;
public player down;
void setup() {
fullScreen(); 
back = loadImage("data/back.jpg");
//char1 = loadImage("data/tandy.jpg");
//char1.resize(100,150);
back.resize(width,height);
up = new player(true);
down = new player(false);
}


void draw() {
background(back); 
up.show();
down.show();
rectMode(CORNER);
rect(width/2-50/2,height/2-50,100,100);
fill(255);
if(up.turn) {
text("up",width/2-50/2-textWidth("up")/2+50,height/2);  
  
}else {
text("down",width/2-50/2-textWidth("down")/2+50,height/2);    
}

//line(width/2-550,height-200,(2*250)+width/2-550,height-200);
//println(dist(width/2-550,height-200,(2*250)+width/2-550,height-200));
}

boolean on_turn() {
   boolean result;
  if(in_rect(width/2-50/2,height/2-50,100,100)) {
   result = true;
  }else {
  result = false;
  }
return result;
  
}


boolean in_rect(float x, float y, float w , float h) {
boolean result = mouseX > x && mouseX <x+w && mouseY > y && mouseY < y+h;
return result;  
}
