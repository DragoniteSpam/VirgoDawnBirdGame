var dir_start=direction;

direction=(direction+360*action_speed*World.delta_time_seconds+360)%360;
action_speed=clamp(action_speed+action_acceleration*World.delta_time_seconds, -action_speed_max, action_speed_max);

delta_theta=direction-dir_start;

CollisionObjectTransform(id);
