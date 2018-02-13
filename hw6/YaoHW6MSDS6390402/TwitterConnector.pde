// Initial connection configuration to connect to Twitter Streaming API

static String OAuthConsumerKey = "2PurWOJNLU2k86ts8I677SVay";
static String OAuthConsumerSecret = "TkQIkedqplrgZ9wDQnSH4Wcz5xnpqI1tPrIaUrcTIn3hBUy1eT";
static String AccessToken = "185924395-KEihIOunKr2PXPOChwOi0hiMdqAIrFr6hv6BEq96";
static String AccessTokenSecret = "oZuwq8zxQo9d3FwYw5QA5oEj30o6S2JqamNkhQk04iZuM";

ConfigurationBuilder connect(){
    ConfigurationBuilder cb = new ConfigurationBuilder();
    cb.setDebugEnabled(true);
    cb.setOAuthConsumerKey(OAuthConsumerKey);
    cb.setOAuthConsumerSecret(OAuthConsumerSecret);
    cb.setOAuthAccessToken(AccessToken);
    cb.setOAuthAccessTokenSecret(AccessTokenSecret);
  return cb;
}