#region
window_set_size(room_width*3, room_height*3);
window_center();
#endregion

x_velocity = 0;
y_velocity = 0;
z_velocity = 0;

x_input = 0;
y_input = 0;
input_direction = 270;
jump_input = false;
crouch_input = false;

facing_direction = input_direction;

x_position = x;
y_position = y;
z_position = 0;

gravity_force = 0.1;
jump_force = 2.5;

enum STATES {
	IDLE,
	MOVING,
	JUMP,
	HIGHJUMP,
	INAIR,
	TURNING,
	CROUCHING,
	DIVING,
	SLIDING
}

current_state = STATES.IDLE;