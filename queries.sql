-- To use these queries, you must have MySQL database access to your AtomJump Messaging --
-- database (command line or some other method) --

-- FORUM BLOCKING --
-- This will check for the last 100 agressive messages. --
-- Note: you must have the sentiment script installed in the AtomJump Server --
select int_layer_id, date_when_shouted, flt_sentiment, var_shouted from tbl_ssshout where flt_sentiment < -4 order by int_ssshout_id desc limit 100\G


-- You can read the full comments from a particular forum (in this case forum 65) with --
select int_layer_id, date_when_shouted, flt_sentiment, var_shouted from tbl_ssshout where int_layer_id = 65 order by int_ssshout_id desc limit 100\G


-- To block a particular forum, by changing it's password (in this case the forum 65) --
update tbl_layer set var_public_code = md5('yourpassword') where int_layer_id = 65;


-- If you want to unblock the forum again (in this case the forum 65), use --
update tbl_layer set var_public_code = NULL where int_layer_id = 65;






-- MESSAGE BLOCKING --
-- This will check for the last 100 agressive messages. --
-- Note: you must have the sentiment script installed in the AtomJump Server --
select int_ssshout_id, date_when_shouted, flt_sentiment, var_shouted from tbl_ssshout where flt_sentiment < -4 order by int_ssshout_id desc limit 100\G


-- To hide a particular message, by making it inactive (in this case int_ssshout_id of 3432 (the message will stay in the database, but won't be visible to users) --
update tbl_ssshout set enm_active = 'false' where int_ssshout_id = 3432;


