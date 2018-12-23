var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
var str=' !"\#';
for (var i=36; i<256; i++){
    str=str+chr(i);
}
ds_list_add(l, args(scr_talk, "\k"+str+"#That's all of the characters in the assigned dialogue font."));
ds_list_add(l, args(scr_lock_unset));

return l;
