/// boolean validate_mod_package(string);

if (!string_starts_with(argument0, "Packages.")){
    return false;
}

var str=string_replace(argument0, "Packages.", "");

return (get_mod_package_from_name(str, -1)!=-1);
