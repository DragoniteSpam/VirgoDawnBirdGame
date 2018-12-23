/// database_read_models(ModPackage, map);

var n=argument1[? argument0.name+"_n"];

argument0.my_items=array_add(n, noone);

for (var i=0; i<n; i++){
    var base_string="item_"+argument0.name+"_"+string(i)+"_";
    with (instantiate(Item)){
        internal_name=argument1[? base_string+"internal_name"];
        name=argument1[? base_string+"name"];
        flag=argument1[? base_string+"flag"];
        summary=argument1[? base_string+"summary"];
        
        index=argument1[? base_string+"index"];
        plural=argument1[? base_string+"plural"];
        pocket=argument1[? base_string+"pocket"];
        value=argument1[? base_string+"value"];
        tmin=argument1[? base_string+"tmin"];
        tmax=argument1[? base_string+"tmax"];
        item_effect=argument1[? base_string+"item_effect"];
        item_power=argument1[? base_string+"item_power"];
        weapon_graphic=argument1[? base_string+"weapon_graphic"];
        weapon_effect=argument1[? base_string+"weapon_effect"];
        consume_on_use=argument1[? base_string+"consume_on_use"];
        autofire=argument1[? base_string+"autofire"];
        weapon_anim_steps=argument1[? base_string+"weapon_anim_steps"];
        
        // forgot to include these the first time lol
        if (ds_map_exists(argument1, base_string+"model_package")){
            model_package=argument1[? base_string+"model_package"];
        }
        if (ds_map_exists(argument1, base_string+"model")){
            model=argument1[? base_string+"model"];
        }
        
        argument0.my_items[i]=id;
    }
}
