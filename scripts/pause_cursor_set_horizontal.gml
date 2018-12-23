/// void pause_cursor_set(x, y, n, [spacing]);

if (argument_count==4){
    var spacing=argument[3];
} else {
    var spacing=20;
}

window_mouse_set_ext(argument[0]+spacing*argument[2], argument[1]);
