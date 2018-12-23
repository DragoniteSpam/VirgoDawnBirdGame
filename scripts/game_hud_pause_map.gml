var x_buffer=128;
var y_buffer=160;
var x_width=W-x_buffer;
var y_height=H-y_buffer;

var map_side_length=min(x_width, y_height);
var x_start=(W-map_side_length)/2;
var y_start=(H-map_side_length)/2;
var bx_start=0;
var by_start=0;
var back_width=background_get_width(b_tex_map);
var back_height=background_get_height(b_tex_map);

var back_zoom_min=1;
var back_zoom_max=4;

var world_width=32000;
var world_height=32000;

var go_back=false;
var fast_travel=false;
var cft=get_can_fast_travel();

draw_rectangle_texture_auto(x_start-32, y_start-32, W-x_start+32, H-y_start+32, true);
//draw_background_part_ext(b_tex_map, bx_start, by_start, back_width, back_height, x_start, y_start, map_zoom, map_zoom, c_white, 1);
draw_background_stretched(b_tex_map, x_start, y_start, map_side_length, map_side_length);

for (var i=0; i<=4; i++){
    draw_line(x_start, y_start+map_side_length/4*i, W-x_start, y_start+map_side_length/4*i);
    draw_line(x_start+map_side_length/4*i, y_start, x_start+map_side_length/4*i, H-y_start);
}

if (lm.is_main){
//     map_nav_location=noone;
    var picture_scale=2;
    for (var i=0; i<ds_list_size(lm.locations); i++){
        var location=lm.locations[| i];
        var relative_x=x_start+(location.x/world_width)*map_side_length;
        var relative_y=y_start+(location.y/world_width)*map_side_length;
        var picture_width=background_get_width(all_location_icons[location.icon]);
        var picture_height=background_get_height(all_location_icons[location.icon]);
        if (map_nav_position==Misc.map_navigate&&mouse_within_rectangle(relative_x-picture_width/2/picture_scale, relative_y-picture_width/2/picture_scale,
            relative_x+picture_width/2, relative_y+picture_width/2)){
            map_nav_location=location;
        }
        var icon_scale=ternary(map_nav_location==location, 1, 0.5);
        var icon_offset=ternary(map_nav_location==location, 0, picture_width/4);
        draw_background_ext(all_location_icons[location.icon], relative_x-picture_width/2+icon_offset,
            relative_y-picture_height/2+icon_offset, icon_scale, icon_scale, 0, c_white, 1);
    }
}

