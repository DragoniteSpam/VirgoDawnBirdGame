/// void hud_overlay_emote();

if (owner==noone){
    return false;
}

var array=WorldTo2D(owner.x, owner.y, owner.z+32, Camera.x, Camera.y, Camera.z);

draw_sprite_ext(spr_emote, sprite_index, array[vec3.xx], array[vec3.yy], 4, 4, 0, c_white, 1);

if (t>60){
    instance_destroy();
}

t++;

return true;
