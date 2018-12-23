// 180/number of frames to animation completion
anim_cast_rate=180/(room_speed/2)+charge_level;
anim_swipe_distance=charge_level;

var caster=ds_map_find_value(all_mod_packages, npc_package).my_npcs[npc_index].actor;
var d=120;
c_object_set_mask(caster.object, 0, 0);

if (c_raycast_world(x-10*dcos(direction), y+10*dsin(direction), z+EYE_LEVEL/2, x+d*dcos(direction), y-d*dsin(direction), z/*-d*dsin(pitch)*/+EYE_LEVEL/2, COLLISION_PRIMARY)){
    with (CollisionGetObject()){
        if (hit_flag_accept(c_hit_x(), c_hit_y())){
            script_execute(all_hit_scripts[on_hit], CombatTypes.smash, caster, other.charge_level);
        }
    }
}

c_object_set_mask(caster.object, caster.mask, caster.mask);
charge_level=0;
