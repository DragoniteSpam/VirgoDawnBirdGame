/// double movement_get_pitch(default pitch);

return clamp(argument0+Controller.rs_y*sensitivity/(SENSITIVITY_CONSTANT/4), -88, 88);
