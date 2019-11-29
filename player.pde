class player { 
  card cards[] = new card[5];  
  boolean up = true;
  player(boolean x) {
    up = x;
    for (int i =0; i < cards.length; i++) {
      cards[i]  = new card("data/teethy.json");
    }
    
  }
  
  void show() {
  for (int i =0; i < cards.length; i++) {
      if(up) {
        cards[i].show((i*250)+width/2-550,50);   
      }else {
       cards[i].show((i*250)+width/2-550,height-200);
      }
    }
  
}

}


void mousePressed() {
boolean selec = false;
int seleci = 0;
int seleci2 = 0;
 for (int i =0; i < down.cards.length; i++) { 
   if(down.cards[i].selected) {
    selec = true; 
    seleci = i; 
  
   down.cards[i].selected = false; 
   break;
   }
 }
 for (int i =0; i < up.cards.length; i++) {
    if(up.cards[i].selected) {
    selec = true; 
    seleci = i+5; 
   
   up.cards[i].selected = false; 
   break;
    }
 }
  
  
  
 for (int i =0; i < down.cards.length; i++) { 
   if(mouseX+50 > (i*250) + width/2-550 && mouseX-150  < ((i*250)+width/2-550) && mouseY > height-200-250/2) {
    down.cards[i].selected = true;
    seleci2 = i;
    break;
   }
 }
 
 for (int i =0; i < up.cards.length; i++) {
  if(mouseX+50 > (i*250) + width/2-550 && mouseX-150  < ((i*250)+width/2-550) && mouseY < 150/2+50+250/2) {
     up.cards[i].selected = true;
     seleci2 = i+5;
     break;
  }
 }
 if(selec && seleci2 != seleci) {
 if(seleci > 5) {
  down.cards[seleci2].health -= up.cards[seleci-5].damage; 
  down.cards[seleci2].selected = false;
 }else {
  up.cards[seleci2-5].health -= down.cards[seleci].damage; 
  down.cards[seleci2-5].selected = false;  
 }
 
 }

}
