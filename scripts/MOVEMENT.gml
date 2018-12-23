/// collisions and movement

/*
 *             /”\
 *            |\ /|
 *            |   |
 *            | ~ |
 *            |   |
 *         /’\|   |/’\  
 *     /”\|   |   |   | \
 *    |   |[@]|   |   |  \
 *    |   |   |   |   |   \
 *    | ~ ~  ~  ~ |    )
 *    |                   /
 *     \                 /
 *      \               /
 */

if (object!=noone){
    c_world_remove_object(object);
}
var m=false;
var c=1;
var rcx=x;
var rcy=y;
grounded=false;

script_execute(horizontal_collision_script);

stats_update_walked(xspeed, yspeed);

if (gravity_force||xspeed!=0||yspeed!=0||(instance_exists(Player)&&id==Player.id)){
    if (zspeed>0){          // going up
        if (c_raycast_world(x, y, z+22, x, y, z+32+zspeed*World.delta_time_seconds, COLLISION_PRIMARY)){
            z=c_hit_z()-32;
            zspeed=0;
        } else {
            z+=zspeed*World.delta_time_seconds;
        }
    } else if (zspeed<0){   // going down
        if (c_raycast_world(x, y, z+10, x, y, z+zspeed*World.delta_time_seconds, COLLISION_PRIMARY)){
            if (abs(zspeed)>stun_speed){
                combat_stun(x, y, z+16);
            }
            z=c_hit_z();
            zspeed=0;
            grounded=true;
            with (CollisionGetObject()){
                script_execute(land_script, other.id);
            }
            if (abs(zspeed)>0){
                grounded=false;
            }
        } else {
            z+=zspeed*World.delta_time_seconds;
        }
    }
    if (object_index==Player){
        var f=get_class(Player.id).factor_gravity
    } else {
        var f=1;
    }
    zspeed=ternary(soaring, -30, zspeed+c_gravity*f/**World.delta_time_seconds*/);
}

xrot=(xrot+xrotspeed*World.delta_time_seconds+360)%360;
yrot=(yrot+yrotspeed*World.delta_time_seconds+360)%360;
direction=(direction+zrotspeed*World.delta_time_seconds+360)%360;
if (movement_turn(xrot, xrottarget, xrotspeed)){
    xrot=xrottarget;
    xrottarget=-1;
    xrotspeed=0;
}
if (movement_turn(yrot, yrottarget, yrotspeed)){
    yrot=yrottarget;
    yrottarget=-1;
    yrotspeed=0;
}
if (movement_turn(direction, zrottarget, zrotspeed)){
    direction=zrottarget;
    zrottarget=-1;
    zrotspeed=0;
}

x=round_ext(x);
y=round_ext(y);
z=round_ext(z);

if (move_target!=noone){
    if (point_distance(x, y, move_target.x, move_target.y)<point_distance(0, 0, xspeed, yspeed)){
        move_target=noone;
        MOVE_STOP();
        with (World.cutscene){
            scr_continue(World.cutscene_index);
        }
    } else {
        var spd=point_distance(0, 0, xspeed, yspeed);
        direction=point_direction(x, y, move_target.x, move_target.y);
        xspeed=spd*dcos(direction);
        yspeed=-spd*dsin(direction);
    }
}

if (object!=noone){
    c_world_add_object(object);
    CollisionObjectTransform(id);
}

if (x==xprevious&&y==yprevious){
    is_animating=false;
} else {
    is_animating=true;
}

if (grounded){
    xspeed=xspeed*(1-GLOBAL_FRICTION)*(1-personal_friction);
    yspeed=yspeed*(1-GLOBAL_FRICTION)*(1-personal_friction);
    if (abs(xspeed)>0&&abs(yspeed)>0){
        if (c_raycast_world(x, y, z+1, x, y, z-1, COLLISION_PRIMARY)){
            below=CollisionGetObject();
            below_location_flag=below.location_flag;
        } else {
            below=noone;
            below_location_flag=LocationFlags.no;
        }
        if (below_location_flag==LocationFlags.water&&World.frames%20==0){
            create_water_ring(x, y, z, 0.25);
        }
    }
}

if (!locked&&z<-16){
    DIE(noone, DeathTypes.death_drown);
}
