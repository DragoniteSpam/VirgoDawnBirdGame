/// boolean validate_item(string);

if (!string_starts_with(argument0, "Items.")){
    return false;
}

var str=string_replace(argument0, "Items.", "");

return (get_item_from_name(Compiler.mod_package, str, -1)!=-1);
