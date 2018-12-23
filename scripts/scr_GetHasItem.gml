/// boolean scr_GetHasItem(ArgSet);
/*  In variable register:
    0. Item index
*/

var catch=argument0;

World.keep_going=true;
var str=string_replace(World.vars[0], "Items.", "");
var item=get_item_from_name(World.cutscene_mod_package, str, 0);

return (HasItem(World.cutscene_mod_package, item)!=noone);
