function scr_player_jump() {
	if (momemtum == 0)
		hsp = (move * movespeed)
	else
		hsp = (xscale * movespeed)
	if (dir != xscale)
	{
		dir = xscale
		movespeed = 2
		facehurt = 0
	}
	if (move != xscale)
		movespeed = 2
	move = (key_left + key_right)
	if (movespeed == 0)
		momemtum = 0
	if scr_solid((x + hsp), y)
	{
		movespeed = 0
		mach2 = 0
	}
	if (move != 0 && movespeed < 6)
		movespeed += 0.5
	if (movespeed > 6)
		movespeed -= 0.1
	if ((scr_solid((x + 1), y) && move == 1) or (scr_solid((x - 1), y) && move == -1))
		movespeed = 0
	if (dir != xscale)
		dir = xscale
	landAnim = 1
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 10
		jumpstop = 1
	}
	if (ladderbuffer > 0)
		ladderbuffer--
	if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
	{
		vsp = grav
		jumpstop = 1
	}
	if (grounded && input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0 && (!((sprite_index == spr_facestomp or sprite_index == spr_freefall))))
	{
		scr_soundeffect(sfx_jump);
		if (move == 0)
			sprite_index = spr_jump
		if (move != 0)
			sprite_index = spr_player_jump2
		if (shotgunAnim == 1)
			sprite_index = spr_shotgunjump
		instance_create(x, y, obj_highjumpcloud2)
		stompAnim = 0
		vsp = -11
		state = states.jump
		jumpAnim = 1
		jumpstop = 0
		image_index = 0
		movespeed = 2
		freefallstart = 0
	}
	if (grounded && vsp > 0 && (!key_attack))
	{
		scr_soundeffect(sfx_step);
		if key_attack
			landAnim = 0
		input_buffer_secondjump = 0
		state = states.normal;
		jumpAnim = 1
		jumpstop = 0
		image_index = 0
		freefallstart = 0
		movespeed = 2
	}
	if key_jump
		input_buffer_jump = 0
	if (vsp > 5)
		fallinganimation++
	if (fallinganimation >= 40 && fallinganimation < 80)
		sprite_index = spr_facestomp
	if (fallinganimation >= 80)
		sprite_index = spr_freefall
	if (stompAnim == 0)
	{
		if (jumpAnim == 1)
		{
			if (floor(image_index) == (image_number - 1))
				jumpAnim = 0
		}
		if (jumpAnim == 0)
		{
			if (sprite_index == spr_airdash1)
				sprite_index = spr_airdash2
			if (sprite_index == spr_shotgunjump)
				sprite_index = spr_shotgunfall
			if (sprite_index == spr_jump)
				sprite_index = spr_fall
			if (sprite_index == spr_player_backflip)
				sprite_index = spr_fall
			if (sprite_index == spr_player_jump2)
				sprite_index = spr_player_fall2
			if (sprite_index == spr_player_Sjumpstart)
				sprite_index = spr_player_Sjump
			if (sprite_index == spr_player_shotgunjump1)
				sprite_index = spr_player_shotgunjump2
			if (sprite_index == spr_shotgun_shootair)
				sprite_index = spr_shotgun_fall
		}
	}
	if (stompAnim == 1)
	{
		if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
			sprite_index = spr_stomp
	}
	if key_down2
	{
		if (shotgunAnim == 0)
		{
			image_index = 0
			state = states.freefallprep
			sprite_index = spr_bodyslamstart
			if (character == "P")
				vsp = -5
			else
				vsp = -7
		}
		else
		{
			scr_soundeffect(sfx_killingblow);
			image_index = 0
			state = states.freefallprep
			sprite_index = spr_shotgunjump1
			vsp = -5
			if (character == "P")
			{
				with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
				{
					sprite_index = sprite10391
					spdh = -10
					spd = 0
				}
				with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
				{
					sprite_index = sprite10391
					spdh = -10
					spd = 5
				}
				with (instance_create((x + (xscale * 30)), (y + 60), obj_shotgunbullet))
				{
					sprite_index = sprite10391
					spdh = -10
					spd = -5
				}
			}
		}
	}
	if (move != 0)
		xscale = move
	image_speed = 0.35
	if (grounded && (sprite_index == spr_facestomp or sprite_index == spr_freefall))
	{
		with (obj_baddie)
		{
			if point_in_rectangle(x, y, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), (__view_get(e__VW.XView, 0) + __view_get(e__VW.WView, 0)), (__view_get(e__VW.YView, 0) + __view_get(e__VW.HView, 0)))
			{
				vsp = -7
				hsp = 0
			}
		}
		with (obj_camera)
		{
			shake_mag = 10
			shake_mag_acc = (30 / room_speed)
		}
		scr_soundeffect(sfx_groundpound);
		image_index = 0
		sprite_index = spr_bodyslamland
		state = states.freefallland
	}
	if (key_slap2 && (!((shotgunAnim == 1 && key_up))))
	{
		suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
		state = states.handstandjump
		image_index = 0
		sprite_index = spr_suplexdashjumpstart
		movespeed = 6
	}
	if (key_slap2 && (!((shotgunAnim == 1 && key_up))) && global.shoulderbashnondoublegrab == 1 && character == "P")
	{
		instance_create(x, y, obj_crazyrunothereffect)
		suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false)
		state = states.shoulderbash
		image_index = 0
		sprite_index = spr_player_airattackstart
		movespeed = 8
	}
	if (key_slap2 && shotgunAnim == 1 && key_up)
	{
		scr_soundeffect(sfx_killingblow);
		state = states.shotgun
		with (instance_create(x, y, obj_pistoleffect))
			image_xscale = other.image_xscale
		image_index = 0
		sprite_index = spr_shotgunshoot
		if (character == "P")
		{
			instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet)
			with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
				spdh = 4
			with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
				spdh = -4
		}
	}
	if ((!key_attack) or move != xscale)
		mach2 = 0
	if (key_attack && grounded && fallinganimation < 40)
	{
		movespeed = 6
		sprite_index = spr_mach1
		jumpAnim = 1
		state = states.mach1
		image_index = 0
	}
	if key_taunt2
	{
		scr_soundeffect(sfx_taunt)
		taunttimer = 20
		tauntstoredmovespeed = movespeed
		tauntstoredsprite = sprite_index
		tauntstoredstate = state
		state = states.backbreaker
		image_index = random_range(0, (sprite_get_number(spr_taunt) - 1))
		sprite_index = spr_taunt
		instance_create(x, y, obj_taunteffect)
	}
	if (key_slap2 && key_up)
	{
		sprite_index = spr_player_breakdanceuppercut
		image_index = 0
		state = states.shoryuken
		movespeed = 3
		vsp = -7
	}
	if (key_shoot2 && shotgunAnim == 0)
	{
		scr_soundeffect(sfx_breakdance)
		vsp = -4
		movespeed = 9
		state = states.breakdance
		sprite_index = spr_player_breakdancestart
		breakdance = 35
		image_index = 0
		instance_create(x, y, obj_swingdinghitbox)
	}
	//if (key_shoot2 && shotgunAnim == 0 && global.bullet > 0)
	//{
	//	global.bullet--
    //            sprite_index = spr_player_pistolshot
    //            image_index = 0
    //            state = states.pistol
    //            shoot = 1
    //            with (obj_camera)
    //            {
    //                shake_mag = 3
    //                shake_mag_acc = 3 / room_speed
    //            }
	//			with (instance_create((x + xscale * 20), y, obj_shotgunbullet))
    //                    image_xscale = other.xscale
	//}



}
