/// void class_hud_eagle();

draw_set_halign(fa_center);
draw_set_font(Font16);
draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-256, "Soar");
draw_input(Controller.gp_bind_x, Controller.mk_bind_x, W-120, H-160, "Smash");
draw_input(Controller.gp_bind_a, Controller.mk_bind_a_a, W-120, H-64, "Fly");
