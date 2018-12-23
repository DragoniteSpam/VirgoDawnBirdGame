// header
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var start_x=32;
var h=H-32;
var nc=ds_list_size(all_cutscenes);
draw_rectangle_colour(0, 0, W, H, c_white, c_white, c_white, c_white, false);
draw_rectangle_texture_auto(start_x, 32, W/4, H-32, true);
draw_set_color(graphics_text_color);

draw_text(start_x+16, 48, "Cutscenes");
for (var i=edit_cutscene_index; i<min(nc, edit_cutscene_index+edit_cutscene_limit); i++){
    draw_text(start_x+16, 64+16*(i-edit_cutscene_index), all_cutscenes[| i].name);
}
draw_text_colour(start_x+16, 64+16*(i-edit_cutscene_index), "    Add Cutscene", c_blue, c_blue, c_blue, c_blue, 1);

if (edit_cutscene_active!=noone){
    var i=edit_cutscene_active-edit_cutscene_index;
    if (i>=0&&i<min(nc-edit_cutscene_index, edit_cutscene_limit)){
        draw_rectangle(start_x+12, 56+16*i, W/4-32, 72+16*i, true);
    }
}

if (MOUSE_X<=W/4){
    var limit=min(nc-edit_cutscene_index, edit_cutscene_limit);
    var n=clamp((MOUSE_Y-58) div 16, 0, limit);
    if (n==limit){
        if (get_release_a()){
            instantiate(Cutscene);
        }
    } else {
        if (get_release_a()){
            edit_cutscene_active=edit_cutscene_index+n;
            edit_cutscene_line_active=0;
            edit_cutscene_line_pos=0;
        }
    }
    draw_rectangle_colour(start_x+12, 56+16*n, W/4-32, 72+16*n, c_blue, c_blue, c_blue, c_blue, true);
    if (mouse_wheel_up()){
        edit_cutscene_index=max(0, --edit_cutscene_index);
    } else if (mouse_wheel_down()){
        edit_cutscene_index=min(nc-1, ++edit_cutscene_index);
    } else if (keyboard_check_released(vk_pageup)){
        edit_cutscene_index=max(0, edit_cutscene_index-(edit_cutscene_limit div 2));
    } else if (keyboard_check_released(vk_pagedown)){
        edit_cutscene_index=min(nc-1, edit_cutscene_index+(edit_cutscene_limit div 2));
    }
}

start_x=W/4+32;

