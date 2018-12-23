var weapon=ds_map_find_value(all_mod_packages, Player.equip_shield_package).my_items[Player.equip_weapon];
if (weapon.consume_on_use){
    draw_set_valign(fa_middle);
    draw_rectangle_texture_auto(W-208, 24, W-8, 104, true);
    var stack=HasItem(Player.equip_weapon_package, Player.equip_weapon);
    draw_sprite_ext(spr_item, weapon.image_index, W-192, 32, 2, 2, 0, c_white, ternary(stack!=noone, 1, 0.65));
    if (stack==noone){
        var str="0";
    } else {
        var str=string(stack.quantity);
    }
    draw_text(W-128, 64, "x "+str);
} else if (Player.equip_weapon>0){
    draw_rectangle_texture_auto(W-136, 24, W-56, 104, true);
    draw_sprite_ext(spr_item, weapon.image_index, W-128, 32, 2, 2, 0, c_white, 1);
}
if (Player.equip_shield>0){
    var shield=ds_map_find_value(all_mod_packages, Player.equip_shield_package).my_items[Player.equip_shield];
    draw_rectangle_texture_auto(W-136, 120, W-56, 200, true);
    draw_sprite_ext(spr_item, shield.image_index, W-128, 128, 2, 2, 0, c_white, 1);
}
