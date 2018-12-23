var keyframe_current=stages[| floor(position)];
var keyframe_next=stages[| ceil(position)];
var f=frac(position);
var final_stage=ds_list_size(stages)-1;

var begin_xx=keyframe_current.x;
var begin_yy=keyframe_current.y;
var begin_zz=keyframe_current.z;

var end_xx=keyframe_next.x;
var end_yy=keyframe_next.y;
var end_zz=keyframe_next.z;

if (!absolute){
    begin_xx=begin_xx+x;
    begin_yy=begin_yy+y;
    begin_zz=begin_zz+z;
    
    end_xx=end_xx+x;
    end_yy=end_yy+y;
    end_zz=end_zz+z;
}

switch (style){
    case InterpolationStyles.smooth:
        x=begin_xx+(end_xx-begin_xx)*f;
        y=begin_yy+(end_yy-begin_yy)*f;
        z=begin_zz+(end_zz-begin_zz)*f;
        break;
    case InterpolationStyles.interpolate:
        // Honestly this isn't my favorite movement style but I figured I might as well add it anyway.
        var fraction=action_speed*World.delta_time_seconds;
        x=lerp(x, end_xx, fraction);
        y=lerp(y, end_yy, fraction);
        z=lerp(z, end_zz, fraction);
        break;
    case InterpolationStyles.bezier:
        var fraction=f*f*(3-2*f);
        x=begin_xx+(end_xx-begin_xx)*fraction;
        y=begin_yy+(end_yy-begin_yy)*fraction;
        z=begin_zz+(end_zz-begin_zz)*fraction;
        break;
}

position=clamp(position+action_speed*World.delta_time_seconds, 0, final_stage);

if (position==final_stage&&action_speed>0){
    switch (endaction){
        case MobileEndActions.stop:
            action_speed=0;
            break;
        case MobileEndActions.restart:
            position=0;
            break;
        case MobileEndActions.reverse:
            action_speed=-action_speed;
            break;
    }
} else if (position==0&&action_speed<0){
    switch (endaction){
        case MobileEndActions.stop:
            action_speed=0;
            break;
        case MobileEndActions.restart:
            position=final_stage;
            break;
        case MobileEndActions.reverse:
            action_speed=-action_speed;
            break;
    }
}

delta_x=(x-xprevious);
delta_y=(y-yprevious);
delta_z=(z-zprevious);

CollisionObjectTransform(id);
