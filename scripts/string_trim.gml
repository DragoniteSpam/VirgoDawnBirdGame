/// String string_trim(string);

var new_string=argument0;

while (string_char_at(new_string, 1)==" "){
    new_string=string_copy(new_string, 2, string_length(new_string)-1);
}

while (string_char_at(new_string, string_length(new_string))==" "){
    new_string=string_copy(new_string, 1, string_length(new_string)-1);
}

return new_string;
