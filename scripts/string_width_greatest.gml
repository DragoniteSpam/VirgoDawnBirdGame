/// int string_width_greatest(list);

var gw=0;
for (var i=0; i<ds_list_size(argument0); i++){
    gw=max(string_width(argument0[| i]), gw);
}

return gw;
