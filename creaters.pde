int w = 100;
int h = 150;
class card {
boolean selected = false;
final String  name;  
int health;  
int damage;
int cost;
int maxma;
final int rarity; //common
abily abilities[]  = new abily[1];
effect current_effects[] = new effect[1];
//effect spawn_effect[] = new effect[1];
PImage skin;

card( String x) {
JSONObject stats = loadJSONObject(x);
 name = stats.getString("name");
 health = stats.getInt("health"); 
 damage = stats.getInt("damge");
 cost   = stats.getInt("att_cost");
 maxma  = stats.getInt("max_mana");
 rarity = stats.getInt("rarity");
 abilities[0] = new abily(cost,100,damage);
 current_effects[0]  = new effect(stats.getString("spaw_effect"));
 skin = loadImage("data/"+name+".jpg");
 skin.resize(w,h);
}
void show(float x, float y) {
rectMode(CENTER);
fill(255);
if(selected) {
stroke(255,0,0);
}else {
stroke(0);  
  
}
rect(x+w/2,y+h/2,200,250);
  image(skin,x,y);
  textSize(25);
  fill(0);
  
text(health,x+w/2-200/2,y+h/2-200/2);  
text(damage,x+w/2+200/2-textWidth(str(damage)),y+h/2-200/2);   
  
}
}
