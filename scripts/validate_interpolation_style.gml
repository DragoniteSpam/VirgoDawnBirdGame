/// boolean validate_interpolation_style(string);

if (!string_starts_with(argument0, "InterpolationStyles.")){
    return false;
}

var str=string_replace(argument0, "InterpolationStyles.", "");

return (get_interpolation_style_from_name(str, -1)!=-1);
