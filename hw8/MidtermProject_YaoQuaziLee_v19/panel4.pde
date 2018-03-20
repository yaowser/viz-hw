void panel4(float StandardOfLivingIndex, float IncomeAdjusted, float GroceryIndex, float HousingIndex, float UtilitiesIndex, float TransportationIndex, float HealthCareIndex, float GoodServicesIndex, int MediumHousing, int MediumMonthlyMortgage, int MediumMonthlyRent, float MeanGasPrice, float MeanDailyCommute, float CommuteAdjusted, float AfterMortgage) {
  // Living Standard index:  Right-upper matrix

  fill(255);
  stroke(2);
  rect(1150, 0, 450, 553);
  fill(0);
  textSize(24);
  text("Standard Of Living:\nGrocery Index (13%):\nHousing Index (29%):\nUtilities Index (10%):\nTransportation Index (12%):\nHealthcare Index (4%):\nGood/Services Index (32%):\nIncome Index Adjusted:\nMedian House Price:\nMedian Monthly Mortgage:\nMedian Monthly Rent:\nMean Gas Price:\nMean Daily Commute (min):\nIncome Commute Adjusted:\nIncome After Mortgage", 1152, 2);
  fill(0, 191, 255);
  text(round(StandardOfLivingIndex)+"\n"+round(GroceryIndex)+"\n"+round(HousingIndex)+"\n"+round(UtilitiesIndex)+"\n"+round(TransportationIndex)+"\n"+round(HealthCareIndex)+"\n"+round(GoodServicesIndex), 1485, 2);

  fill(138, 43, 226);
  text("$"+round(IncomeAdjusted)+"\n\n\n\n\n\n$"+round(CommuteAdjusted), 1485, 262);
  fill(47, 79, 79);
  text("$"+MediumHousing+"\n$"+MediumMonthlyMortgage+"\n$"+round(MediumMonthlyRent), 1485, 300);
  fill(139, 69, 19);
  text("$"+MeanGasPrice+"\n"+MeanDailyCommute, 1485, 412);
  fill(218, 165, 32);
  text("$"+round(AfterMortgage), 1485, 523);
}