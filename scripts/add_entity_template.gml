/// Entity add_entity_template(model enum, x, y, z);

with (instantiate(EntityTemplate)){
    template=all_model_templates[argument0];
    model=template.base;
    x=argument1;
    y=argument2;
    z=argument3;
    script_execute(collision_adder, id);
    return id;
}
