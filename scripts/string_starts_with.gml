/// boolean string_starts_with(string, term);

if (string_length(argument0)<string_length(argument1)){
    return false;
}

return (string_copy(argument0, 1, string_length(argument1))==argument1);
