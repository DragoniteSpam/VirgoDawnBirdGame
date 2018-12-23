if (World.show_hud){
    draw_set_halign(fa_left);
    draw_set_font(Font16);
    
//    var yy=H-144;
    
//    draw_rectangle_texture_auto(W-356, yy, W-16, yy+112, true);
    
    // HP bar
    var n=get_max_hp(Player.exp_hp);
    var s=32;
    
    for (var i=0; i<floor(n/BASE_HP_FACTOR); i++){
        var xx=W-96-72*i;
        var yy=H-96;

        draw_health_unit(xx, yy, s, Player.hp_current-(i*BASE_HP_FACTOR))
    }
    
    // MP bar

    var n=get_max_mp(Player.exp_mp);
    var s=24;
    
    for (var i=0; i<floor(n/BASE_MP_FACTOR); i++){
        var xx=W-128-72*i;
        var yy=H-40;

        draw_magic_unit(xx, yy, s, Player.mp_current-(i*BASE_MP_FACTOR));
    }
    
    
    // Profile
    
/*    draw_background_part_ext(all_npc_images[get_class(Player.id).image], 32*floor(Player.cc_frame), 0, 32, 32, W-96, yy+16, 2, 2, c_white, 1);
    Player.cc_frame=(Player.cc_frame+ANIMATION_FRAME_STANDING)%3;*/
    
    // Money
/*    var str=' x '+string(GetPlayerMoney());
    draw_background_ext(b_feather_ring, W-144-string_width(str), yy+64-(background_get_height(b_feather_ring)/2)/2, 0.5, 0.5, 0, c_white, 1);
    draw_text_outline_dn(W-112-string_width(str), yy+64, str, c_black, c_white, 1, 1);*/
    
    // Player level

    
    // Statuses
    
    if (Player.timer_invincibility>0){
        draw_background(b_invincibile, W-256, yy+64-background_get_height(b_invincibile));
    }
    
    draw_set_font(Font20);
}
