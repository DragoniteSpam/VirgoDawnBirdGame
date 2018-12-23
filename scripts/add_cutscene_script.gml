/// CutsceneScript add_cutscene_script(name, script, returntype, p1name, p1type, p2name, p2type, .. pNname, pNtype);

with (instantiate(CutsceneScript, argument[0])){
    script=argument[1];
    return_type=argument[2];
    for (var i=3; i<argument_count; i=i+2){
        ds_list_add(param_names, argument[i]);
        ds_list_add(param_types, abs(argument[i+1]));
        ds_list_add(param_required, sign(argument[i+1]));
    }
    return id;
}
