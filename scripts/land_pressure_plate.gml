/// void land_pressure_plate(Entity);

if (state==Misc.up){
    script_execute(ds_map_find_value(all_mod_packages, action_package).my_pressure_plate_actions[action].on_trigger);
    PLAY(se_click, false);
    state=Misc.down;
    model_index=1;
    squashing=argument0;
}
