function scr_player_shoryuken()
{
	hsp = xscale * movespeed
	move = key_left + key_right
	if (move != 0)
		xscale = move
	if (floor(image_index) == (image_number - 1))
		image_index = (image_number - 1)
	if (key_slap2 && (!((shotgunAnim == 1 && key_up))))
	{
		suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
		state = states.handstandjump
		image_index = 0
		sprite_index = spr_suplexdashjumpstart
		if (character == "P")
			movespeed = 6
		else
			movespeed = 4
	}	
	if (grounded && vsp > 0)
	{
		landAnim = true
		state = states.normal
	}
	image_speed = 0.35

}