draw_rectangle(start_x, 32, W*3/4, H-32, true);
if (edit_cutscene_active==noone){
    draw_text_colour(start_x+16, 48, "No cutscene selected. Select a cutscene to start typing code.", c_blue, c_blue, c_blue, c_blue, 1);
} else {
    var cut=all_cutscenes[| edit_cutscene_active];
    for (var i=edit_cutscene_line_index; i<min(edit_cutscene_line_index+edit_cutscene_limit, ds_list_size(cut.code)); i++){
//        var str=string_copy(cut.code[| i], edit_cutscene_line_char, min(string_length(cut.code[| i])-edit_cutscene_line_char, edit_cutscene_line_char_limit));
        if (!cut.changed){
            var c=World.cutscene_compiler_state_colors[cut.line_status[| i]];
            if (c!=c_white){
                var line_y=56+16*(i-edit_cutscene_line_index);
                draw_rectangle_colour(start_x+8, line_y, W*3/4-8, line_y+16, c, c, c, c, false);
            }
        }
        var str=string_replace_all(cut.code[| i], "#", "\#");
        draw_text(start_x+16, 64+16*(i-edit_cutscene_line_index), string_copy(str, edit_cutscene_box_start, string_length(str)-edit_cutscene_box_start));
        /*var q=split(str, " .,#()+-/*"+'"', true);
        var current_line="";
        var rest_is_comment=false;
        while (!ds_queue_empty(q)){
            var term=ds_queue_dequeue(q);
            var next_term=ds_queue_head(q);
            if (term=="#"){
                rest_is_comment=true;
                term="\#";
            }
            if (rest_is_comment){
                var c=c_comment;
            } else if (next_term=="("){
                var c=c_function;
            } else if (next_term=="."&&term!=")"){
                var c=c_object;
            } else {
                var c=c_regular;
            }
            draw_text_colour(start_x+16+string_width(current_line), 64+16*(i-edit_cutscene_line_index), term, c, c, c, c, 1);
            current_line=current_line+term;
        }
        ds_queue_destroy(q);*/
    }
    if (MOUSE_X>start_x&&MOUSE_Y<W*3/4){
        var line=cut.code[| edit_cutscene_line_active];
        var comments="";
        var str=string_replace_all(line, "#", " ");
        var rect_x1=start_x+16+string_width(string_copy(str, edit_cutscene_box_start, edit_cutscene_line_pos-edit_cutscene_box_start));
        var rect_x2=rect_x1;
        var rect_y1=54+16*(edit_cutscene_line_active-edit_cutscene_line_index);
        var rect_y2=rect_y1+16;
        if (current_second % 2==0){
            draw_line_width(rect_x1, rect_y1, rect_x2, rect_y2, 2);
        }
        cut.code[| edit_cutscene_line_active]=string_copy(line, 1, edit_cutscene_line_pos)+keyboard_string+string_copy(line, edit_cutscene_line_pos+1, string_length(line)-edit_cutscene_line_pos);
        edit_cutscene_line_pos=edit_cutscene_line_pos+string_length(keyboard_string);
        if (string_length(keyboard_string)>0){
            cut.uptodate=false;
            cut.changed=true;
        }
        keyboard_string="";
        if (keyboard_check_pressed(vk_tab)){
            cut.code[| edit_cutscene_line_active]=string_copy(line, 1, edit_cutscene_line_pos)+"    "+string_copy(line, edit_cutscene_line_pos+1, string_length(line)-edit_cutscene_line_pos);
            edit_cutscene_line_pos=edit_cutscene_line_pos+string_length("    ");
        }
        if (keyboard_check_pressed(vk_backspace)){
            if (edit_cutscene_line_pos==0&&edit_cutscene_line_active>0){
                edit_cutscene_line_pos=string_length(cut.code[| edit_cutscene_line_active-1]);
                cut.code[| edit_cutscene_line_active-1]=cut.code[| edit_cutscene_line_active-1]+cut.code[| edit_cutscene_line_active];
                ds_list_delete(cut.code, edit_cutscene_line_active);
                edit_cutscene_line_active--;
                cut.uptodate=false;
                cut.changed=true;
            } else {
                line=cut.code[| edit_cutscene_line_active];
                cut.code[| edit_cutscene_line_active]=string_copy(line, 1, edit_cutscene_line_pos-1)+string_copy(line, edit_cutscene_line_pos+1, string_length(line)-edit_cutscene_line_pos);
                edit_cutscene_line_pos--;
                cut.uptodate=false;
                cut.changed=true;
            }
        }
        if (keyboard_check_pressed(vk_delete)){
            line=cut.code[| edit_cutscene_line_active];
            cut.code[| edit_cutscene_line_active]=string_copy(line, 1, edit_cutscene_line_pos)+string_copy(line, edit_cutscene_line_pos+2, string_length(line)-edit_cutscene_line_pos-1);
            cut.uptodate=false;
            cut.changed=true;
            if (edit_cutscene_line_pos>=string_length(cut.code[| edit_cutscene_line_active])&&edit_cutscene_line_active<(ds_list_size(cut.code)-1)){
                cut.code[| edit_cutscene_line_active]=cut.code[| edit_cutscene_line_active]+cut.code[| edit_cutscene_line_active+1];
                ds_list_delete(cut.code, edit_cutscene_line_active+1);
            }
        }
        if (keyboard_check_pressed(vk_left)){
            if (edit_cutscene_line_pos==0){
                if (edit_cutscene_line_active>0){
                    edit_cutscene_line_active--;
                    edit_cutscene_line_pos=string_length(cut.code[| edit_cutscene_line_active]);
                    if (edit_cutscene_line_active<edit_cutscene_line_index){
                        edit_cutscene_line_index--;
                    }
                }
            } else {
                edit_cutscene_line_pos--;
            }
        }
        if (keyboard_check_pressed(vk_right)){
            if (edit_cutscene_line_pos==string_length(cut.code[| edit_cutscene_line_active])){
                if (edit_cutscene_line_active<ds_list_size(cut.code)-1){
                    edit_cutscene_line_pos=0;
                    edit_cutscene_line_active++;
                    if (edit_cutscene_line_active<=edit_cutscene_line_index+edit_cutscene_limit){
                        edit_cutscene_line_index++;
                    }
                }
            } else {
                edit_cutscene_line_pos++;
            }
        }
        if (keyboard_check_pressed(vk_up)){
            edit_cutscene_line_active=max(0, --edit_cutscene_line_active);
            edit_cutscene_line_pos=min(edit_cutscene_line_pos, string_length(cut.code[| edit_cutscene_line_active]));
            if (edit_cutscene_line_active<edit_cutscene_line_index){
                edit_cutscene_line_active--;
            }
        }
        if (keyboard_check_pressed(vk_down)){
            edit_cutscene_line_active=min(ds_list_size(cut.code)-1, ++edit_cutscene_line_active);
            edit_cutscene_line_pos=min(edit_cutscene_line_pos, string_length(cut.code[| edit_cutscene_line_active]));
        }
        if (keyboard_check_pressed(vk_home)){
            edit_cutscene_line_pos=0;
        }
        if (keyboard_check_pressed(vk_end)){
            edit_cutscene_line_pos=string_length(cut.code[| edit_cutscene_line_active]);
        }
        if (keyboard_check_pressed(vk_pageup)){
            repeat (edit_cutscene_limit div 2){
                edit_cutscene_line_active=max(0, --edit_cutscene_line_active);
                edit_cutscene_line_pos=min(edit_cutscene_line_pos, string_length(cut.code[| edit_cutscene_line_active]));
            }
        }
        if (keyboard_check_pressed(vk_pagedown)){
            repeat (edit_cutscene_limit div 2){
                edit_cutscene_line_active=min(ds_list_size(cut.code)-1, ++edit_cutscene_line_active);
                edit_cutscene_line_pos=min(edit_cutscene_line_pos, string_length(cut.code[| edit_cutscene_line_active]));
            }
        }
        if (keyboard_check_pressed(vk_enter)){
            line=cut.code[| edit_cutscene_line_active]
            ds_list_insert(cut.code, edit_cutscene_line_active+1, string_copy(line, edit_cutscene_line_pos+1, string_length(line)-edit_cutscene_line_pos));
            cut.code[| edit_cutscene_line_active]=string_copy(line, 1, edit_cutscene_line_pos);
            edit_cutscene_line_active++;
            edit_cutscene_line_pos=0;
            cut.uptodate=false;
            cut.changed=true;
        }
        if (mouse_wheel_up()){
            repeat(5){
                edit_cutscene_line_active=max(0, --edit_cutscene_line_active);
            }
        }
        if (mouse_wheel_down()){
            repeat(5){
                edit_cutscene_line_active=min(ds_list_size(cut.code)-1, ++edit_cutscene_line_active);
            }
        }
        var box_buffer=56;
        if (edit_cutscene_line_pos<edit_cutscene_box_start){
            edit_cutscene_box_start=edit_cutscene_line_pos;
        } else if (edit_cutscene_line_pos>edit_cutscene_box_start+box_buffer){
            edit_cutscene_box_start=edit_cutscene_line_pos-box_buffer;
        }
    }
}

