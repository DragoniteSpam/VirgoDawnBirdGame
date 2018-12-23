/// HUDObjectEmote create_emote(Selectable, index);

var emote=instance_create(0, 0, HUDOverlayEmote);
emote.owner=argument0;
emote.sprite_index=argument1;

with (argument0.emote){
    instance_destroy();
}
argument0.emote=emote;

return emote;
