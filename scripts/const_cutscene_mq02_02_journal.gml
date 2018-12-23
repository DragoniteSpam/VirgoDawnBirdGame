var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));

ds_list_add(l, args(scr_talk, string(current_month)+"/"+string(current_day)+"/"+string(current_year)+
    "#Number of birds caught: 167"+
    "#Number of birds killed: 53 (Blame Phillip, he's a clumsy nitwit)"));
ds_list_add(l, args(scr_talk, "Taxidermists are threatening to lower their prices. Buttheads."));
ds_list_add(l, args(scr_talk, "Felix is threatening to kick us out if we don't collect more birds for the Pounce Cultists. Buttheads."));
ds_list_add(l, args(scr_talk, "The annoying people over at the local bird conservation place might be catching on."+
    "Proceed with a little more caution, please?"));

ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_lock_unset));

return l;
