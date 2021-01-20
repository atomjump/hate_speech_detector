# hate_speech_detector
A plugin to the AtomJump Messaging Server for helping to detect hate speech.

It needs some basic command-line technical skills, still, and is particularly useful for blocking whole forums.

1. Get a list of the 100 (very) negative recent comments, and the forum numbers of them
2. Use the forum number from 1. and get a list of all the comments on that forum.
3. If it is clearly being misused, change the password to that forum, so that nobody can access it
4. (Optionally) remove the password to that forum to let people back on

You must be able to access the raw MySQL database file and be familiar with writing SQL queries.

Typical steps would be:

```
linux command line> mysql -u root -p
[enter database password]
use atomjump;			[or your database name]
select int_layer_id, date_when_shouted, flt_sentiment, var_shouted from tbl_ssshout where flt_sentiment < -4 order by int_ssshout_id desc limit 100\G
```

And then further queries are available in the file queries.sql.

Note: the sentiment values are currently set up to detect English hate-speech. 


## Appliance Users

Once you are logged into your AtomJump Appliance (with your own login details), the standard credentials for the database are:

```
sudo /jet/bin/mysql -u atomjump -p
[The 1st time here you will need to enter your 'aj_customer' user's password first, which has a default of 'lander5321', until you changed it during the installation]
Enter password: nemesis1235
use atomjump;
```


## Future development

* We will likely need to build a more extensive interface and provide other approaches to detection, also.
* To make this fully international, we can investigate the multi-lingual version of the sentiment tool that is used in AtomJump Server's node/sentiment.js file. See: https://www.npmjs.com/package/sentiment-multilingual