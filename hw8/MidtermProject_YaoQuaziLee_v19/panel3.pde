void panel3(int MediumHouseholdIncome, int Population, float PopulationChange, float JobGrowth, float Bachelor, float AvgIQ, float Poverty, float ViolentCrime, float PropertyCrime, int HappinessRank, int SenseOfPurpose, int SocialHealth, int FinancialHealth, int Community, int PhysicalHealth, float PrecipitationDays, float MeanJulyTemp, float MeanJanTemp, int ConfortIndex, float AirQuality, int WaterQuality) {
  // Quailty of life index: Bottom Center matrix

  fill(255);
  stroke(2);
  rect(420, 553, 1180, 368);

  textSize(21);
  fill(0);
  textAlign(LEFT, TOP);
  text("Median Income:\nPopulation:\nPopulation Change:\nJob Growth:\nBachelor's+:\nMean IQ:\nPoverty Rate:\nViolent Crime:\nProperty Crime:\nHappiness Rank:\nSense Of Purpose:", 430, 555);
  fill(0, 139, 139);
  text("$"+MediumHouseholdIncome+"\n"+Population+"\n"+round(PopulationChange*100)+"%\n"+round(JobGrowth*100)+"%\n"+round(Bachelor*100)+"%\n"+round(AvgIQ)+"\n"+round(Poverty*100)+"%\n"+round(ViolentCrime)+"/1000\n"+round(PropertyCrime)+"/1000\n"+HappinessRank+" (1=Best)\n"+SenseOfPurpose+"/100", 660, 555);

  fill(0);
  text("Financial Health:\nSocial Health:\nCommunity:\nPhysical Health:\nPrecipitation Days:\nMean July Temp:\nMean Jan Temp:\nComfort Index:\nAir Quality:\nWater Quality:", 820, 555);
  fill(0, 139, 139);
  text(FinancialHealth+"\n"+SocialHealth+"\n"+Community+"\n"+PhysicalHealth+"\n"+round(PrecipitationDays)+"/365\n"+round(MeanJulyTemp)+"°F\n"+round(MeanJanTemp)+"°F\n"+ConfortIndex+"/100\n"+round(AirQuality)+"/100\n"+WaterQuality+"/100", 1020, 555);

  // fill(0);
  // text("Confort Index:\nAir Quality:\nWater Quality:\n\nAnimation Here", 1170, 555);
  // fill(0, 139, 139);
  // text(ConfortIndex+"/100\n"+round(AirQuality)+"/100\n"+WaterQuality+"/100", 1350, 555);
}