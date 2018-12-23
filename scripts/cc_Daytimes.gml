// Morning, afternoon, etc
enum Daytimes {
    allday,
    night,
    morning,
    afternoon,
    evening
}

day_time_name[Daytimes.allday]=get_text(Text.dtAllDay);
day_time_name[Daytimes.night]=get_text(Text.dtNight);
day_time_name[Daytimes.morning]=get_text(Text.dtMorning);
day_time_name[Daytimes.afternoon]=get_text(Text.dtAfternoon);
day_time_name[Daytimes.evening]=get_text(Text.dtEvening);

day_time_pitch[Daytimes.allday]=            1;
day_time_pitch[Daytimes.night]=             0.8;
day_time_pitch[Daytimes.morning]=           0.95;
day_time_pitch[Daytimes.afternoon]=         1;
day_time_pitch[Daytimes.evening]=           0.95;

day_time_brightness[Daytimes.allday]=       0;
day_time_brightness[Daytimes.night]=        -0.25;
day_time_brightness[Daytimes.morning]=      0;
day_time_brightness[Daytimes.afternoon]=    0;
day_time_brightness[Daytimes.evening]=      -0.1;

day_time_fog[Daytimes.allday]=       1;
day_time_fog[Daytimes.night]=        0.5;
day_time_fog[Daytimes.morning]=      0.75;
day_time_fog[Daytimes.afternoon]=    1;
day_time_fog[Daytimes.evening]=      0.75;
