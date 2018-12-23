/// void game_hud_inventory_information(categories, display, index);

// @todo account for a scroll bar
if (argument2<ds_list_size(argument1)){
    var categories=argument0;
    var stack=argument1[| argument2];
    var base_item=ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index];
    var xx=W*3/4+8;
    var yy=H*3/8;

    draw_rectangle_texture_auto(xx, yy+32, W-8, yy+H*5/8-32, true);
    
    draw_set_halign(fa_center);
    draw_set_font(Font16);
    draw_text(W*7/8, yy+64, base_item.name);
    draw_set_font(Font12);
    draw_text(W*7/8, yy+96, item_pocket[base_item.pocket].name+' '+get_text(Text.invPocket));
    draw_text(W*7/8, yy+112, get_text(Text.invYouHave)+' '+string(stack.quantity)+'.');
    draw_sprite_ext(spr_item, base_item.image_index, W*7/8-32, yy+128, 2, 2, 0, c_white, 1);
    draw_rectangle(W*7/8-32, yy+128, W*7/8+32, yy+192, true);
    draw_text_ext(W*7/8, yy+208+((H*5/8-32)-192)/2, base_item.summary, -1, W/4-64);
}
