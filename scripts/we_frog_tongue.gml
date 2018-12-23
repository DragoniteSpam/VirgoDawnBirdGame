var range=256;
var length=range*power(dsin(scaleTo(charge_level, 1, 180)), 2);

var transform=transform_point_3d(length, 0, 0, pitch, 0, direction);

/*var end_x=x+length*dcos(direction);
var end_y=y-length*dsin(direction);*/

var caster=ds_map_find_value(all_mod_packages, npc_package).my_npcs[npc_index].actor;
c_object_set_mask(caster.object, 0, 0);

if (c_raycast_world(x, y, z+8, x+transform[vec3.xx], y+transform[vec3.yy], z+8+transform[vec3.zz], COLLISION_PRIMARY)){
    with (CollisionGetObject()){
        var f=1/25;
        if (hit_flag_accept(c_hit_x(), c_hit_y())){
            script_execute(all_hit_scripts[on_hit], CombatTypes.smash, caster, f, f);
        } else {
            hit_flag_invalid_response(c_hit_x(), c_hit_y(), c_hit_z());
        }
    }
}

c_object_set_mask(caster.object, caster.mask, caster.mask);

charge_level=charge_level+charge_level_d;
if (charge_level>=1&&charge_level_d>0){
    charge_level_d=0;
    charge_level=0;
}
