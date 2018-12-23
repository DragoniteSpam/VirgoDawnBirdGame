/// create_heal_blob(x, y, z, direction, pitch, strength, caster);

// Unused parameters

var pitch=argument4;
var caster=argument6;

// Actual healing

hp_current=min(hp_current+floor(get_attack_stat(id, CombatTypes.heal)+sqrt(argument5)), get_max_hp(exp_hp));

// Effects

var r=16;
var height=24;

repeat(16+render_distance div 64){
    var dir=argument3+random_range(-45, 45);
    var xx=r*dcos(dir);
    var yy=-r*dsin(dir);
    var zz=height+random_range(-12, 12);
    var particle=instance_create(argument0+xx, argument1+yy, ParticleSpriteFace);
    particle.z=argument2+zz;
//    particle.zgravity=c_gravity;
    particle.zspeed=-c_gravity/2;
    particle.scale=0.2;
    particle.scalefactor=0.9;
    particle.sprite_index=b_heal;
    particle.timer=room_speed/2;
}
