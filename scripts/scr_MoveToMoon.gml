/// void scr_MoveToMoon(NPC);

var actor=ds_map_find_value(all_mod_packages, argument0[| 0].value).my_npcs[argument0[| 1].value].actor;
if (actor!=noone) with (actor){
    var mangle=MOON_ANGLE;
    var r=5;
    x=Camera.x+42000*dcos(mangle)/r;
    y=Camera.y+3000/r;
    z=42000*dsin(mangle)/r;
    lerp_target_x=x;
    lerp_target_y=y;
    lerp_target_z=z;
}

World.keep_going=true;
