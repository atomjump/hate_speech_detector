# hate_speech_detector
A plugin to the AtomJump Messaging Server for helping to detect hate speech

It needs some basic command-line technical skills, still, and is particularly useful for blocking whole forums.

1. Get a list of the 100 (very) negative recent comments, and the forum numbers of them
2. Use the forum number from 1. and get a list of all the comments on that forum.
3. If it is clearly being misused, change the password to that forum, so that nobody can access it
4. (Optionally) remove the password to that forum to let people back on

We will likely build a more extensive interface and flexible system in the future.

You must be able to access the raw MySQL database file and be familiar with writing SQL queries.

Typical steps would be:

```
linux command line> mysql -u root -p
[enter database password]
use atomjump;			[or your database name]
select int_layer_id, date_when_shouted, flt_sentiment, var_shouted from tbl_ssshout where flt_sentiment < -4 order by int_ssshout_id desc limit 100\G
```

And then further queries are available in the file queries.sql.