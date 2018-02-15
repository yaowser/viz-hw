// exit handler to cleanly close twitter connection and not get us in trouble
//reference: https://www.programcreek.com/java-api-examples/?class=twitter4j.conf.ConfigurationBuilder&method=setDebugEnabled

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