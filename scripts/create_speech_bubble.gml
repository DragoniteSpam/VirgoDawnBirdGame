/// HUDObjectText create_speech_bubble(Selectable, string, duration);

var text=instance_create(0, 0, HUDOverlayText);
text.owner=argument0;
text.text=argument1;
text.duration=argument2;

with (argument0.emote){
    instance_destroy();
}
argument0.emote=text;

return text;
