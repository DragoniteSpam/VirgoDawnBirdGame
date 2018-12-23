/// void class_button_use_weapon();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

Player.anim_attack_preparing=false;
if (equip_weapon>0){
    var base_item=ds_map_find_value(all_mod_packages, equip_weapon_package).my_items[equip_weapon];
    if (Controller.b){
        Player.anim_attack_preparing=true;
        if (base_item.autofire){
            Player.charge_level_d=World.delta_time_seconds;
        } else {
            Player.charge_level=Player.charge_level+World.delta_time_seconds;
        }
    }
    
    if ((Controller.release_b&&!Controller.a&&Player.anim_cast_rate==0)||(base_item.autofire&&Player.charge_level_d>0)){
        with (Player){
            script_execute(all_weapon_effects[base_item.weapon_effect].script);
        }
    }
}
