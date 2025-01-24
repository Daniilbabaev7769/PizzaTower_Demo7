if (other.image_index == 0)
{
	instance_create(x, y, obj_parryeffect)
	scr_soundeffect(sfx_pephurt);
	instance_create(x, y, obj_bangeffect)
	sprite_index = spr_player_machfreefall
	with (obj_camera)
	{
		shake_mag = 14
		shake_mag_acc = (14 / room_speed)
	}
	drop = 1
	vsp = -20
	hsp = 8
	other.image_index = 1
}

