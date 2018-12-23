/// boolean validate_map_marker(string);

if (!string_starts_with(argument0, "MapMarkers.")){
    return false;
}

var str=string_replace(argument0, "MapMarkers.", "");

return get_map_marker_from_name(str, -1)!=-1;
