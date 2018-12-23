/// String data_script_entity_stats(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref-160, 32, "Stats", argument0.editor_state==Editor.stats, argument0, Editor.stats);

if (argument0.editor_state==Editor.stats){
    var class=get_class(argument0);
    draw_text_colour(xref+16, 80, "Attack: Electric: "+string(get_attack_stat(argument0, CombatTypes.electric)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 96, "Attack: Fire: "+string(get_attack_stat(argument0, CombatTypes.fire)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 112, "Attack: Ice: "+string(get_attack_stat(argument0, CombatTypes.ice)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 128, "Attack: Smash: "+string(get_attack_stat(argument0, CombatTypes.smash)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 144, "Attack: Pierce: "+string(get_attack_stat(argument0, CombatTypes.pierce)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 160, "Attack: Boom: "+string(get_attack_stat(argument0, CombatTypes.boom)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 176, "Healing: "+string(get_attack_stat(argument0, CombatTypes.heal)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 192, "Defense: Electric: "+string(get_defend_stat(argument0, CombatTypes.electric)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 208, "Defense: Fire: "+string(get_defend_stat(argument0, CombatTypes.fire)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 224, "Defense: Ice: "+string(get_defend_stat(argument0, CombatTypes.ice)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 240, "Defense: Smash: "+string(get_defend_stat(argument0, CombatTypes.smash)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 256, "Defense: Pierce: "+string(get_defend_stat(argument0, CombatTypes.pierce)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+16, 272, "Defense: Boom: "+string(get_defend_stat(argument0, CombatTypes.boom)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
}
