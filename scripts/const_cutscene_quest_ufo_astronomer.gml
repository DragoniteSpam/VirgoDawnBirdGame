/// cutscene const_cutscene_quest_ufo_astronomer();

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_set_multi_option, "All the time!", 0, "Nope. Not at all.", 1));
ds_list_add(l, args(scr_talk, "Have you ever looked up at the night sky and wished that beings from another world could contact us?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_talk, "We think alike, then!"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_talk, "Oh . . . that's too bad . . ."));
ds_list_add(l, args(scr_push_raw, 0, Quests.qUFO));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.not_equal, 300, scr_goto, "end"));

// Begin quest stuff

ds_list_add(l, args(scr_talk, "It's just that . . . it seems impossible that as big as the universe is, we're the only things living in it."));
ds_list_add(l, args(scr_set_multi_option, "Yeah!", 0, "I like cake . . . ?", 1, "Too philosophical for me!", 2));
ds_list_add(l, args(scr_talk, "You know what I mean?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "You see, ever since I retired ten years ago I just spend all day and night looking through this little telescope at the stars, hoping to see something."));
ds_list_add(l, args(scr_set_multi_option, "You've lost your marbles.", 0, "I have something that may interest you . . .", 1));
ds_list_add(l, args(scr_talk, "It's my dream that some day aliens from another planet descend upon the Earth and say "+'"you are not that crazy after all, old man! Come spend the rest of your days exploring the cosmos with us!"'));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_talk, "People tell me that all the time. But I know it just might happen some day!"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_goto, "end"));

// Giving the crazy old man the paper

ds_list_add(l, args(scr_talk, "What? What's this?"));
ds_list_add(l, args(scr_remove_item, Items.ALIENMEMO, 1));
ds_list_add(l, args(scr_talk, "*Gave the old man the Encoded Paper.*"));
ds_list_add(l, args(scr_talk, "Hey, I know how to read this . . . let's see, F becomes E . . . O becomes N . . ."));
ds_list_add(l, args(scr_talk, '"Go to the Ring with the moon out to make something interesting happen?"'+" How curious. Well, it's worth a shot, isn't it?"));
ds_list_add(l, args(scr_talk, "I'm going to the Ring. See you!"));
ds_list_add(l, args(scr_fade, c_black, 1, 1));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_move_to, NPCs.NPCUFOAstronomerB, 8320, 11616, 16, Directions.south));   // The new copy of Astronomer who has the correct cutscene index
ds_list_add(l, args(scr_move_to, NPCs.NPCUFOAstronomer, 8320, 11616, -24, Directions.south));   // This guy needs to be hidden from sight
ds_list_add(l, args(scr_fade, c_black, 0, 1));
ds_list_add(l, args(scr_validate_quests));

// end quest stuff

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
