void panel2(float SalesRate, float Salary, int FederalTax, int FICA, int StateTax, int LocalTax, int SalesTax, int FuelTax, int PropertyTax, float IncomeToTax, int IncomeKept){
  stroke(2);
  fill(255);
  rect(0,367,420,532);
  fill(0);
  textSize(24);
  text("Federal Tax:\nFICA:\nState Tax:\nLocal Tax:\nSales Tax ($"+SalesRate+"):\nFuel Tax:\nProperty Tax:\nIncome To Tax:\nIncome After Tax:\n\nInsert some animation here",2,369);
  fill(232,0,0);
  text("$"+FederalTax+"\n$"+FICA+"\n$"+StateTax+"\n$"+LocalTax+"\n$"+SalesTax+"\n$"+FuelTax+"\n$"+PropertyTax,280,369);
  
  fill(255, 127, 0);
  text(round(IncomeToTax/Salary*100)+"%",280,627);
  fill(0,202,0);
  text("$"+IncomeKept,280,667);
  //some animation like pie chart, etc
  
}