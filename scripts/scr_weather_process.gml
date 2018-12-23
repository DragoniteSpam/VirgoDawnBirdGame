lm.fog_start-=weather.fog_start;
lm.fog_start*=0.95;
lm.fog_start+=weather.fog_start;

lm.fog_end-=weather.fog_end;
lm.fog_end*=0.95;
lm.fog_end+=weather.fog_end;

lm.sun_scale-=weather.sun_scale;
lm.sun_scale*=0.99;
lm.sun_scale+=weather.sun_scale;

lm.intensity-=weather.intensity;
lm.intensity*=0.99;
lm.intensity+=weather.intensity;

lm.direction=lerp(lm.direction, weather.direction, 0.5);
