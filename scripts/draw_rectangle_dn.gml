/// draw_rectangle_dn(x, y, x2, y2, day, night, outline?);

if (World.day_era==Daytimes.night){
    draw_rectangle_colour(argument0, argument1, argument2, argument3, argument5, argument5, argument5, argument5, argument6);
} else {
    draw_rectangle_colour(argument0, argument1, argument2, argument3, argument4, argument4, argument4, argument4, argument6);
}
