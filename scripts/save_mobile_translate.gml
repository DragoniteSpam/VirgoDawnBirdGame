/// save_mobile_translate(map, prefix);

save_entity(argument0, argument1);

var n=ds_list_size(stages);

ds_map_add(argument0, argument1+"n", n);

for (var i=0; i<n; i++){
    var vec=stages[| i];
    ds_map_add(argument0, "_local"+string(i)+".x", vec.x);
    ds_map_add(argument0, "_local"+string(i)+".y", vec.y);
    ds_map_add(argument0, "_local"+string(i)+".z", vec.z);
    ds_map_add(argument0, "_local"+string(i)+".name", vec.name);
}

ds_map_add(argument0, "action_speed", action_speed);
ds_map_add(argument0, "style", style);
ds_map_add(argument0, "position", position);
ds_map_add(argument0, "endaction", endaction);
ds_map_add(argument0, "absolute", absolute);
