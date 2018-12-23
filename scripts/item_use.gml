/// value item_use(Item);

return script_execute(ds_map_find_value(all_mod_packages, argument0.item_effect_package).my_item_effects[argument0.item_effect].script, argument0);
