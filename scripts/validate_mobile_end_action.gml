/// boolean validate_interpolation_style(string);

if (!string_starts_with(argument0, "MobileEndActions.")){
    return false;
}

var str=string_replace(argument0, "MobileEndActions.", "");

return (get_mobile_end_action_from_name(str, -1)!=-1);
