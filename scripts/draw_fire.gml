/// void EventCard.draw_fire([texture,] [x, y, z]);

var tex=tex_default;
if (argument_count>0){
    var tex=argument[0];
    if (argument_count>1){
        var xx=argument[1];
        var yy=argument[2];
        var zz=argument[3];
    } else {
        var xx=x;
        var yy=y;
        var zz=z;
    }
} else {
    var xx=x;
    var yy=y;
    var zz=z;
}

if (lit){
    var scl=scale;
    scale=scale+0.25+0.25*sin(3*World.frames);
    xx+=irandom_range(-scale, scale);
    yy+=irandom_range(-scale, scale);
    zz+=irandom(scale);
    var wx=lm.intensity/8*dcos(weather.direction);
    var wy=-lm.intensity/8*dsin(weather.direction);
    repeat((global_particle_density div 128)+density){
        (create_particle(RANDOM_PARTICLE_WARM, xx, yy, zz, wx-60/8, wy-60/8, 30, wx+60/8, wy+60/8, 120, 1, 300, 0, 0, 0.05)).timer=irandom(10)+10;
        if (!audio_is_playing(se_fire)){
            audio_play_sound(se_fire, 1, false);
            if (instance_exists(Player)){
                audio_sound_gain(se_fire, object_distance_3d(id, Player), 0);
            }
        }
    }
    if (irandom(2)==0){
        create_particle(RANDOM_PARTICLE_GRAYSCALE, xx, yy, zz+scale/2, wx-60/8, wy-60/8, 30, wx+60/8, wy+60/8, 120, 1, 300, 0, 0, 0.05);
    }
    scale=scl;
    add_to_light();
}

draw_model(tex);
