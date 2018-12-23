/// reflexive int pause_cursor_handle_horizontal(x, y, x2, y2, n, max n, [cursor x, cursor y], [spacing]);

var x1=argument[0];
var y1=argument[1];
var x2=argument[2];
var y2=argument[3];
var n=argument[4];
var m=argument[5];
var spacing=20;
if (argument_count==6){
    var cx=x1+24;
    var cy=y1+32;
} else {
    var cx=argument[6];
    var cy=argument[7];
    if (argument_count==9){
        var spacing=argument[8];
    }
}

if (mouse_within_rectangle(x1, y1, x2, y2)){
    mouse_over_menu=true;
}

n=clamp((MOUSE_X-cx+1) div spacing, 0, m);

if (Controller.press_left){
    n=(n+m)%(m+1);
    pause_cursor_set(cx, cy, n, spacing);
    play_tone();
} else if (Controller.press_right){
    n=(n+1)%(m+1);
    pause_cursor_set(cx, cy, n, spacing);
    play_tone();
}

return n;
