/// Environment add_environment(name, weather script, [encounter script]);

with (instantiate(Environment)){
    name=argument[0];
    weather_script=argument[1];
    switch (argument_count){
        case 3:
            encounter_script=argument[2];
        default:
            break;
    }
    return id;
}