switch (map_nav_position){
    case Misc.map_navigate:
        var rate=300*World.delta_time_seconds;
        var zoom_rate=World.delta_time_seconds;
        if (Controller.left){
            window_mouse_set_ext(max(MOUSE_X-rate, 0), MOUSE_Y);
        }
        if (Controller.up){
            window_mouse_set_ext(MOUSE_X, max(MOUSE_Y-rate, 0));
        }
        if (Controller.right){
            window_mouse_set_ext(min(MOUSE_X+rate, W), MOUSE_Y);
        }
        if (Controller.down){
            window_mouse_set_ext(MOUSE_X, min(MOUSE_Y+rate, H));
        }
        if (Controller.l){
            map_zoom=max(map_zoom-zoom_rate, back_zoom_min);
        }
        if (Controller.r){
            map_zoom=min(map_zoom+zoom_rate, back_zoom_max);
        }
        
        MOUSE_X=(window_mouse_get_x()/WW)*W;
        MOUSE_Y=(window_mouse_get_y()/HH)*H;
        
        if (map_nav_location!=noone){
            draw_set_font(Font20);
            draw_set_color(c_black);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            var width=string_width(map_nav_location.name);
            var height=string_height(map_nav_location.name);
            var xx=W/2;
            var yy=y_start+map_side_length+(H-(y_start+map_side_length))/2;
            var buffer=16;
            draw_rectangle_texture_auto(xx-width/2-buffer, yy-height/2-buffer,
                xx+width/2+buffer, yy+height/2+buffer, true);
            draw_text(xx, yy, map_nav_location.name);
            
            if (get_release_a()){
                map_nav_position=Misc.map_ft_confirm;
            }
        }
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_black);
/*        draw_input(Controller.gp_bind_l, Controller.mk_bind_l, W-120, H-160, "Zoom Out");
        draw_input(Controller.gp_bind_r, Controller.mk_bind_r, W-120, H-256, "Zoom In");*/
        
        if (get_release_b()){
            go_back=true;
        }
        if (go_back){
            pause_position=Pause.main;
            pause_cursor_set(56, 64, pause_main_n);
        }
        break;
    case Misc.map_ft_confirm:
        var buffer=64;
        var confirm_x_start=x_start+buffer;
        var confirm_y_start=y_start+buffer;
        var confirm_x_end=x_start+map_side_length-buffer;
        var confirm_y_end=y_start+map_side_length-buffer;
        var title_x=(confirm_x_start+confirm_x_end)/2;
        var title_y=confirm_y_start+buffer;
        draw_set_font(Font20);
        draw_set_color(c_black);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_rectangle_texture_auto(confirm_x_start, confirm_y_start, confirm_x_end, confirm_y_end, true);
        draw_text(title_x, title_y, map_nav_location.name);
        draw_set_font(Font16);
        draw_text_ext(title_x, (title_y+confirm_y_end)/2, map_nav_location.summary+"#"+ternary(cft, get_text(Text.ftGetAsk), get_text(Text.ftCantFastTravel)), -1, (confirm_x_end-confirm_x_start-buffer));
        if (cft){
            var yeah_nah_string_a=get_text(Text.yeah)+"        ";
            var yeah_nah_string=yeah_nah_string_a+get_text(Text.nah);
            var str_width_a=string_width(yeah_nah_string_a);
            var str_width=string_width(yeah_nah_string);
        } else {
            var yeah_nah_string=get_text(Text.ok);
            var str_width=string_width(yeah_nah_string);
            var yeah_nah_string_a=yeah_nah_string;
            var str_width_a=str_width;
        }
        draw_text(title_x, confirm_y_end-buffer, yeah_nah_string);
        if (mouse_within_rectangle(confirm_x_start, confirm_y_end-buffer*2, confirm_x_end, confirm_y_end)){
            map_confirm_position=(MOUSE_X-confirm_x_start) div ternary(cft, ((confirm_x_end-confirm_x_start)/2), 1);
        }
        var str_buffer=32;
        if (Controller.press_left||Controller.press_right){
            map_confirm_position=(++map_confirm_position)%ternary(cft, 2, 1);
            window_mouse_set_ext(W/2-str_width/2-str_buffer+ternary(map_confirm_position==0, 0, str_width_a), confirm_y_end-buffer);
            play_tone();
        }
        if (get_release_b()){
            go_back=true;
        }
        if (get_release_a()){
            if (map_confirm_position==1||!cft){
                go_back=true;
            } else {
                fast_travel=true;
            }
        }
        if (go_back){
            map_nav_position=Misc.map_navigate;
            map_nav_location=noone;
        }
        if (fast_travel){
            World.vars[0]=map_nav_location;
            Player.cutscene_index=get_cutscene_from_name("Fast Travel", 0);
            map_nav_position=Misc.map_navigate;
            map_confirm_position=0;
            unpause_game();
            with (Player){
                scr_cutscene_launch(cutscene_index);
            }
        }
        break;
    case Misc.map_ft_cant:
        var size_width=256;
        var size_height=160;
        draw_rectangle_texture_auto(W/2-size_width/2, H/2-size_height/2, W/2+size_width/2, H/2+size_height/2, true);
        draw_set_font(Font20);
        draw_set_color(c_black);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(W/2, H/2, get_text(Text.ftCantFastTravel));
        var str=get_text(Text.ok);
        var str_width=string_width(str);
        draw_text(title_x, confirm_y_end-buffer, str);
        if (mouse_within_rectangle(confirm_x_start, confirm_y_end-buffer*2, confirm_x_end, confirm_y_end)){
            map_confirm_position=(MOUSE_X-confirm_x_start) div ((confirm_x_end-confirm_x_start)/2);
        }
        var str_buffer=32;
        if (Controller.press_left||Controller.press_right){
            map_confirm_position=(++map_confirm_position)%2;
            window_mouse_set_ext(W/2-str_width/2-str_buffer+ternary(map_confirm_position==0, 0, str_width_a), confirm_y_end-buffer);
            play_tone();
        }
        if (get_release_b()){
            go_back=true;
        }
        if (get_release_a()){
            if (map_confirm_position==1){
                go_back=true;
            } else {
                fast_travel=true;
            }
        }
        break;
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-64, "Back");
