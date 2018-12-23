/// boolean hit_flag_accept(x, y);
/**
 * Returns true if the calling entity is hit from a valid direction
 * (x, y), false otherwise
 */

var four_direction=(round((point_direction(x, y, argument0, argument1)-direction)/90)+4)%4;

return (hit_flags&(1<<four_direction))>0;
