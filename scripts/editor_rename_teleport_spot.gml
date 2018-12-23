var max_size=ds_grid_width(teleport_spots);
var number=clamp(get_integer('Which Teleport Spot to rename? (This is just an internal name and has no bearing on gameplay.)', 0), 0, max_size-1);

var oldname=teleport_spots[# number, 0];

if (show_question('This Teleport Spot is currently named '+string(oldname)+'. Would you like to rename it?')){
    var str=get_string('New name.', string(oldname));
    if (string_length(str)>0){
        teleport_spots[# number, 0]=str;
        show_message('Remember to save!');
        return true;
    }
}

return false;
