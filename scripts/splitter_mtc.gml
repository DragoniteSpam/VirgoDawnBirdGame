/// Entity splitter_mtc(component);
// Has to take the component parameter, can't use the with() structure,
// because this script still needs to be able to access x, y, z, etc.

var parent=id;

var spx=random_element_from_array(argument0.spawn_x);
var spy=random_element_from_array(argument0.spawn_y);
var spz=random_element_from_array(argument0.spawn_z);
var spxrot=random_element_from_array(argument0.spawn_xrot);
var spyrot=random_element_from_array(argument0.spawn_yrot);
var spzrot=random_element_from_array(argument0.spawn_zrot);

{   // X rotation
    var xasx=1;
    var yasx=0;
    var zasx=0;
    var xasy=0;
    var yasy=dcos(parent.xrot);
    var zasy=dsin(parent.xrot);
    var xasz=0;
    var yasz=-dsin(parent.xrot);
    var zasz=dcos(parent.xrot);
    var xx=spx;
    var yy=spy;
    var zz=spz;
    spx=xasx*xx+yasx*yy+zasx*zz;
    spy=xasy*xx+yasy*yy+zasy*zz;
    spz=xasz*xx+yasz*yy+zasz*zz;
}
{   // Y rotation
    var xasx=dcos(parent.yrot);
    var yasx=0;
    var zasx=-dsin(parent.yrot);
    var xasy=0;
    var yasy=1;
    var zasy=0;
    var xasz=dsin(parent.yrot);
    var yasz=0;
    var zasz=dcos(parent.yrot);
    var xx=spx;
    var yy=spy;
    var zz=spz;
    spx=xasx*xx+yasx*yy+zasx*zz;
    spy=xasy*xx+yasy*yy+zasy*zz;
    spz=xasz*xx+yasz*yy+zasz*zz;
}
{   // Z rotation
    var xasx=dcos(parent.direction);
    var yasx=dsin(parent.direction);
    var zasx=0;
    var xasy=-dsin(parent.direction);
    var yasy=dcos(parent.direction);
    var zasy=0;
    var xasz=0;
    var yasz=0;
    var zasz=1;
    var xx=spx;
    var yy=spy;
    var zz=spz;
    spx=xasx*xx+yasx*yy+zasx*zz;
    spy=xasy*xx+yasy*yy+zasy*zz;
    spz=xasz*xx+yasz*yy+zasz*zz;
}

with (add_entity(random_element_from_array(argument0.spawn_model),
        random_element_from_array(argument0.spawn_model_index),
        spx+parent.x, spy+parent.y, spz+parent.z, argument0.spawn_object)){
    xrot=spxrot+parent.xrot;
    yrot=spyrot+parent.yrot;
    direction=spzrot+parent.direction;
    xrotspeed=random_element_from_array(argument0.spawn_xrotspeed);
    yrotspeed=random_element_from_array(argument0.spawn_yrotspeed);
    zrotspeed=random_element_from_array(argument0.spawn_zrotspeed);
    if (is_array(argument0.spawn_cutscene_index)){
        cutscene_index=random_element_from_array(argument0.spawn_cutscene_index);
    } else {
        cutscene_index=argument0.spawn_cutscene_index;
    }
    if (argument0.spawn_name!=""){
        name=argument0.spawn_name;
    }
    text=argument0.spawn_text;
    return id;
}
