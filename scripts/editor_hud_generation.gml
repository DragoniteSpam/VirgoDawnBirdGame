// header
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var h=256;
draw_rectangle_texture_auto(W*3/4+32, 32, W-32, H/2-16, false);
draw_set_color(graphics_text_color);
draw_text(W*3/4+48, 48, "Auto-Generation");
draw_text(W*3/4+48, 64, "Set Rectangle");
draw_text(W*3/4+48, 80, "Fill");
draw_text(W*3/4+48, 96, "Density: "+string_format(edit_generation_quantity, 2, 5)+"/m");
draw_text(W*3/4+48, 112, "Model: "+ds_map_find_value(all_mod_packages, edit_generation_package).my_models[edit_generation_index].name);
var c=rg[edit_generation_randomize_xrot];
draw_text_colour(W*3/4+64, 128, "Random X Rotation", c, c, c, c, 1);
var c=rg[edit_generation_randomize_yrot];
draw_text_colour(W*3/4+64, 144, "Random Y Rotation", c, c, c, c, 1);
var c=rg[edit_generation_randomize_zrot];
draw_text_colour(W*3/4+64, 160, "Random Z Rotation", c, c, c, c, 1);
draw_text(W*3/4+48, 176, "Z Min: "+string(edit_geneartion_z_min));
draw_text(W*3/4+48, 192, "Z Max: "+string(edit_geneartion_z_max));

if (mouse_within_rectangle(W*3/4+32, 40, W-32, H/2-16)){
    mouse_over_menu=true;
    var hovering=clamp((MOUSE_Y-40) div 16, 0, 7);
    draw_rectangle(W*3/4+40, 40+16*hovering, W-40, 56+16*hovering, true);
    if (Controller.press_a){
        switch (hovering){
            case 0:
                break;
            case 1:
                edit_generation_point=Misc.edit_generation_point1;
                break;
            case 2:
                editor_generation_doit();
                break;
            case 3:
                edit_generation_quantity=clamp(get_real("How many instances to generate per square meter?", edit_generation_quantity), 0.0001, 0.5);
                break;
            case 4:
                edit_generation_index=get_model_from_name(edit_generation_package, get_string("Model?", ds_map_find_value(all_mod_packages, edit_generation_package).my_models[edit_generation_index].name), edit_generation_index);
                break;
            case 5:
                edit_generation_randomize_xrot=!edit_generation_randomize_xrot;
                break;
            case 6:
                edit_generation_randomize_yrot=!edit_generation_randomize_yrot;
                break;
            case 7:
                edit_generation_randomize_zrot=!edit_generation_randomize_zrot;
                break;
            case 8:
                edit_geneartion_z_min=get_real("How far down through the surface the spawn can be created?", edit_geneartion_z_min);
                break;
            case 9:
                edit_geneartion_z_max=get_real("How far down through the surface the spawn can be created?", edit_geneartion_z_max);
                break;
        }
    }
}

if (edit_generation_point==Misc.edit_generation_point1){
    draw_rectangle_texture_auto(W/2, 32, W*3/4, 64, true);
    draw_text(W/2+32, 48, "Select Point 1 (B Button)");
    if (Controller.press_b){
        edit_generation_x1=Camera.x;
        edit_generation_y1=Camera.y;
        edit_generation_point=Misc.edit_generation_point2;
    }
} else if (edit_generation_point==Misc.edit_generation_point2){
    draw_rectangle_texture_auto(W/2, 32, W*3/4, 64, true);
    draw_text(W/2+32, 48, "Select Point 2 (B Button)");
    if (Controller.press_b){
        edit_generation_x2=Camera.x;
        edit_generation_y2=Camera.y;
        edit_generation_point=Misc.edit_generation_off;
    }
}
