class player { 
  card cards[] = new card[5];  
  boolean up = true;
  boolean turn;
  int elixer = 4;
  player(boolean x) {
    up   = x;
    turn = x;
    for (int i =0; i < cards.length; i++) {
      cards[i]  = new card("data/teethy.json");
    }
    
  }
  
  void show() {
  for (int i =0; i < cards.length; i++) {
    if(cards[i] != null) {
      if(up) {
        cards[i].show((i*250)+width/2-550,50);   
      }else {
       cards[i].show((i*250)+width/2-550,height-200);
      }
    }
  }
  if(up) {
  text(elixer,250,100); 
    
  }else {
  text(elixer,250,height-200+75);  
  }
}
void turn() {
  elixer +=1;
 
}
void update() {
for (int i =0; i < cards.length; i++) {
  if(cards[i] != null) {
   if( cards[i].killed()) {
      cards[i]  = null;
    }
    }   
}
}
}


void mousePressed() {

 if(on_turn()) {   
 if(up.turn) {
 down.turn();
 up.turn = false;
 down.turn = true;
 }else  if( down.turn) {
 up.turn();
 up.turn = true;
 down.turn = false; 
 }
 }else {
boolean selec = false;
int seleci = 0;
int seleci2 = 0;
 for (int i =0; i < down.cards.length; i++) { 
     if(down.cards[i] != null) {
   if(down.cards[i].selected) {
    selec = true; 
    seleci = i; 
  
   down.cards[i].selected = false; 
   break;
   }
     }
 }
 for (int i =0; i < up.cards.length; i++) {
    if(up.cards[i] != null) {
    if(up.cards[i].selected) {
    selec = true; 
    seleci = i+5; 
   
   up.cards[i].selected = false; 
   break;
    }
    }
 }
  
  
  if(selec || down.turn) {
 for (int i =0; i < down.cards.length; i++) { 
    if(down.cards[i] != null) {
   if(mouseX+50 > (i*250) + width/2-550 && mouseX-150  < ((i*250)+width/2-550) && mouseY > height-200-250/2) {
    down.cards[i].selected = true;
    seleci2 = i;
    break;
   }
    }
 }
  }
  if(selec || up.turn) {
 for (int i =0; i < up.cards.length; i++) {
  if(up.cards[i] != null) {
  if(mouseX+50 > (i*250) + width/2-550 && mouseX-150  < ((i*250)+width/2-550) && mouseY < 150/2+50+250/2) {
     up.cards[i].selected = true;
     seleci2 = i+5;
     break;
  }
   }
 }
  }
 if(seleci >= 5  && seleci2  <= 5 || seleci <= 5  && seleci2 >= 5 ) {
 if(selec) {
    selec = false;
 if(seleci >= 5) {
  down.cards[seleci2].health -= up.cards[seleci-5].damage; 
  down.cards[seleci2].selected = false;
  down.update();
 }else {
  up.cards[seleci2-5].health -= down.cards[seleci].damage; 
  up.cards[seleci2-5].selected = false;
  up.update();
 }
 
 }
 }
 }
}
