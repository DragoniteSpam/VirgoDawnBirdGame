/// boolean validate_quest(string);

if (!string_starts_with(argument0, "Quests.")){
    return false;
}

var str=string_replace(argument0, "Quests.", "");

return (get_quest_from_name(str, -1)!=-1);
