/// boolean validate_model(string);

if (!string_starts_with(argument0, "Models.")){
    return false;
}

var str=string_replace(argument0, "Models.", "");

return (get_model_from_name(Compiler.mod_package, str, -1)!=-1);
