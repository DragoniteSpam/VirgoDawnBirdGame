/// boolean validate_se(string);

if (!string_starts_with(argument0, "SE.")){
    return false;
}

var str=string_replace(argument0, "SE.", "");

return (get_se_from_name(str, -1)!=-1);
