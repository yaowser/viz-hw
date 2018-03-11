void panel3(int MediumHouseholdIncome, int Population, float PopulationChange, float JobGrowth, float Bachelor, float AvgIQ, float Poverty, float ViolentCrime, float PropertyCrime, int HappinessRank, int SenseOfPurpose, int SocialHealth, int FinancialHealth, int Community, int PhysicalHealth, float PrecipitationDays, float MeanJulyTemp, float MeanJanTemp, int ConfortIndex, float AirQuality, int WaterQuality){
  fill(255);
  stroke(2);
  rect(420,553,1180,368);
  fill(0);
  text("Median Income:\nPopulation:\nPopulation Change:\nJob Growth:\nBachelor's+:\nMean IQ:\nPoverty Rate:\nViolent Crime:\nProperty Crime:",422,555);
  fill(0,139,139);
  text("$"+MediumHouseholdIncome+"\n"+Population+"\n"+round(PopulationChange*100)+"%\n"+round(JobGrowth*100)+"%\n"+round(Bachelor*100)+"%\n"+round(AvgIQ)+"\n"+round(Poverty*100)+"%\n"+round(ViolentCrime)+"/1000\n"+round(PropertyCrime)+"/1000",655,555);
  fill(0);
  text("Happiness Rank:\nSense Of Purpose:\nSocial Health:\nFinancial Health:\nCommunity:\nPhysical Health:\nPrecipitation Days:\nMean July Temp:\nMean Jan Temp:",780,555);
  fill(0,139,139);
  text(HappinessRank+" (1=Best)\n"+SenseOfPurpose+"/100\n"+SocialHealth+"/100\n"+FinancialHealth+"/100\n"+Community+"/100\n"+PhysicalHealth+"/100\n"+round(PrecipitationDays)+"/365\n"+round(MeanJulyTemp)+"°F\n"+round(MeanJanTemp)+"°F",1010,555);
  fill(0);
  text("Confort Index:\nAir Quality:\nWater Quality:\n\nAnimation Here",1170,555);
  fill(0,139,139);
  text(ConfortIndex+"/100\n"+round(AirQuality)+"/100\n"+WaterQuality+"/100",1350,555);
}