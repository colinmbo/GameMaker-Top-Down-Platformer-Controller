x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));
jump_input = keyboard_check_pressed(vk_space);
crouch_input = keyboard_check(ord("M"));

z_velocity -= gravity_force;

if (z_position+z_velocity <= 0) {
	z_velocity = 0;
	z_position = 0;
}

if (current_state == STATES.IDLE) {
	
	input_direction = 0;
	x_velocity = 0;
	y_velocity = 0;
	
	if (x_input!=0 || y_input!=0) {
		input_direction = point_direction(0,0,x_input,y_input);
		if (abs(angle_difference(input_direction,facing_direction)) > 90) {
			current_state = STATES.TURNING;
		} else {
			facing_direction = input_direction;
			current_state = STATES.MOVING;
		}
	}
	
	if (jump_input) {
		current_state = STATES.JUMP;
	}
	
	if (crouch_input) {
		current_state = STATES.CROUCHING;
	}
}

if (current_state == STATES.MOVING) {
	
	input_direction = 0;
	x_velocity = 0;
	y_velocity = 0;
	
	if (x_input!=0 || y_input!=0) {
		input_direction = point_direction(0,0,x_input,y_input);
		if (abs(angle_difference(input_direction,facing_direction)) > 90) {
			current_state = STATES.TURNING;
		} else {
			facing_direction -= angle_difference(facing_direction,input_direction)*0.2;
			x_velocity = lengthdir_x(1.5, facing_direction);
			y_velocity = lengthdir_y(1.5, facing_direction);
		}
		
		if (jump_input) {
			current_state = STATES.JUMP;
		}
	
		if (crouch_input) {
			x_velocity = lengthdir_x(1.75, input_direction);
			y_velocity = lengthdir_y(1.75, input_direction);
			z_velocity = jump_force*0.75;
			current_state = STATES.DIVING;
		}
		
	} else {
		current_state = STATES.IDLE;
	}
	
}

if (current_state == STATES.TURNING) {
	facing_direction -= angle_difference(facing_direction,input_direction)*0.25;
	if (abs(angle_difference(input_direction,facing_direction)) < 5) {
		facing_direction = input_direction;
		current_state = STATES.MOVING;
	}
	
	if (jump_input) {
		current_state = STATES.HIGHJUMP;
	}
	
}

if (current_state == STATES.JUMP) {
	z_velocity = jump_force;
	current_state = STATES.INAIR
}

if (current_state == STATES.HIGHJUMP) {
	x_velocity = lengthdir_x(0.5, input_direction);
	y_velocity = lengthdir_y(0.5, input_direction);
	z_velocity = jump_force*1.5;
	current_state = STATES.INAIR;
}

if (current_state == STATES.INAIR) {
	
	if (x_input!=0 || y_input!=0) {
		input_direction = point_direction(0,0,x_input,y_input);
		if (abs(angle_difference(input_direction,facing_direction)) <= 90) {
			facing_direction -= angle_difference(facing_direction,input_direction)*0.1;
		} 
		
		x_velocity += lengthdir_x(0.02, input_direction);
		y_velocity += lengthdir_y(0.02, input_direction);
		
	}
	
	if (keyboard_check_pressed(ord("M"))) {
		x_velocity = lengthdir_x(2.5, facing_direction);
		y_velocity = lengthdir_y(2.5, facing_direction);
		z_velocity = jump_force*0.25;
		current_state = STATES.DIVING;
	}
	
	if (z_position+z_velocity <= 0) {
		z_velocity = 0;
		z_position = 0;
		current_state = STATES.IDLE;
	}
	
}

if (current_state == STATES.CROUCHING) {
	
	input_direction = 0;
	x_velocity = 0;
	y_velocity = 0;
	
	if (x_input!=0 || y_input!=0) {
		input_direction = point_direction(0,0,x_input,y_input);
		facing_direction -= angle_difference(facing_direction,input_direction)*0.05;
		x_velocity = lengthdir_x(0.5, input_direction);
		y_velocity = lengthdir_y(0.5, input_direction);
	}
	
	if (jump_input) {
		x_velocity = lengthdir_x(-0.25, facing_direction);
		y_velocity = lengthdir_y(-0.25, facing_direction);
		z_velocity = jump_force*1.5;
		current_state = STATES.INAIR
	}
	
	if (!crouch_input) {
		z_velocity = jump_force*0.25;
		current_state = STATES.INAIR;
	}
}

if (current_state == STATES.DIVING) {
	
	if (x_input!=0 || y_input!=0) {
		input_direction = point_direction(0,0,x_input,y_input);
		facing_direction -= angle_difference(facing_direction,point_direction(0,0,x_velocity,y_velocity))*0.1;
		x_velocity += lengthdir_x(0.02, input_direction);
		y_velocity += lengthdir_y(0.02, input_direction);
		
	}
	
	if (z_position+z_velocity <= 0) {
		z_velocity = 0;
		z_position = 0;
		current_state = STATES.SLIDING;
	}
	
}

if (current_state == STATES.SLIDING) {
	
	x_velocity *= 0.95;
	y_velocity *= 0.95;
	
	if (abs(x_velocity) < 0.05 && abs(y_velocity) < 0.05) {
		x_velocity = 0;
		y_velocity = 0;
		current_state = STATES.CROUCHING;
	}
	
	if (keyboard_check_pressed(ord("M"))) {
		x_velocity = lengthdir_x(1.6, facing_direction);
		y_velocity = lengthdir_y(1.6, facing_direction);
		z_velocity = jump_force*0.5;
		current_state = STATES.DIVING;
	}
	
	if (jump_input) {
		
		x_velocity = lengthdir_x(2.25, facing_direction);
		y_velocity = lengthdir_y(2.25, facing_direction);
		z_velocity = jump_force;
		current_state = STATES.INAIR;
		
		/* //FOR DIVE ESCAPE
		if (x_input!=0 || y_input!=0) {
			input_direction = point_direction(0,0,x_input,y_input);
			if (abs(angle_difference(input_direction,facing_direction)) > 90) {
				x_velocity = lengthdir_x(-0.25, facing_direction);
				y_velocity = lengthdir_y(-0.25, facing_direction);
				z_velocity = jump_force*1;
				current_state = STATES.INAIR
			}
		}*/
		
	}
}

x_position += x_velocity;
y_position += y_velocity;
z_position += z_velocity;