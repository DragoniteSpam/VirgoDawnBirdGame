for (var i=0; i<ds_list_size(attached_particles); i++){
    if (instance_exists(attached_particles[| i])){
        with (attached_particles[| i]){ 
            instance_destroy();
        }
    }
}

ds_list_clear(attached_particles);
