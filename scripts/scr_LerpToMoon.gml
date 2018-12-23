/// void scr_MoveToMoon(NPC);

var actor=ds_map_find_value(all_mod_packages, argument0[| 0].value).my_npcs[argument0[| 1].value].actor;
if (actor!=noone) with (actor){
    var mangle=MOON_ANGLE;
    var r=5;
    lerp_target_x=Camera.x+42000*dcos(mangle)/r;
    lerp_target_y=Camera.y+3000/r;
    lerp_target_z=42000*dsin(mangle)/r;
}

World.keep_going=false;
