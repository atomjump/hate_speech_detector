# hate_speech_detector
A plugin to the AtomJump Messaging Server for helping to detect hate speech

This is in a basic database query format, at the moment.

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