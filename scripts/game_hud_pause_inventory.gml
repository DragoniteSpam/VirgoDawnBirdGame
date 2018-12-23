/// void game_hud_pause_inventory();

pause_update_flavor_text();

var categories=pause_hud_item_populate_category_list();
if (pause_major_n==ds_list_size(categories)){
    var display=ds_list_create();
} else {
    var display=pause_hud_item_populate_display_list(categories[| pause_major_n]);
}

switch (pause_major_state){
    case Pause.inventory_main:
        game_hud_inventory_categories(categories);
        game_hud_inventory_categories_control(categories);
        break;
    case Pause.inventory_display:
        game_hud_inventory_categories(categories);
        game_hud_inventory_display(categories, display, pause_minor_n);
        game_hud_inventory_display_control(categories, display);
//        game_hud_inventory_information(categories, display, pause_minor_n);
        break;
    case Pause.inventory_menu:
//        game_hud_inventory_information(categories, display, pause_item_reserve);
//        game_hud_inventory_display(categories, display, pause_item_reserve);
//        game_hud_inventory_menu(categories, display);
        // This has to go last because I suck at programming
//        game_hud_inventory_menu_control(categories, display);
        break;
    case Pause.inventory_use:
        break;
    case Pause.inventory_focus:
        game_hud_inventory_focus(categories, display, pause_minor_n);
        break;
}

//////////////////////////////////////////
///////////// Flavor Text ////////////////
//////////////////////////////////////////

var xx=W*3/4+8;
var xend=W-8;

//draw_rectangle_texture_auto(xx, 32, xend, H*3/8, true);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text_ext(xx+32, H*3/16, pause_get_flavor_text(), -1, W/4-128);

draw_cursor_auto();
display_cursor=false;

ds_list_destroy(categories);
ds_list_destroy(display);
