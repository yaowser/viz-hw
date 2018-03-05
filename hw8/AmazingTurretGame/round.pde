class round
{
  float number;
  float basic;
  float heavy;
  float fast;
  float boss;
  
  round(TableRow row)
  {
    number = row.getFloat("round");
    basic = row.getFloat("basic");
    heavy = row.getFloat("heavy");
    fast = row.getFloat("fast");
    boss = row.getFloat("boss");
  }
  
  String toString()
  {
    return "Basic: " + (int)basic  + "\n" +
           "Heavy: " + (int)heavy  + "\n" +
           "Fast:  " + (int)fast   + "\n" +
           "Boss:  " + (int)boss   + "\n";
  }  
}