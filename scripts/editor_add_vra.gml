var fn=get_open_filename("Virgo Resource Archive files (*.vra)|*.vra", "they actually only contain 3D models but I decided to call them resource archives anyway");

if (file_exists(fn)){
    var name=filename_name(fn);
    file_copy(fn, MOD_DIRECTORY+'\'+name);
    const_model_load_vra(fn);
    show_message("Loaded "+fn+" into the game. It is ready to be used by a mod!");
}
