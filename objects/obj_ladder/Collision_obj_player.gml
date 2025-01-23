with (obj_player1)
{
	if (key_up && place_meeting(x, y, other.id) && ladderbuffer == 0 && (state == states.normal or state == states.mach2 or state == states.mach3 or state == states.mach1 or state == states.shotgunjump or state == states.jump or state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
	{
		mach2 = 0
		state = states.ladder
		x = (other.x + 16)
		y = floor(y)
		if ((y % 2) == 1)
			y -= 1
	}
}
if instance_exists(obj_player2)
{
	with (obj_player2)
	{
		if (key_up && place_meeting(x, y, other.id) && ladderbuffer == 0 && (state == states.normal or state == states.mach2 or state == states.mach3 or state == states.mach1 or state == states.shotgunjump or state == states.jump or state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
		{
			mach2 = 0
			state = states.ladder
			x = (other.x + 16)
			y = floor(y)
			if ((y % 2) == 1)
				y -= 1
		}
	}
}

