// header
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var x_type=32;
var x_model=W/4+32;
var x_cutscene=W/2+32;
var x_visible=W*3/4+32;
var h=64;

draw_rectangle_texture_auto(x_type, 32, W/4-32, h, true);
draw_rectangle_texture_auto(x_model, 32, W/2-32, h, true);
draw_rectangle_texture_auto(x_cutscene, 32, W*3/4-32, h, true);
draw_rectangle_texture_auto(x_visible, 32, W-32, h, true);
draw_set_color(graphics_text_color);

draw_text(x_type+16, 48, "Instance Type");
draw_text(x_model+16, 48, "Model Name");
draw_text(x_cutscene+16, 48, "Cutscene");
draw_text(x_visible+16, 48, "Visible Name");

var h=96;
var n=instance_number(Selectable);

draw_rectangle_texture_auto(x_type, h, W/4-32, H-32, true);
draw_rectangle_texture_auto(x_model, h, W/2-32, H-32, true);
draw_rectangle_texture_auto(x_cutscene, h, W*3/4-32, H-32, true);
draw_rectangle_texture_auto(x_visible, h, W-32, H-32, true);

for (var i=edit_all_index; i<min(edit_all_index+38, n); i++){
    if (!instance_exists(instance_find(Selectable, i))){
        continue;
    }
    var obj=instance_find(Selectable, i).id;
    if (World.selected==obj){
        var c=c_blue;
    } else if (!obj.deleteable){
        var c=c_red;
    } else {
        var c=c_black;
    }
    draw_sprite(spr_checkbox_16, obj.checked, x_type+8, h+24+16*(i-edit_all_index));
    draw_text_colour(x_type+16+16, h+16+16*(i-edit_all_index), object_get_name(obj.object_index), c, c, c, c, 1);
    if (instanceof(obj, Entity)){
        // @todo this is probably a little long so maybe find a way to only draw part of the string or something
        draw_text_colour(x_model+16, h+16+16*(i-edit_all_index), obj.mod_package+"\"+ds_map_find_value(all_mod_packages, obj.mod_package).my_models[obj.model].name, c, c, c, c, 1);
    } else {
        draw_text_colour(x_model+16, h+16+16*(i-edit_all_index), "---", c, c, c, c, 1);
    }
//    draw_text_colour(x_cutscene+16, h+16+16*(i-edit_all_index), game_cutscene_names[obj.cutscene_index], c, c, c, c, 1);
    draw_text_colour(x_visible+16, h+16+16*(i-edit_all_index), obj.name, c, c, c, c, 1);
}

if (mouse_within_rectangle(x_type, h, W-32, H-32)){
    var index=clamp(((mouse_y-h-8) div 16)+edit_all_index, 0, n-1);
    var obj=instance_find(Selectable, index).id;
    if (mouse_wheel_up()){
        edit_all_index=max(0, --edit_all_index);
    } else if (mouse_wheel_down()){
        edit_all_index=min(n-1, ++edit_all_index);
    } else if (keyboard_check_released(vk_pageup)){
        edit_all_index=max(0, edit_all_index);
    } else if (keyboard_check_released(vk_pagedown)){
        edit_all_index=min(n-1, edit_all_index+20);
    } else if (keyboard_check_released(vk_end)){
        edit_all_index=n-1;
    } else if (keyboard_check_released(vk_home)){
        edit_all_index=0;
    }
    
    if (mouse_within_rectangle(x_type, h, x_model, H-32)){
        draw_rectangle(x_type+4, h+16*index+16-8, x_model-64-4, h+16*index+16+8, true);
        if (get_release_a()){
            if (obj.deleteable){
                var m=mode;
                editor_select(obj)
                mode=m;
            }
        } else if (get_release_b()){
            if (obj.deleteable){
                obj.checked=!obj.checked;
            }
        }
    } else if (mouse_within_rectangle(x_model, h, x_cutscene, H-32)){
        draw_rectangle(x_model+4, h+16*index+16-8, x_cutscene-64-4, h+16*index+16+8, true);
        if (instanceof(obj, Entity)){
            if (get_release_a()){
                obj.model=get_model_from_name(obj.mod_package, get_string("New model?", ds_map_find_value(all_mod_packages, obj.mod_package).my_models[obj.model].name), obj.model);
            }
        }
    } else if (mouse_within_rectangle(x_cutscene, h, x_visible, H-32)){
        draw_rectangle(x_cutscene+4, h+16*index+16-8, x_visible-64-4, h+16*index+16+8, true);
        if (get_release_a()){
            // @todo Too lazy to do this now, implement this later
        }
    } else if (mouse_within_rectangle(x_visible, h, W-32, H/2)){
        draw_rectangle(x_visible+4, h+16*index+16-8, W-64-4, h+16*index+16+8, true);
        if (get_release_a()){
            obj.name=get_string("Visible name (when you lay your crosshairs on the collision model)", obj.name);
        }
    }
}
