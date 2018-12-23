/* For editing the Settings menu, some things must be added:
 *   - Section 0: extend "h" so that the background will nicely contain the
 *      extra lines. (This is also important for pause_cursor_handle.)
 *   - Section 1: add another line of text. Make sure the Y coordinate is
 *      correct. The position of the "Back" option is handled automatically.
 *   - Section 2: add another line of text for displaying the value of the
 *      option. Again, make sure the Y coordinate is correct. Optional.
 *   - Section 3: nothing
 *   - Section 4: extend the upper bound of pause_cursor_handle. It should be
 *      the same as the largest case in the switch in Section 5.
 *   - Section 5: handle input for when different options are selected. Make
 *      sure to update the case value for the "back" option.
 *   - Other stuff: the variable name dealing with the value of the setting
 *      probably be declared a global variable in the Settings object. It also
 *      should be a primitive data type and not an instance ID, to make saving
 *      and loading it from a file much easier.
 */

// Section 0

var go_back=get_release_b()||get_release_a();

var h=112;
var xx=W/3;
var xx2=xx+W/3;
var yy=H/3;
draw_rectangle_texture_auto(xx, yy, xx2, yy+h, true);
draw_set_color(graphics_text_color);
draw_set_font(Font16);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text(xx+44, yy+32, "Dowsing machine has been");
if (show_hidden_items){
    draw_text(xx+44, yy+64, "turned on.");
} else {
    draw_text(xx+44, yy+64, "turned off.");
}

if (go_back){
    instance_destroy();
    World.pause_is_hidden=false;
}
