/// void PLAY(audio index, [loop?], [fade in time, seconds]);

var s=argument[0];

if (argument_count>1){
    var loop=argument[1];
} else {
    var loop=false;
}

if (argument_count>2){
    var t=argument[2];
} else {
    var t=0;
}

with (SoundStopper){
    if (sound==argument[0]){
        instance_destroy();
    }
}

audio_sound_gain(s, 0, 0);
audio_sound_gain(s, 1, t*1000);

return audio_play_sound(s, 1, loop);
