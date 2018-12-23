/// String string_atob_cipher(original string);

var str='';
for (var i=1; i<=string_length(argument0); i++){
    var char=string_upper(string_char_at(argument0, i));
    if (char==string_letters(char)){
        if (char=='Z'){
            str=str+'A';
        } else {
            str=str+chr(ord(char)+1);
        }
    } else {
        str=str+char;
    }
}

return str;
