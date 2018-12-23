/// draw_hud_pause_cooking_box(x1, y1, x2, y2, package, item);

draw_rectangle_texture_auto(argument0, argument1, argument2, argument3, true);

var xcenter=(argument0+argument2)/2;
var ycenter=(argument1+argument3)/2;
var width=(argument2-argument0)-64;
var base_item=ds_map_find_value(all_mod_packages, argument4).my_items[argument5];

draw_sprite(spr_item, base_item.image_index, argument0+32, argument1+32);

draw_text_ext(argument0+96, argument1+32, base_item.name, -1, width);

draw_set_font(Font12);
draw_text_ext(argument0+32, ycenter, base_item.summary, -1, width);
draw_set_font(Font16);
