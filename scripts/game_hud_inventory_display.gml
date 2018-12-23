/// void game_hud_inventory_display(categories, display, rectangle hover index);

var category=argument0;
var s=ds_list_size(argument1);
var xx=W/4+8;
draw_rectangle_texture_auto(xx, 32, W*3/4-24, 84+20*s, true);

draw_set_font(Font16);

draw_set_color(graphics_text_color);
for (var i=0; i<s; i++){
    var spacing=0;
    var stack=argument1[| i];
    if (Player.equip_weapon==stack.index&&Player.equip_weapon_package==stack.package){
        spacing=24;
        draw_sprite_stretched(spr_equip, 0, xx+68, 58+20*i, 16, 16);
    }
    if (Player.equip_shield==stack.index&&Player.equip_shield_package==stack.package){
        spacing=24;
        draw_sprite_stretched(spr_equip, 1, xx+68, 58+20*i, 16, 16);
    }
    draw_set_halign(fa_right);
    draw_text(W*3/4-32-32, 64+20*i, ' x '+string(stack.quantity));
    draw_set_halign(fa_left);
    var base_item=ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index];
    draw_sprite_stretched(spr_item, base_item.image_index, xx+48, 58+20*i, 16, 16);
    draw_text(xx+84+spacing, 64+20*i, base_item.name);
}
draw_text(xx+48, 64+20*s, get_text(Text.invBack));

draw_rectangle(xx+40, 54+20*argument2, W*3/4-32, 76+20*argument2, true);

draw_set_halign(fa_center);
draw_input(Controller.gp_bind_x, Controller.mk_bind_x, W-120, H-160, "Focus");
draw_input(Controller.gp_bind_a, Controller.mk_bind_a_a, W-120, H-64, "Use");
