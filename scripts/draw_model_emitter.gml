/// void Entity.draw_model_clocktower([texture]);

if (argument_count==0){
    draw_model();
} else {
    draw_model(argument0);
}

/*var list=ds_list_create();
if (emit_green){
    ds_list_add(list, RANDOM_PARTICLE_GREEN);
}
if (emit_water){
    ds_list_add(list, RANDOM_PARTICLE_WATER);
}
if (emit_warm){
    ds_list_add(list, RANDOM_PARTICLE_WARM);
}
if (emit_grayscale){
    ds_list_add(list, RANDOM_PARTICLE_GRAYSCALE);
}

if (ds_list_size(list)>0){
    repeat(density/fps){
        var element=random_element_from_list(list);
        create_particle(element, x+random_range(-4, 4), y+random_range(-4, 4), z,
            0, 0, 0, 0, 0, 0, random_range(0.5, 2), 360, 0, 0, -c_gravity);
    }
}

ds_list_destroy(list);*/

set_lighting(false);
part_emitter_burst(World.part_system_magic, World.part_emitter_magic, World.part_type_magic1, 4);
matrix(x, y, z, 90, 0, 270+point_direction(Camera.x, Camera.y, x, y), 1, 1, 1);
part_system_drawit(World.part_system_magic);
part_system_update(World.part_system_magic);
set_lighting(true);


