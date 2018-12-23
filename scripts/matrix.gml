/// void matrix(x, y, z, xrot, yrot, direction, xscale, yscale, zscale);

matrix_set(matrix_world, matrix_multiply(matrix_build(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8), matrix_get(matrix_world)));
