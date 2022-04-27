draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position),1,1,facing_direction,c_black,1);
draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position),1,1,facing_direction,c_ltgray,1);

if (current_state != STATES.CROUCHING && current_state != STATES.DIVING && current_state != STATES.SLIDING) {
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-1,1,1,facing_direction,c_ltgray,1);
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-2,1,1,facing_direction,c_ltgray,1);
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-3,1,1,facing_direction,c_ltgray,1);
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-4,1,1,facing_direction,c_ltgray,1);
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-5,1,1,facing_direction,c_ltgray,1);
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-6,1,1,facing_direction,c_ltgray,1);
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-7,1,1,facing_direction,c_white,1);
} else {
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-1,1,1,facing_direction,c_ltgray,1);
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-2,1,1,facing_direction,c_ltgray,1);
	draw_sprite_ext(sprite_index,image_index,round(x_position),round(y_position-z_position)-3,1,1,facing_direction,c_white,1);
}