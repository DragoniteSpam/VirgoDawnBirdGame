/// void draw_bestiary_page(Bird);

var bird=all_birds[argument0];
if (measurements==Misc.imperial){
    var ht=string(mm_to_inches(bird.height))+" in.";
    var wt=string(grams_to_ounces(bird.weight/10)) +" oz.";
} else {
    var ht=string(bird.height/10)+" cm";
    var wt=string(bird.weight/10)+" g";
}

draw_set_halign(fa_center);
draw_set_font(Font20);
draw_text(W/2, H/4, bird.name);

draw_set_font(Font16)
draw_text(W/2, H/4-32, string(argument0+1)+"/"+string(array_length_1d(all_birds)));
draw_text(W/2, H/4+32, "Height: "+string(ht));
draw_text(W/2, H/4+48, "Weight: "+string(wt));

var lw=128;

draw_line_width(W/2-lw, H/4+64, W/2+lw, H/4+64, 2);

draw_set_valign(fa_top);
draw_text_ext(W/2, H/4+80, bird.summary, -1, background_get_width(b_book_ll)*1.5);

draw_line_width(W/2-lw, H/2+64, W/2+lw, H/2+64, 2);

if (background_exists(bird.picture)){
    var bkw=background_get_width(bird.picture);
    draw_background(bird.picture, (W-bkw)/2, H/2+96);
}
