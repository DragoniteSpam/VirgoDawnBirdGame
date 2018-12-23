var max_size=ds_grid_width(teleport_spots);
var name=get_string('Which teleport spot to set at the camera position?', '');

for (var i=0; i<max_size; i++){
    if (string_minimal(name)==string_minimal(string(teleport_spots[# i, 0]))){
        if (show_question('Are you certain?')){
            teleport_spots[# i, 1]=Camera.x;
            teleport_spots[# i, 2]=Camera.y;
            teleport_spots[# i, 3]=Camera.z;
            teleport_spots[# i, 4]=Camera.direction;
            show_message("Be sure to save it!");
        }
        return true;
    }
}

return false;
