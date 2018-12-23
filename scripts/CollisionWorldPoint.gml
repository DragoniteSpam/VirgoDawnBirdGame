/// boolean CollisionWorldPoint(x, y, z);

var layer=lm.collision_list[| argument2 div GRID_CELL_WIDTH];

return layer[# argument0 div GRID_CELL_WIDTH, argument1 div GRID_CELL_WIDTH];
