class Map {

  // Field

  PImage imgUS, jobIcon, jobIcon2;
  float mapX = 420;    // map draw starting point
  float mapW = 730;    // map window width
  float mapH = 553;    // map window height
  float mouseProxy = 25;   // mouse cursor proximity from a city in pixel radius
  String cityName, stateName;
  int cityNum;


  // City Location on the map
  String[] city={"Los Angeles", "San Diego", "San Francisco", "San Jose", "Denver", 
    "Hartford", "Washington", "Tampa", "Atlanta", "Chicago", 
    "Boston", "St Louis", "Raleigh", "New York", "Cincinnati", 
    "Portland", "Pittsburgh", "Austin", "Dallas", "Seattle"}; 

  String[] state={"CA", "CA", "CA", "CA", "CO", "CT", "DC", "FL", "GA", "IL", "MA", "MO", "NC", "NY", "OH", "OR", "PA", "TX", "TX", "WA"};

  // pixel position from the original image
  float imgPos[][] = {{137, 730}, 
    {183, 824}, 
    {46, 532}, 
    {49, 561}, 
    {701, 565}, 
    {1859, 368}, 
    {1758, 528}, 
    {1613, 1092}, 
    {1512, 843}, 
    {1324, 441}, 
    {1908, 312}, 
    {1242, 610}, 
    {1715, 690}, 
    {1831, 420}, 
    {1452, 562}, 
    {114, 160}, 
    {1610, 471}, 
    {958, 1033}, 
    {994, 899}, 
    {176, 63}
  };





  // Constructor

  Map() {
    jobIcon = loadImage("job1.png");
    jobIcon2 = loadImage("job2.png");
    imgUS = loadImage("usMap3.jpg");

    float scaleX = mapW/imgUS.width;
    float scaleY = mapH/imgUS.height;
    for (int i = 0; i < city.length; i++) {
      // scale city location for the resized map
      imgPos[i][0] = int(imgPos[i][0]*scaleX +mapX);
      imgPos[i][1] = int(imgPos[i][1]*scaleY);
    }
    imgUS.resize(int(mapW), int(mapH));
  }




  // Methods

  void setupMap() {
    // print US map
    image(imgUS, mapX, 0);

    // place cities with data science job
    for (int j = 0; j < city.length; j++) {
      //image(jobIcon, imgPos[j][0]-jobIcon.width/2, imgPos[j][1]-jobIcon.height);
      image(jobIcon, imgPos[j][0]-jobIcon.width*3/7, imgPos[j][1]-jobIcon.height*3/7);
    }

    // update imgUS w/ icons
    //imgUS.loadPixels();
    //for(int i = 0; i < imgUS.pixels.length; i++) {
    //  imgUS.pixels[i] = 
    //}
  }

  void citySelected() {


    // distance between city and current mouse cursor
    for (int j = 0; j < city.length; j++) {
      float mDist = dist(mouseX, mouseY, imgPos[j][0], imgPos[j][1]);
      if (mDist < mouseProxy) {
        image(jobIcon2, imgPos[j][0]-jobIcon.width*3/7, imgPos[j][1]-jobIcon.height*3/7);
        if (mouseButton == LEFT) {
          cityName = city[j];
          stateName = state[j];
          cityNum = j;
          break;
        }
      } else {
        //image(imgUS, mapX, 0);
        //image(jobIcon, imgPos[j][0]-jobIcon.width*3/7, imgPos[j][1]-jobIcon.height*3/7);
        setupMap();
      }
    }
  }


  // setters and getters

  // return selected city name
  String getCity() {
    return(cityName);
  }

  // return selected state name
  String getState() {
    return(stateName);
  }

  // return selected city number
  int getCityNum() {
    return(cityNum);
  }
}