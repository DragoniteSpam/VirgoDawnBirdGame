/// Item add_pressure_plate_action(name, on trigger, on release);

with (instantiate(PressurePlateAction)){
    name=argument[0];
    on_trigger=argument[1];
    on_release=argument[2];
    
    return id;
}
