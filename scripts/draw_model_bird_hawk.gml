/// void Entity.draw_model_bird_hawk([texture]);

var xx=x;
var yy=y;

x=xx+BIRD_HAWK_RADIUS*dcos((World.frames+id)/4);
y=yy-BIRD_HAWK_RADIUS*dsin((World.frames+id)/4);
direction=(World.frames+id)/4;

if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}

draw_model(t);

x=xx;
y=yy;

if (mode==GameModes.edit_object){
    draw_model(t, false, BASE_ASSET, World.mdl_npc, 0);
}
