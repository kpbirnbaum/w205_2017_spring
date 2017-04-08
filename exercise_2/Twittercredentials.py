import tweepy

consumer_key = "JykTVPbb3DbT6j8F9Jh8t0tDx";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "CbxbQCMdlICsKiUqoy9HGKm4j1aDUqCLK6w4zAeHA8jYPJZtiF";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "1911921360-t2vRB9jIDBkMSfW0XccNMFQhboaugIu3XaZwwBL";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "aYr7hkfvBakJivw646Zons39zBuzZsfhnxbqK0pKsgTtx";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



