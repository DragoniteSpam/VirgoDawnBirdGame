/// String get_text(enum entry, insert0, insert1, .. insert9);

var str=game_text[argument[0], 1];

for (var i=1; i<=string_length(str); i++){
    var previous=string_char_at(str, i-1);
    var char=string_char_at(str, i);
    var next=string_char_at(str, i+1);
    if (char=='&'){
        if (previous=='\'){
            // i think this is the right code?
            str=string_copy(str, 1, i-2)+string_copy(str, i, string_length(str)-1-i);
        } else {
            if (validate_int(next)){
                var n=real(next);
                if (n<argument_count){
                    str=string_copy(str, 1, i-1)+string(argument[n+1])+string_copy(str, i+2, string_length(str)-1-i);
                }
            }
        }
    }
}

return str;
