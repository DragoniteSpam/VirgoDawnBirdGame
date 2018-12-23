var fn=get_save_filename("Binary files|*.bin", World.lang_code[World.language]+".bin");

if (fn!=""){
    var buffer=buffer_create(power(2, 20), buffer_grow, 1);
    for (var i=0; i<Text.FINAL; i++){
        buffer_write(buffer, buffer_string, game_text[i, 0]);
        buffer_write(buffer, buffer_string, game_text[i, 1]);
    }
    buffer_save_ext(buffer, fn, 0, buffer_tell(buffer));
    buffer_delete(buffer);
}
