var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_set_multi_option, "No Shader", 0, "Brightness/Contrast", 1, "Cathode Ray", 2,
    "Emboss", 3, "Grayscale", 4, "Invert Colors", 5, "LED", 6));
ds_list_add(l, args(scr_set_multi_option_more, "Magnify", 7, "Mosaic", 8, "Posterize", 9, "Radial Blur", 10,
    "Scan Lines", 11, "Sepia Tone", 12, "Sketch", 13));
ds_list_add(l, args(scr_set_multi_option_more, "Vignette", 14));
ds_list_add(l, args(scr_talk, "Which shader do you want to activate?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_shader, Shaders.none));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_shader, Shaders.bc));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_shader, Shaders.crt));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 3, scr_shader, Shaders.emboss));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 4, scr_shader, Shaders.grayscale));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 5, scr_shader, Shaders.invert));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 6, scr_shader, Shaders.led));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 7, scr_shader, Shaders.magnify));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 8, scr_shader, Shaders.mosaic));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 9, scr_shader, Shaders.poster));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 10, scr_shader, Shaders.radial));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 11, scr_shader, Shaders.scanline));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 12, scr_shader, Shaders.sepia));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 13, scr_shader, Shaders.sketch));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 14, scr_shader, Shaders.vignette));
ds_list_add(l, args(scr_lock_unset));

return l;
