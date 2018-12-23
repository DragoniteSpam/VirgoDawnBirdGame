var p=create_particle(argument0[| 1].value, x+irandom(16)-8, y+irandom(16)-8, z, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, argument0[| 0].value);
p.timer=eval(argument0[| 2].value);
p.texture=tex_default;

World.keep_going=true;
