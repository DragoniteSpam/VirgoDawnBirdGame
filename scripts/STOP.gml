/// void STOP(audio index, [fade time?]);

if (argument_count>1){
    var t=argument[1];
} else {
    var t=0;
}

audio_sound_gain(argument[0], 0, t*1000);
var stopper=instantiate(SoundStopper);
stopper.sound=argument[0];
stopper.alarm[0]=t*60;
