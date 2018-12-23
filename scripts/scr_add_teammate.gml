/// void scr_add_teammate(ArgSet);
/* Adds a teammate
 * syntax (in the const_npc thing):
 *  scr_add_teammate, class index
 */

AddTeammate(argument0.a[0]);

// this is a copy paste of scr_talk
World.speaking=id;
show_text_t=0;
show_text_message=all_classes[argument0.a[0]].name+get_text(Text.miscAddTeammate);
World.speaking_arrow=false;

// @todo Play 'get teammate' sound
// no continue
