/// EffectConfusion create_confusion(x, y, z, [rejuvinate id]);

with (instance_create(argument[0], argument[1], EffectConfusion)){
    z=argument[2];
    switch (argument_count){
        case 4:
            rejuvinate=argument[3];
            break;
    }
    return id;
}
