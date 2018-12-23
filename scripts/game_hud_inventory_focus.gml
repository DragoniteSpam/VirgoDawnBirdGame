if (argument2<ds_list_size(argument1)){
    var categories=argument0;
    var stack=argument1[| argument2];
    var base_item=ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index];
    var xx=W/2;
    var yy=H/2;
    
    draw_rectangle_texture_auto(W/4, H/4, W*3/4, H*3/4, true);

    draw_set_color(c_black);    
    draw_set_halign(fa_center);
    draw_set_font(Font16);
    draw_text(W/2, H*3/8, base_item.name);
    draw_set_font(Font12);
    draw_text(W/2, H*3/8+32, item_pocket[base_item.pocket].name+' '+get_text(Text.invPocket));
    draw_text(W/2, H*3/8+48, get_text(Text.invYouHave)+' '+string(stack.quantity)+'.');
    draw_sprite_ext(spr_item, base_item.image_index, xx-sprite_get_width(spr_item), yy-sprite_get_height(spr_item), 2, 2, 0, c_white, 1);
    draw_text_ext(W/2, H*5/8, base_item.summary, -1, W/2-64);
    
    draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-64, "Back");
    
    if (get_release_b()||Controller.release_select||get_release_x()){
        pause_major_state=Pause.inventory_menu;
    }
}
