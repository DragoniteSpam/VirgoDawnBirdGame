// editor_hud_mode_change([clear selection]);

var clear_selection=true;
switch (argument_count){
    case 1:
        var clear_selection=argument[0];
        break;
}

// header
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var xref=W*3/4;
draw_rectangle_texture_auto(xref, 448, W-32, H-32, true);
draw_set_color(graphics_text_color);

// These need to be in order.

draw_text(xref+16, 448+16, "Editor Modes");
draw_text(xref+16, 480, "Object");
draw_text(xref+16, 480+16, "Events");
draw_text(xref+16, 480+32, "Generation");
draw_text(xref+16, 480+48, "Map Settings");
draw_text(xref+16, 480+64, "Game Text");
draw_text(xref+16, 480+80, "Save File");
draw_text(xref+16, 480+96, "Inventory");
draw_text(xref+16, 480+112, "Quests");
draw_text(xref+16, 480+144, "All Selectable");
draw_text(xref+16, 480+128, "Cutscenes");
draw_text(xref+16, 480+160, "Database");
draw_text(xref+16, 480+176, "File");

draw_rectangle(xref+8, 480-8+16*(mode-GameModes.edit_object), 
            W-40, 480+8+16*(mode-GameModes.edit_object), true);

if (mouse_within_rectangle(xref, 480-8, W-32, 480+8+176)){
    mouse_over_menu=true;
    var m=clamp(((MOUSE_Y-(480-8)) div 16), 0, 11);
    draw_rectangle(xref+8, 480-8+16*m, W-40, 480+8+16*m, true);
    if (get_release_a()){
        if (clear_selection){
            editor_selection_clear();
        }
        switch (m){
            case 0:
                mode=GameModes.edit_object;
                break;
            case 1:
                mode=GameModes.edit_event;
                break;
            case 2:
                mode=GameModes.edit_generation;
                break;
            case 3:
                mode=GameModes.edit_settings;
                break;
            case 4:
                mode=GameModes.edit_text;
                break;
            case 5:
                mode=GameModes.edit_game;
                break;
            case 6:
                mode=GameModes.edit_inventory;
                break;
            case 7:
                mode=GameModes.edit_quest;
                break;
            case 8:
                mode=GameModes.edit_all;
                break;
            case 9:
                keyboard_string="";
                mode=GameModes.edit_cutscene;
                break;
            case 10:
                mode=GameModes.edit_database;
                break;
            case 11:
                mode=GameModes.edit_file;
                break;
        }
    }
}
