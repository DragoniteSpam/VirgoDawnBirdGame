/// Entity.draw_chest([texture]);

if (argument_count==0){
    draw_sphere(x, y, z, 16, tex_default)
} else {
    draw_sphere(x, y, z, 16, World.placeholder_red);
}
