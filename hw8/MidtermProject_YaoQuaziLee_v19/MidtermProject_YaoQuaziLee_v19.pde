

// install 'gicentre' library through the Contribution Manager <'Tools/Add Tools.../Libraries'>
import org.gicentre.utils.stat.*;    // For chart classes.



// Object initializing

DSJob dsJob;
Map map;
XYChart lineChart;
BarChart barChart;


// Setup for interactive panel

void setup() {

  textAlign(LEFT, TOP);

  size(1600, 900);
  background(255);

  map = new Map();
  map.setupMap();

  dsJob = new DSJob();

  // lineChart
  //textFont(createFont("Arial", 10), 10);
  lineChart = new XYChart(this);
  // Axis formatting and labels.
  lineChart.showXAxis(true); 
  lineChart.showYAxis(true); 
  lineChart.setMinY(0);
  lineChart.setMaxY(3);
  lineChart.setYFormat("###%");  // Y-tic format
  lineChart.setXFormat("0");      // X-tic format
  // Symbol colours
  lineChart.setPointColour(color(180, 50, 50, 100));
  lineChart.setPointSize(12);
  lineChart.setLineWidth(2);


  // barChart
  barChart = new BarChart(this);
  // Scaling
  barChart.setMinValue(0);
  barChart.setMaxValue(150000);
  // Axis appearance
  //textFont(createFont("Serif", 10), 10);
  barChart.showValueAxis(true);
  barChart.setValueFormat("0");
  barChart.showCategoryAxis(true);
  barChart.setBarColour(150);
}




// play interactive panel

void draw() {

  map.citySelected();

  // get city name
  String city = map.getCity();
  println(city);

  // get state name
  String state = map.getState();
  println(state);

  // get city number
  int cityNum = map.getCityNum();
  //println(cityNum);

  // panel1: Initial Salary Distribution
  if ( city != null) {
    textSize(8);
    noStroke();
    strokeWeight(1);
    dsJob.panel1(city, state, cityNum);
    dsJob.salaryAdjustPanel();
    dsJob.panel3_Quality();
    //dsJob.panel4_LivingSTD();
    dsJob.animation(cityNum);
  } else {
    //button_wordCloud.drawButton(color(224, 224, 224));
  }


  // lineChart
  fill(255, 60);  // remove the previous line slowly !
  noStroke();
  rect(1150, 0, 500, 555);
  // Both x and y data set here. 
  lineChart.setData(new float[] {1, 2, 3, 4, 5, 6}, 
    new float[] {GroceryIndex[cityNum]/100, HousingIndex[cityNum]/100, UtilitiesIndex[cityNum]/100, TransportationIndex[cityNum]/100, HealthCareIndex[cityNum]/100, GoodServicesIndex[cityNum]/100});

  textSize(14);
  lineChart.draw(1140, 40, 445, 250);

  // Draw a title over the top of the chart.
  fill(50);
  textSize(20);
  text("Standard of Living Score : "+StandardOfLivingIndex[cityNum], 1220, 5);
  textSize(14);
  text("Weighted average of below 6 categories", 
    1220, 35);
    fill(150);
  text("Grocery  Housing      Utility     Transport    Health    Service", 1190, 275);
 
  // barChart
  float[] barData = dsJob.incomeAdj(cityNum);
  barChart.setData(barData);
  barChart.setBarLabels(new String[] {"Salary", "Tax", "STD.LIV.", "Commute", "Mortgage"});
  textSize(20);
  fill(0);
  text("Income Adjustment", 1280, 300);
  textSize(14);
  barChart.draw(1125, 300, 485, 250);
}