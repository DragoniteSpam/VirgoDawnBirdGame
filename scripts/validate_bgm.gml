/// boolean validate_bgm(string);

if (!string_starts_with(argument0, "BGM.")){
    return false;
}

var str=string_replace(argument0, "BGM.", "");

return (get_bgm_from_name(Compiler.mod_package, str, -1)!=-1);
