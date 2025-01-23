if (place_meeting(x, (y - 1), obj_player1) && obj_player1.state != states.gameover)
{
	obj_player1.state = states.fireass
	obj_player1.image_index = 0
	obj_player1.vsp = -25
	obj_player1.sprite_index = obj_player1.spr_fireass
	scr_soundeffect(sfx_scream5)
	audio_stop_sound(sfx_fireassdash)
	if (global.fireassdashkeylearned == 0)
	{
		with (obj_tv)
		{
			message = string_hash_to_newline("PRESS " + scr_keyname(global.key_slap) + " TO DO DASH!")
			alarm[0] = 200
			showtext = 1
		}
	}
	ini_open("saveData.ini")
	if (global.fireassdashkeylearned != 1)
		global.fireassdashkeylearned = ini_write_string("KeyLearned", "fireassdashkey", 1)
	ini_close()	
}
if (place_meeting(x, (y - 1), obj_player2) && obj_player2.state != states.gameover)
{
	obj_player2.state = states.fireass
	obj_player2.image_index = 0
	obj_player2.vsp = -25
	obj_player2.sprite_index = obj_player2.spr_fireass
	scr_soundeffect(sfx_scream5)
}

