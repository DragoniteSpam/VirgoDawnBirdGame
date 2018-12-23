var cut=argument0;

var fn=get_open_filename("Text files|*.txt", "");
if (file_exists(fn)){
    var f=file_text_open_read(fn);
    ds_list_clear(cut.code);
    while (!file_text_eof(f)){
        ds_list_add(cut.code, file_text_read_string(f));
        file_text_readln(f);
    }
    file_text_close(f);
    cut.uptodate=false;
    edit_cutscene_line_active=min(edit_cutscene_line_active, ds_list_size(cut.code)-1);
    edit_cutscene_line_pos=min(edit_cutscene_line_pos, string_length(cut.code[| edit_cutscene_line_active]));
}
