/// void Entity.draw_model_bird_hawk([texture]);

var xx=x;
var yy=y;
var zz=z;
var r=32*CELL_SIZE;

switch (game_current_month){
    case Months.December:
    case Months.January:
    case Months.February:
        return false;
        break;
    case Months.September:
    case Months.October:
    case Months.November:
        z=r*dsin(World.frames/3600)/16;
        y=r*dcos(World.frames/3600)+r/4;
        break;
    case Months.March:
    case Months.April:
    case Months.May:
        z=r*dsin(World.frames/3600)/16;
        y=r*dcos(World.frames/3600)+r/4;
        break;
    case Months.June:
    case Months.July:
    case Months.August:
        x=r*dsin(World.frames/3600)+r/4;
        z=r*dcos(World.frames/3600)/16;
        break;
}

if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}

draw_model(t);

x=xx;
y=yy;
z=zz;

if (mode==GameModes.edit_object){
    draw_model(t, false, BASE_ASSET, World.mdl_npc, 0);
}

return true;
