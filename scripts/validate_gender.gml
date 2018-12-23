/// boolean validate_gender(string);

if (!string_starts_with(argument0, "Genders.")){
    return false;
}

var str=string_replace(argument0, "Genders.", "");

return (get_gender_from_name(str, -1)!=-1);
