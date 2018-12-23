/// load_mobile_translate(buffer);

load_entity(argument0);

var n=argument0[? "n"];

for (var i=0; i<n; i++){
    var vec=instantiate(Vector3);
    vec.x=argument0[? "_local"+string(i)+".x"];
    vec.y=argument0[? "_local"+string(i)+".y"];
    vec.z=argument0[? "_local"+string(i)+".z"];
    vec.name=argument0[? "_local"+string(i)+".name"];
    ds_list_add(stages, vec);
}

action_speed=argument0[? "action_speed"];
style=argument0[? "style"];
position=argument0[? "position"];
endaction=argument0[? "endaction"];
absolute=argument0[? "absolute"];