if (edit_cutscene_active!=noone){
    var cut=all_cutscenes[| edit_cutscene_active];
    var cprefix=ternary(cut.uptodate, "", "* ");
    start_x=W*3/4;
    draw_rectangle_texture_auto(start_x, 32, W-32, H/2+100, true);
    draw_text(start_x+16, 48, "Name: "+cut.name);
    draw_set_valign(fa_top);
    draw_text_ext(start_x+16, 56, "Summary: "+cut.summary, -1, W/4-64);
    draw_text(start_x+16, H/2, "Save to Text");
    draw_text(start_x+16, H/2+16, "Load from Text");
    draw_text_colour(start_x+16, H/2+32, cprefix+"Compile", c_green, c_green, c_green, c_green, 1);
    draw_text_colour(start_x+16, H/2+48, "Delete", c_red, c_red, c_red, c_red, 1);
    if (mouse_within_rectangle(start_x, 40, W-32, 56)){
        draw_rectangle(start_x+16, 40, W-48, 56, true);
        if (get_release_a()){
            cut.name=get_string("New name for this cutscene?", cut.name);
        }
    } else if (mouse_within_rectangle(start_x, 56, W-32, H/2)){
        draw_rectangle(start_x+16, 56, W-48, H/2-16, true);
        if (get_release_a()){
            cut.summary=string_copy(get_string("New summary for this cutscene?", cut.summary), 1, 120);
        }
    } else if (mouse_within_rectangle(start_x, H/2, W-32, H/2+16)){
        draw_rectangle(start_x+16, H/2, W-48, H/2+16, true);
        if (get_release_a()){
            editor_cutscene_save_cutscene(cut);
        }
    } else if (mouse_within_rectangle(start_x, H/2+16, W-32, H/2+32)){
        draw_rectangle(start_x+16, H/2+16, W-48, H/2+32, true);
        if (get_release_a()){
            editor_cutscene_load_cutscene(cut);
        }
    } else if (mouse_within_rectangle(start_x, H/2+32, W-32, H/2+48)){
        draw_rectangle(start_x+16, H/2+32, W-48, H/2+48, true);
        if (get_release_a()){
            cut.changed=false;
            if (editor_cutscene_compile_cutscene(cut)){
                cut.uptodate=true;
            }
        }
    } else if (mouse_within_rectangle(start_x, H/2+48, W-32, H/2+64)){
        draw_rectangle(start_x+16, H/2+48, W-48, H/2+96, true);
        if (get_release_a()&&show_question("Are you sure you want to delete "+all_cutscenes[| edit_cutscene_active].name+"?")){
            if (show_question("Really sure?")){
                ds_list_delete(all_cutscenes, edit_cutscene_active);
                edit_cutscene_active=noone;
            }
        }
    }
}
