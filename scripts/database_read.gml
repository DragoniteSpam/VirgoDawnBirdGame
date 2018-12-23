/// void INIT_MOD(ModPackage, buffer);

/*
 * Metadata
 */

var metadata_map=ds_map_create();
ds_map_read(metadata_map, buffer_read(argument1, buffer_string));

argument0.name=metadata_map[? "name"];
var quantity=metadata_map[? "quantity"];

ds_map_destroy(metadata_map);

/*
 * Stuff
 */

for (var i=0; i<quantity; i++){
    var map=ds_map_create();
    ds_map_read(map, buffer_read(argument1, buffer_string));
    var error_code=script_execute(database_readers[map[? "type"]], argument0, map);
    if ((error_code&DatabaseErrors.missing_mod)>0){
        show_message(get_text(Text.warningModMissing, argument0.name));
    }
    // If you come up with other error codes (which I'm sure you will - missing files, etc)
    // add them here in the same format
    ds_map_destroy(map);
}

/*
 * Close it off
 */

// there's nothing actually to do here but i just left the section here so it looks
// like the editor_save_main script
