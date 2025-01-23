with (other.id)
{
	if (instance_exists(other.baddieID) && state != states.tumble && state != states.knightpep && state != states.knightpepslopes && state != states.knightpepslopes)
	{
		audio_stop_sound(sfx_fireassdash)
		state = states.tumble;
		xscale = other.baddieID.image_xscale
		movespeed = 14
		vsp = 0
		sprite_index = spr_tumble
	}
}

