PVector[] p = new PVector[4];
float t;
int curr;

void mousePressed() {
  reset();
}

void reset() {
  for (int i = 0; i < p.length; i++) {
    p[i].x = random(width*.6);
    p[i].y = random(height/2);
  }
  t = 0.0;
  curr = 0;
    //  p[i].x = {400, 732, 1818, 1049, 994, 1488, 1629, 1843, 40, 1712, 146, 114, 1900, 171, 1477};
  //  p[i].y = {818, 547, 414, 1064, 903, 819, 728, 431, 551, 110, 537, 751, 311, 307, 75, 399};
  //  float airportLoc[][] = {{1311, 408}, 
  //  {400, 818}, 
  //  {732, 547}, 
  //  {1818, 414}, 
  //  {1049, 1064}, 
  //  {994, 903}, 
  //  {1488, 819}, 
  //  {1629, 728}, 
  //  {1843, 421}, 
  //  {40, 551}, 
  //  {1722, 1100}, // miami
  //  {1712, 537}, 
  //  {146, 751}, 
  //  {1114, 311}, 
  //  {1900, 307}, 
  //  {171, 75}, 
  //  {1477, 399}
  //}; 
}