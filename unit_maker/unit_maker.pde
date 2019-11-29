  
JSONObject json;


void setup() {

  json = new JSONObject();
  json.setString("name", "teethy");
  json.setString("ability", null);
  json.setString("spaw_effect", "sharp_teeth");
  json.setInt("rarity", 1);
  json.setInt("healt", 10);
  json.setInt("damge", 2);
  json.setInt("max_mana", 10);
  json.setInt("att_cost", 1);
  saveJSONObject(json, "data/new.json");
}
