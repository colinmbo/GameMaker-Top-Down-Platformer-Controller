draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(4,4,82,74,false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(fnt_main);

draw_text(8,4,"STATE: " + string(current_state)
		+ "\nXVel: " + string(x_velocity)
		+ "\nYVel: " + string(y_velocity)
		+ "\nZVel: " + string(z_velocity)
		+ "\nDir: " + string(facing_direction));

draw_set_color(c_black);
draw_text(8, 150, "WASD: Move\nSpace: Jump\nM: Crouch");
