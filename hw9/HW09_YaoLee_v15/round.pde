class round
{
  float number;
  float block;
  float ray;
  float spider;
  float boss;
  
  round(TableRow row)
  {
    number = row.getFloat("round");
    block = row.getFloat("basic");
    ray = row.getFloat("heavy");
    spider = row.getFloat("fast");
    boss = row.getFloat("boss");
  }
  
  String toString()
  {
    return "Block : " + (int)block  + "\n" +
           "Ray   : " + (int)ray  + "\n" +
           "Spider:  " + (int)spider   + "\n" +
           "Boss  :  " + (int)boss   + "\n";
  }  
}
