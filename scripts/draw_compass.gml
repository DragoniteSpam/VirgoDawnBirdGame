/// draw_hud_compass(x, y);
// Draws the compass graphic, CENTERED AT X
// The size of the compass background is slightly over 2*180 degrees, so that I don't have to
// do extra math to get the contents to fit properly, but if you change the picture you'll have
// to multiply cd by some scalar to get everything to align nicely

var xx=argument0;
var yy=argument1;
var ww=background_get_width(b_compass)/2;
var hh=background_get_height(b_compass)/2;

draw_background(b_compass, xx-ww, yy);
draw_sprite_ext(spr_paw, 0, xx-ww, yy+hh, 1, 1, 20, c_white, 1);
draw_sprite_ext(spr_paw, 0, xx+ww, yy+hh, 1, 1, -20, c_white, 1);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(Font20);
draw_set_color(graphics_text_color);


// N/S/E/W

yy=yy+12;

var cd=get_compass_direction(Directions.north);
if (abs(cd)<90){
    draw_text_outline_dn(xx-2*cd, yy, "N", c_white, c_black, 1, 1);
}
cd=get_compass_direction(Directions.south);
if (abs(cd)<90){
    draw_text_outline_dn(xx-2*cd, yy, "S", c_white, c_black, 1, 1);
}
cd=get_compass_direction(Directions.east);
if (abs(cd)<90){
    draw_text_outline_dn(xx-2*cd, yy, "E", c_white, c_black, 1, 1);
}
cd=get_compass_direction(Directions.west);
if (abs(cd)<90){
    draw_text_outline_dn(xx-2*cd, yy, "W", c_white, c_black, 1, 1);
}

// NE/SE/SW/NW

cd=get_compass_direction(Directions.northeast);
if (abs(cd)<90){
    draw_text(xx-2*cd, yy, "'");
}
cd=get_compass_direction(Directions.southeast);
if (abs(cd)<90){
    draw_text(xx-2*cd, yy, "'");
}
cd=get_compass_direction(Directions.northwest);
if (abs(cd)<90){
    draw_text(xx-2*cd, yy, "'");
}
cd=get_compass_direction(Directions.southwest);
if (abs(cd)<90){
    draw_text(xx-2*cd, yy, "'");
}

// Floaty markers
if (show_floaty_markers){
    for (var i=0; i<ds_list_size(Player.active_quests); i++){
        var q=Player.active_quests[| i];
        if (q.active){
            var stage=q.stages[| q.active_stage];
            if (stage.floaty_marker>0){
            var actor=ds_map_find_value(all_mod_packages, stage.floaty_marker_package).my_npcs[stage.floaty_marker].actor;
                if (instance_exists(actor)){
                    var dir=get_compass_direction(point_direction(Camera.x, Camera.y, actor.x, actor.y));
                    if (abs(dir)<150){
                        var picture=compass_point_pictures[CompassPoints.Default];
                        var ratio=background_get_width(picture)/background_get_height(picture);
                        draw_background_stretched(picture, xx-2*clamp(dir, -90, 90)-12, yy-12, ratio*24, 24);
                    }
                }
            }
        }
    }
}

// @todo Find a better way to do compass points.

//////////////////////////////
//////// Enemy HP bar ////////
//////////////////////////////

c_object_set_mask(Player.object, 0, 0);
if (c_raycast_world(Player.x, Player.y, Player.z+EYE_LEVEL,
            Player.x+HP_RAYCAST_DISTANCE*dcos(Camera.direction),
            Player.y-HP_RAYCAST_DISTANCE*dsin(Camera.direction),
            Player.z-HP_RAYCAST_DISTANCE*dsin(Camera.pitch)+EYE_LEVEL,
            COLLISION_PRIMARY)){
    var obj=CollisionGetObject();
    if (instanceof(obj, Entity)&&obj.alive&&obj.hp_current<get_max_hp(obj.exp_hp)){
        draw_set_font(Font12);
        var header_w=max(string_width(obj.name), floor(get_max_hp(obj.exp_hp)/BASE_HP_FACTOR)*24)+32;
        draw_rectangle_texture_auto(W/2-header_w/2, yy+16, W/2+header_w/2, yy+64, true);
        if (string_length(obj.name)>0){
            draw_text(W/2, yy+44, obj.name);
        } else {
            draw_text(W/2, yy+44, "???");
        }
        draw_compass_health(obj, xx, yy+28);
    }
}
c_object_set_mask(Player.object, Player.mask, Player.mask);
