/// ModelTemplate add_model_template(name, base model, summary, [entity type], [index]);

with (instantiate(ModelTemplate)){
    name=argument[0];
    base=argument[1];
    summary=argument[2];
    var first=instantiate(ModelTemplateComponent);
    first.spawn_model[0]=base;
    switch (argument_count){
        case 5:
            first.spawn_model_index[0]=argument[4];
        case 4:
            first.spawn_object=argument[3];
            break;
    }
    ds_list_add(list, first);
    return id;
}
