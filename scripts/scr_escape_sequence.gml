/// String scr_escape_sequence(String);

var string_new='';
var len=string_length(argument0);
var escape_enabled=true;
for (var i=1; i<=len; i++){
    var c=string_char_at(argument0, i);
    if (escape_enabled){
        var cnext=string_char_at(argument0, i+1);
        switch (c){
            case '&':
                if (string_char_at(argument0, i-1)!='\'){
                    string_new=string_new+string(World.vars[clamp(ord(cnext)-ord('0'), 0, 9)]);
                    i++;
                }
                break;
            case '\':
                switch (cnext){
                    case 'w':
                        var value='';
                        for (var i=i+2; string_char_at(argument0, i)!=';'&&i<len; i++){
                            value=value+string_char_at(argument0, i);
                        }
                        repeat(real(value)){
                            string_new=string_new+chr(1);
                        }
                        break;
                    case 'c':
                        var value='';
                        for (var i=i+2; string_char_at(argument0, i)!=';'&&i<len; i++){
                            value=value+string_char_at(argument0, i);
                        }
                        show_text_t=real(value);
                        break;
                    case 'k':
                        escape_enabled=false;
                        i++;
                        break;
                    case 'p':
                        i=i+1;
                        string_new=string_new+Player.name;
                        break;
                    default:
                        break;
                }
                break;
            case '%':
                if (string_char_at(argument0, i-1)!='\'){
                    var term='';
                    for (var i=i+1; string_char_at(argument0, i)!=';'&&i<len; i++){
                        term=term+string_char_at(argument0, i);
                    }
                    var q=split(term, '=');
                    var key=deq(q);
                    var value=deq(q);
                    ds_queue_destroy(q);
                    switch (key){
                        case 'placeholder':
                            break;
                    }
                    i++;
                }
                break;
            default:
                string_new=string_new+c;
                break;
        }
    } else {
        string_new=string_new+c;
    }
}

return string_new;

/* Escape sequences:
 *  - \w<n>; waits for the specified number of frames (specifically by injecting invisible characters into the string, but don't tell anybody)
 *  - \c<n>; sets the text cursor position to the specified position (useless, but you can still do it if you want)
 *  - \k; disables escape sequence testing for the rest of the string.
 *  - \p; Player name
 */
