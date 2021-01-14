

-- This will check for the last 100 agressive messages. Note: you must have the sentiment script set up and running --
select int_layer_id, var_shouted, flt_sentiment from tbl_ssshout where flt_sentiment < -4 order by int_ssshout_id desc limit 100;


-- To block a particular layer id (in this case the layer 65)
update tbl_layer set var_public_code = md5('yourpassword') where int_layer_id = 65;


-- If you want to unblock the forum again, use
update tbl_layer set var_public_code = NULL where int_layer_id = 65;

