/// ds_queue split(String s, [string delimiter]);
// Will only recognize double-quotation mark for block quotes, not single-quotation marks.
// multiple character delimiters will check for each individual character, split ("one,two three", ", ") -> [one, two, three]

// This version will not add empty strings to the queue.

var base=argument[0];                           // Base string
if (argument_count==1){
    var delimiter=",";
} else {
    var delimiter=argument[1];                  // Character to split around, default a comma
}
var queue=ds_queue_create();                    // Contains the individual words
var tn="";                                      // temporary substring

base=base+string_char_at(delimiter, 1);         // lazy way of ensuring the last term in the list does not get skipped

for (var i=1; i<=string_length(base); i++){     // for each character in the string:
    var c=string_char_at(base, i);              //      Current character
    var previous=string_char_at(base, i-1);     //      Previous character
    var is_break_char=false;
    for (var j=1; j<=string_length(delimiter); j++){
        if (string_char_at(delimiter, j)==c&&previous!="\"&&string_length(tn)>0){
            ds_queue_enqueue(queue, tn);
            tn="";
            is_break_char=true;
            break;
        }
    }
    if (!is_break_char){
        tn=tn+c;
    }
}

if (ds_queue_size(queue)==1&&ds_queue_head(queue)==""){
    ds_queue_clear(queue);
}

return queue;

