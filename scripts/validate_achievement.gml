/// boolean validate_achievement(string);

if (!string_starts_with(argument0, "Ach.")){
    return false;
}

var str=string_replace(argument0, "Ach.", "");

return (get_achievement_from_name(str, -1)!=-1);
