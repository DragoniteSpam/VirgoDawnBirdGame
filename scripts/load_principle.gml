/// void load_principle(file);

// x, y and etype are read out in map_read
z=argument0[? "z"];

name=argument0[? "name"];
flag=argument0[? "flag"];
summary=argument0[? "summary"];
text=argument0[? "text"];
locked=argument0[? "locked"];

xrot=argument0[? "xrot"];
yrot=argument0[? "yrot"];
direction=argument0[? "direction"];

if (ds_map_exists(argument0, "npc_package")){
    npc_package=argument0[? "npc_package"];
}
npc_index=argument0[? "npc_index"];
if (npc_index!=NPCs.GenericInteractionMarker){
    register(id, npc_package, npc_index);
}
if (ds_map_exists(argument0, "cutscene_package")){
    cutscene_package=argument0[? "cutscene_package"];
}
cutscene_index=argument0[? "cutscene_index"];

// Oops?
xstart=argument0[? "xstart"];
ystart=argument0[? "ystart"];
zstart=argument0[? "zstart"];

// Um?
lerp_target_x=x;
lerp_target_y=y;
lerp_target_z=z;
