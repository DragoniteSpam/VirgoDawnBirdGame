/// boolean validate_color(string);

if (!string_starts_with(argument0, "Colors.")){
    return false;
}

var str=string_replace(argument0, "Colors.", "");

return (get_color_from_name(str, -1)!=-1);
