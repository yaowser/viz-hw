// a listener object function that receives twitter data continuously
StatusListener listener = new StatusListener() {
  void onStatus(Status status) {
    if (status.getText().indexOf(keywords[0])!= -1)
    {
      count1++;
      //use img1[count1] <<<<<<<<<<<<<<<<<<<<<----------------------mooyoung
      img1 = loadImage(status.getUser().getMiniProfileImageURL());
      which1 = 50;
      if(status.getText().indexOf(keywords[0])!= -1) {
        out1 = keywords[0] + " : " + status.getText();
        println("------\n", out1);
      }
    }
    if (status.getText().indexOf(keywords[1])!= -1)
    {
      count2++;
      //use img2[count2] <<<<<<<<<<<<<<<<<<<<<----------------------mooyoung
      img2 = loadImage(status.getUser().getMiniProfileImageURL());
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