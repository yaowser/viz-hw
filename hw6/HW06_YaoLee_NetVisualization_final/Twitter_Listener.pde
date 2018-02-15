// a listener object function that receives twitter data continuously
//reference: https://www.programcreek.com/java-api-examples/?class=twitter4j.conf.ConfigurationBuilder&method=setDebugEnabled

StatusListener listener = new StatusListener() {
  void onStatus(Status status) {
    if (status.getText().indexOf(keywords[0])!= -1)
    {
      count1++;
      img1 = loadImage(status.getUser().getMiniProfileImageURL());
      img1x = loadImage(status.getUser().getMiniProfileImageURL());
      img1x.resize(50, 50);
      which1 = 50;
      if(status.getText().indexOf(keywords[0])!= -1) {
        out1 = keywords[0] + " : " + status.getText();
        println("------\n", out1);
      }
    }
    if (status.getText().indexOf(keywords[1])!= -1)
    {
      count2++;
      img2 = loadImage(status.getUser().getMiniProfileImageURL());
      img2x = loadImage(status.getUser().getMiniProfileImageURL());
      img2x.resize(50, 50);
      which2 = 850;
      if(status.getText().indexOf(keywords[1])!= -1) {
        out2 = keywords[1] + " : " + status.getText();
        println("------\n", out2);
      }
    }
  }
  void onStallWarning(StallWarning stallwarning){}
  void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
  void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
  void onScrubGeo(long userId, long upToStatusId) 
  {
    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }
  void onException(Exception ex) {
    ex.printStackTrace();
  }
};