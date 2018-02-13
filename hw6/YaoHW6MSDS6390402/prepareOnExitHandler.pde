// exit handler to cleanly close twitter connection and not get us in trouble
protected void prepareOnExitHandler() {

 Runtime.getRuntime().addShutdownHook(new Thread(new Runnable() {
   
   public void run () {
     System.out.println("SHUTDOWN HOOK");
     twitter.clearListeners();
     twitter.cleanUp();
     twitter.shutdown();
     img1 = null;
     img2 = null;
   }
 }
 ));
}