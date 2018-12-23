var cut=argument0;

var fn=get_save_filename("Text files|*.txt", "");

if (fn!=''){
    var f=file_text_open_write(fn);
    for (var i=0; i<ds_list_size(cut.code); i++){
        file_text_write_string(f, cut.code[| i]);
        file_text_writeln(f);
    }
    file_text_close(f);
}
