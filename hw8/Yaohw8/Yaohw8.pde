//HW8 Yao 


int whichCity; // where City[0] = Los Angeles, etc
String[] City={"Los Angeles","San Diego","San Francisco","San Jose","Denver","Hartford","Washington","Tampa","Atlanta","Chicago","Boston","St Louis","Raleigh","New York","Cincinnati","Portland","Pittsburgh","Austin","Dallas","Seattle"}; 
String[] State={"CA","CA","CA","CA","CO","CT","DC","FL","GA","IL","MA","MO","NC","NY","OH","OR","PA","TX","TX","WA"};
PFont Font;
int i;

//married*year: -2 single 2018, -1 single 2017, 1 married 2017, 2 married 2018
int married = -1; //-1 single, 1 married
int year = 1; //1 2017, 2 2018

void setup() {
  
  textAlign(LEFT, TOP);

  size(1600, 900);
  background(255);
}


void draw() { 
  
  //mooyoung code to get certain city by number


  //filler demo code
  i++;
  if(i%100==0){
     whichCity++;
     println(mouseX, mouseY);
  }
  if(i%25==0){
     married = -married;
  }
  if(i%50==0){
     if(year == 1){
       year = 2;
     } else {
       year = 1;
     }
  }  
  if(whichCity == 20) {
     whichCity=0;
  }
  
    
    
  panel1(City[whichCity],State[whichCity],Listing[whichCity]);
  
  panel2buttons(married,year,color(232,0,0));

  //married*year: -2 single 2018, -1 single 2017, 1 married 2017, 2 married 2018
  if(married*year==-2){
    panel2(SalesTax[whichCity],Salary[whichCity],Single2018FederalTax[whichCity],Single2018FICA[whichCity],Single2018StateTax[whichCity],Single2018LocalTax[whichCity],SingleSalesTax[whichCity],SingleFuelTax[whichCity],SinglePropertyTax[whichCity],Single2018IncomeToTax[whichCity],Single2018IncomeKept[whichCity]);
    panel4(StandardOfLivingIndex[whichCity],Single2018IncomeAdjusted[whichCity],GroceryIndex[whichCity],HousingIndex[whichCity],UtilitiesIndex[whichCity],TransportationIndex[whichCity],HealthCareIndex[whichCity],GoodServicesIndex[whichCity],MediumHousing[whichCity],MediumMonthlyMortgage[whichCity],MediumMonthlyRent[whichCity],MeanGasPrice[whichCity],MeanDailyCommute[whichCity],Single2018CommuteAdjusted[whichCity],Single2018AfterMortgage[whichCity]);  
  }
  if(married*year==-1){
    panel2(SalesTax[whichCity],Salary[whichCity],Single2017FederalTax[whichCity],Single2017FICA[whichCity],Single2017StateTax[whichCity],Single2017LocalTax[whichCity],SingleSalesTax[whichCity],SingleFuelTax[whichCity],SinglePropertyTax[whichCity],Single2017IncomeToTax[whichCity],Single2017IncomeKept[whichCity]);
    panel4(StandardOfLivingIndex[whichCity],Single2017IncomeAdjusted[whichCity],GroceryIndex[whichCity],HousingIndex[whichCity],UtilitiesIndex[whichCity],TransportationIndex[whichCity],HealthCareIndex[whichCity],GoodServicesIndex[whichCity],MediumHousing[whichCity],MediumMonthlyMortgage[whichCity],MediumMonthlyRent[whichCity],MeanGasPrice[whichCity],MeanDailyCommute[whichCity],Single2017CommuteAdjusted[whichCity],Single2017AfterMortgage[whichCity]);  
  }
  if(married*year==1){
    panel2(SalesTax[whichCity],Salary[whichCity],Married2017FederalTax[whichCity],Married2017FICA[whichCity],Married2017StateTax[whichCity],Married2017LocalTax[whichCity],MarriedSalesTax[whichCity],MarriedFuelTax[whichCity],MarriedPropertyTax[whichCity],Married2017IncomeToTax[whichCity],Married2017IncomeKept[whichCity]);
    panel4(StandardOfLivingIndex[whichCity],Married2017IncomeAdjusted[whichCity],GroceryIndex[whichCity],HousingIndex[whichCity],UtilitiesIndex[whichCity],TransportationIndex[whichCity],HealthCareIndex[whichCity],GoodServicesIndex[whichCity],MediumHousing[whichCity],MediumMonthlyMortgage[whichCity],MediumMonthlyRent[whichCity],MeanGasPrice[whichCity],MeanDailyCommute[whichCity],Married2017CommuteAdjusted[whichCity],Married2017AfterMortgage[whichCity]);
  }
  if(married*year==2){
    panel2(SalesTax[whichCity],Salary[whichCity],Married2018FederalTax[whichCity],Married2018FICA[whichCity],Married2018StateTax[whichCity],Married2018LocalTax[whichCity],MarriedSalesTax[whichCity],MarriedFuelTax[whichCity],MarriedPropertyTax[whichCity],Married2018IncomeToTax[whichCity],Married2018IncomeKept[whichCity]);
    panel4(StandardOfLivingIndex[whichCity],Married2018IncomeAdjusted[whichCity],GroceryIndex[whichCity],HousingIndex[whichCity],UtilitiesIndex[whichCity],TransportationIndex[whichCity],HealthCareIndex[whichCity],GoodServicesIndex[whichCity],MediumHousing[whichCity],MediumMonthlyMortgage[whichCity],MediumMonthlyRent[whichCity],MeanGasPrice[whichCity],MeanDailyCommute[whichCity],Married2018CommuteAdjusted[whichCity],Married2018AfterMortgage[whichCity]);
  }
  
  panel3(MediumHouseholdIncome[whichCity],Population[whichCity],PopulationChange[whichCity],JobGrowth[whichCity],Bachelor[whichCity],AvgIQ[whichCity],Poverty[whichCity],ViolentCrime[whichCity],PropertyCrime[whichCity],HappinessRank[whichCity],SenseOfPurpose[whichCity],SocialHealth[whichCity],FinancialHealth[whichCity],Community[whichCity],PhysicalHealth[whichCity],PrecipitationDays[whichCity],MeanJulyTemp[whichCity],MeanJanTemp[whichCity],ConfortIndex[whichCity],AirQuality[whichCity],WaterQuality[whichCity]);

  interactiveMap();

  
}