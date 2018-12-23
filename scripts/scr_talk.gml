/// void scr_talk(ArgSet);
// sets up NPC dialogue (or inanimate object dialogue, if you want)
// Arguments:
//   - String text
//   - [boolean showSpeechArrow]

World.speaking=id;
show_text_t=0;  // this comes first so it can be set by an escape sequence later
show_text_message=scr_escape_sequence(argument0[| 0].value);
if (ds_list_size(argument0)==2&&argument0[| 1].value){
    World.speaking_arrow=true;
} else {
    World.speaking_arrow=false;
}
play_tone();

World.keep_going=false;
