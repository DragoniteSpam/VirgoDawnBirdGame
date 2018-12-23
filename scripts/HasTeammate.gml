/// boolean HasTeammate(class index);

for (var i=0; i<ds_list_size(Player.team); i++){
    if (Player.team[| i]==argument0){
        return true;
    }
}

return false;
