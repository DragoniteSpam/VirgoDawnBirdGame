/// void game_hud_inventory_categories(categories list);

var s=ds_list_size(argument0);
draw_rectangle_texture_auto(32, 32, W/4, 104+20*s, true);

draw_set_color(graphics_text_color);
draw_text(80, 64, get_text(Text.menuInventory))
for (var i=0; i<ds_list_size(argument0); i++){
    draw_background(item_pocket[argument0[| i]].icon, 74, 78+20*i);
    draw_text(100, 84+20*i, item_pocket[argument0[| i]].name);
}
draw_text(80, 84+20*s, get_text(Text.invBack));

draw_rectangle(72, 74+20*pause_major_n, W/4-8, 96+20*pause_major_n, true);
