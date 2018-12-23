/// void AddTeammate(class index);

if (ds_list_find_index(Player.team, argument0)!=-1){
    print(all_classes[argument0].name+' is already in your team.');
} else {
    ds_list_add(Player.team, argument0);
}
