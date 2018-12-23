/// boolean validate_movement_script(string);

if (!string_starts_with(argument0, "MovementScripts.")){
    return false;
}

var str=string_replace(argument0, "MovementScripts.", "");

return (get_movement_script_from_name(str, -1)!=-1);
