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
//line(width/2-550,height-200,(2*250)+width/2-550,height-200);
//println(dist(width/2-550,height-200,(2*250)+width/2-550,height-200));
}
