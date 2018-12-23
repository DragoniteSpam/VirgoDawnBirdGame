var name=string_lettersdigits(get_string("Internal name of the new mod? This can't be changed once you set it, so think carefully. (Only letters and digits are valid.)", "Mod"+string(array_length_1d(all_mod_packages_array))));
if (ds_map_exists(all_mod_packages, name)){
    show_message("A mod with that name is already in the game. Please choose a different name.");
} else {
    add_mod_package(name, '', true);
    World.mod_internal_name=name;
}
