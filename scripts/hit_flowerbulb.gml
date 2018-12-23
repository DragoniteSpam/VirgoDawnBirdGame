/// boolean hit_flowerbulb(type, attacker, strength);

var attacker=argument1;
var strength=argument2;

if (argument0&(CombatTypes.grow)){
    state=Misc.open;
    if (time_open==0){
        var factor=10000;
        time_open=factor*strength;
        if (size==Misc.large){
            model=Models.gen_flower_open_large;
        } else {
            model=Models.gen_flower_open_small;
        }
        // this'll blow up if you assign it a model with only one index
        model_index=irandom(array_length_1d(ds_map_find_value(all_mod_packages, mod_package).my_models[model].model_array)-1);
        c_world_remove_object(object);
        repeat(8+render_distance div 4){
            create_particle(RANDOM_PARTICLE_GRAYSCALE, x, y, z, -120, -120, 120, 120, 120, 240, 1, 360, 0, 0, c_gravity);
        }
        script_execute(collision_adder, id);
        scale=0;
    }
}

return false;
