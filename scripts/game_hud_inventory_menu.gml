/// void game_hud_inventory_menu(categories, display);

var categories=argument0;
var stack=argument1[| pause_item_reserve];
var base_item=ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index];
var xx=W*3/4+8;

draw_set_font(Font16);
draw_rectangle_texture_auto(xx, 32, W-32, 164, true);
if (item_pocket[base_item.pocket].item_equip_type==ItemEquipTypes.NONE){
    draw_text(xx+48, 64, get_text(Text.invUse));
} else {
    draw_text(xx+48, 64, get_text(Text.invEquip));
}
draw_text(xx+48, 84, get_text(Text.invBack));

draw_rectangle(xx+40, 54+20*pause_minor_n, W*3/4-8, 76+20*pause_minor_n, true);
