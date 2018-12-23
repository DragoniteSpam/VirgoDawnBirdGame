/// int timeGMToUnix(datetime);
// This isn't ACTUALLY Unix time, but someone was having trouble with it so I'll use it instead.
// Don't set your computer clock to pre-1990.
return floor(date_second_span(date_create_datetime(1990, 1, 1, 0, 0, 0), argument0));
