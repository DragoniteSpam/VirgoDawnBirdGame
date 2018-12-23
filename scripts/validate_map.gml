/// boolean validate_map(string);

if (!string_starts_with(argument0, "Maps.")){
    return false;
}

var str=string_replace(argument0, "Maps.", "");

return (get_map_from_name(Compiler.mod_package, str, -1)!=-1);
