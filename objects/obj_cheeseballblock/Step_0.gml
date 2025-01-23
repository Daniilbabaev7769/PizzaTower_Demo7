if ((place_meeting((x + 1), y, obj_player) or place_meeting((x - 1), y, obj_player)) && obj_player.state == states.cheeseball)
	instance_destroy()

