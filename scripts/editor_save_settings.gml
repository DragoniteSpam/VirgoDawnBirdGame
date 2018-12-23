ini_open(".\EditorSettings.ini");
ini_write_real("blah", "edit_distance", World.edit_distance);
ini_write_real("blah", "edit_snap", World.edit_snap);
ini_write_real("blah", "edit_generation_quantity", World.edit_generation_quantity);
ini_close();
