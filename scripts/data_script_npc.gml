/// String data_script_npc(object);

var xref=W-320;

draw_rectangle_texture_auto_box(xref, 32, "NPC", argument0.editor_state==Editor.npc, argument0, Editor.npc);

data_script_entity(argument0);

if (argument0.editor_state==Editor.npc){
    draw_text(xref+16, 80, "Trainer ID: "+string(argument0.trainer_id));
    draw_text(xref+16, 96, "Image: "+background_get_name(all_npc_images[argument0.image]))
    draw_text(xref+16, 112, "Random movement? "+tf[argument0.movement_is_random]);
    draw_text(xref+16, 128, "Random rotation? "+tf[argument0.turning_is_random]);
    draw_text(xref+16, 144, "Movement frequency: "+string(argument0.movement_frequency));
    draw_text(xref+16, 160, "Turning frequency: "+string(argument0.turn_frequency));
    draw_text(xref+16, 176, "Movement radius: "+string(argument0.movement_radius));
    draw_text(xref+16, 192, "Direction Fix: "+tf[argument0.direction_fix]);
    draw_text(xref+16, 208, "Walk Animation: "+tf[argument0.walking_animation]);
    draw_text(xref+16, 224, "Aggro Level: "+aggro_level_names[argument0.aggro_level]);
    draw_text(xref+16, 240, "Combat Type: "+all_combat_ai_types[argument0.combat_type].name);
    draw_text(xref+16, 256, "Can Die: "+tf[argument0.can_die]);
    draw_text(xref+16, 272, "Can Heal: "+tf[argument0.can_heal]);
    draw_text(xref+16, 288, "Collision X Radius: "+string(argument0.collision_r));
    draw_text(xref+16, 304, "Collision Z Height: "+string(argument0.collision_h));

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 14);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.trainer_id=clamp(get_integer_c("Trainer ID?", argument0.trainer_id), 0, 65535);
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.image=get_npc_image_from_name(get_string_c("Image?", background_get_name(all_npc_images[argument0.image])), argument0.image);
                }
                var length=array_length_1d(all_npc_images);
                if (Controller.release_pleft){
                    argument0.image=(--argument0.image+length)%length;
                } else if (Controller.release_pright){
                    argument0.image=++argument0.image%length;
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.movement_is_random=!argument0.movement_is_random;
                }
                break;
            case 3:
                if (get_release_a()){
                    argument0.turning_is_random=!argument0.turning_is_random;
                }
                break;
            case 4:
                if (get_release_a()){
                    argument0.movement_frequency=clamp(get_integer_c("Movement frequency? This corresponds to a 1/n chance of wandering off every frame, assuming the game runs at a smooth 60 frames per second.", argument0.movement_frequency), 1, 65535);
                }
                break;
            case 5:
                if (get_release_a()){
                    argument0.turn_frequency=clamp(get_integer_c("MovemTurningent frequency? This corresponds to a 1/n chance of turning to face a random direction every frame, assuming the game runs at a smooth 60 frames per second.", argument0.turn_frequency), 1, 65535);
                }
                break;
            case 6:
                if (get_release_a()){
                    argument0.movement_radius=clamp(get_integer("Radius for random movement?", argument0.movement_radius), 0, 255);
                }
                break;
            case 7:
                if (get_release_a()){
                    argument0.direction_fix=!argument0.direction_fix;
                }
                break;
            case 8:
                if (get_release_a()){
                    argument0.walking_animation=!argument0.walking_animation;
                }
                break;
            case 9:
                if (get_release_a()){
                    argument0.aggro_level=(++argument0.aggro_level)%array_length_1d(aggro_level_names);
                }
                break;
            case 10:
                if (get_release_a()){
                    argument0.combat_type=get_combat_type_from_name(get_string_c("Combat type?", all_combat_ai_types[argument0.combat_type].name), argument0.combat_type);
                }
                if (get_release_b()){
                    argument0.combat_type++;
                    if (argument0.combat_type==CombatAITypes.final){
                        argument0.combat_type=0;
                    }
                }
                break;
            case 11:
                if (get_release_a()){
                    argument0.can_die=!argument0.can_die;
                }
                break;
            case 12:
                if (get_release_a()){
                    argument0.can_heal=!argument0.can_heal;
                }
                break;
            case 13:
                if (get_release_a()){
                    var n=clamp(get_real("Radius for the NPC's collision cylinder?", argument0.collision_r), 1, 100);
                    var change=n!=argument0.collision_r;
                    argument0.collision_r=n;
                    if (change){
                        script_execute(argument0.collision_remover, argument0);
                        script_execute(argument0.collision_adder, argument0);
                    }
                }
                break;
            case 14:
                if (get_release_a()){
                    var n=clamp(get_real("Height for the NPC's collision cylinder?", argument0.collision_h), 1, 100);
                    var change=n!=argument0.collision_h;
                    argument0.collision_h=n;
                    if (change){
                        script_execute(argument0.collision_remover, argument0);
                        script_execute(argument0.collision_adder, argument0);
                    }
                }
                break;
        }
    }
}
