/// boolean editor_cutscene_compile_cutscene(cut);

with (Compiler){
    var cut=argument0;
    ds_stack_clear(ifs);

    ds_list_clear(cut.line_status);
    
    for (var i=0; i<ds_list_size(cut.compiled); i++){
        instance_activate_object(cut.compiled[| i]);
        with (cut.compiled[| i]){
            instance_destroy();
        }
    }
    
    ds_list_clear(cut.compiled);
    
    for (var i=0; i<ds_list_size(cut.code); i++){
        var line=cut.code[| i];
        var result=compile(string_strip(line), cut, i);
        if (result==noone){
            return false;
        }
    }
    if (ds_stack_size(ifs)>0){
        show_message("Unclosed if statement found! Compiled failed.");
        return false;
    }
    return true;
}
