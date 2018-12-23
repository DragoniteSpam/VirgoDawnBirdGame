/// void editor_object_template_split(EntityTemplate);

if (instanceof(argument0, EntityTemplate)){
    var es=World.edit_snap;
    World.edit_snap=0;
    with (argument0){
        var first=noone;
        for (var i=0; i<ds_list_size(template.list); i++){
            var component=template.list[| i];
            if (irandom(100)<=component.spawn_chance){
                var new=editor_apply_transformation(script_execute(component.splitter, component));
                if (first==noone){
                    first=new;
                }
            }
        }
        remove_entity(id);
    }
    World.edit_snap=es;
    World.selected=noone;
    World.ray_object=noone;
}
