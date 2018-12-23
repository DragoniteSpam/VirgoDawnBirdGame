mouse_over_menu=true;
display_cursor=false;
var go_back=get_release_b();
var commit=get_release_y();
var scale=4;
var xx=WW/2-sprite_get_width(sprite_index)/2*scale;
var yy=HH/2-sprite_get_height(sprite_index)/2*scale;
draw_set_halign(fa_center);
draw_set_color(c_black);

draw_set_alpha(0.5);
draw_rectangle(0, 0, W, H, false);
draw_set_alpha(1.0);

d3d_transform_set_scaling(scale, scale, 1);
d3d_transform_add_translation(xx/*/scale*/, yy/*/scale*/, 0);

var t;

switch (sprite_index){
    case spr_chr_clothing:
        t=Player.cc_clothes;
        Player.cc_clothes=index.item_power;
        break;
    case spr_chr_hat:
        t=Player.cc_hat;
        Player.cc_hat=index.item_power;
        break;
    case spr_chr_acc:
        t=Player.cc_acc;
        Player.cc_acc=index.item_power;
        break;
    case spr_chr_hair_a:
        t=Player.cc_hair;
        Player.cc_hair=index.item_power;
        break;
}

draw_character_full(0, 0, Player.gender, Player.cc_body, Player.cc_clothes, Player.cc_hat, Player.cc_hair, Player.cc_acc, Player.cc_color_hair, Player.cc_color_clothes);

switch (sprite_index){
    case spr_chr_clothing:
        Player.cc_clothes=t;
        break;
    case spr_chr_hat:
        Player.cc_hat=t;
        break;
    case spr_chr_acc:
        Player.cc_acc=t;
        break;
    case spr_chr_hair_a:
        Player.cc_hair=t;
        break;
}

d3d_transform_set_identity();

draw_input(Controller.gp_bind_y, Controller.mk_bind_y, W-120, H-64, "Commit");
draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-160, "Back");

if (commit){
    switch (sprite_index){
        case spr_chr_clothing:
            Player.cc_clothes=index.item_power;
            break;
        case spr_chr_hat:
            Player.cc_hat=index.item_power;
            break;
        case spr_chr_acc:
            Player.cc_acc=index.item_power;
            break;
        case spr_chr_hair_a:
            Player.cc_hair=index.item_power;
            break;
    }
}

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}
