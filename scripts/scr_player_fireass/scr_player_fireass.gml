function scr_player_fireass() {
	image_speed = 0.35
	if place_meeting((x + hsp), y, obj_solid)
		image_xscale *= -1
	if (sprite_index == spr_fireass)
	{
		if (floor(image_index) == (image_number - 1))
		{
			with (instance_create(x, (y + 25), obj_balloonpop))
				sprite_index = spr_shotgunimpact
		}
		move = (key_left + key_right)
		if (move != 0)
			xscale = move
		hsp = (move * movespeed)
		movespeed = 4
		if place_meeting(x, (y + 1), obj_haystack)
			vsp = -20
		else if (grounded && vsp > 0)
		{
			movespeed = 6
			sprite_index = spr_fireassground
			image_index = 0
		}
		if key_slap2
		{
			audio_stop_sound(sfx_scream5)
			audio_play_sound(sfx_fireassdash, 1, true)
			sprite_index = spr_player_fireassdash
			image_index = 0
			movespeed = 12
			vsp = -4
		}	
	}
	if (sprite_index == spr_fireassground)
	{
		hsp = (xscale * movespeed)
		if (movespeed > 0)
			movespeed -= 0.25
		if (floor(image_index) == (image_number - 1))
		{
			movespeed = 0
			landAnim = 0
			alarm[5] = 2
			alarm[7] = 60
			hurted = 1
			state = states.normal;
			sprite_index = spr_idle
			image_index = 0
		}
	}
	if (sprite_index == spr_fireassend)
	{
		if (floor(image_index) == (image_number - 1))
		{
			movespeed = 0
			landAnim = 0
			alarm[5] = 2
			alarm[7] = 60
			hurted = 1
			state = states.normal;
			sprite_index = spr_idle
			image_index = 0
		}
	}
	if (sprite_index == spr_player_fireassdash || sprite_index == spr_player_fireassdashfall)
	{
		hsp = (xscale * movespeed)
		move = (key_left + key_right)
		if (floor(image_index) == (image_number - 1))
			sprite_index = spr_player_fireassdashfall
		if (place_meeting(x + xscale, y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		{
			scr_soundeffect(sfx_bumpwall)
			xscale *= -1
			instance_create((x + 30), y, obj_bangeffect)
			instance_create((x - 10), (y + 10), obj_bumpeffect)
			movespeed = 12
		}
		if (grounded && vsp > 0)
		{
			movespeed = 6
			sprite_index = spr_fireassground
			image_index = 0
			audio_stop_sound(sfx_fireassdash)
		}
		
	}
}
