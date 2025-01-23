function scr_player_tacklecharge() {
	if (windingAnim < 2000)
		windingAnim++
	if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
		hsp = (xscale * movespeed)
	else if place_meeting(x, (y + 1), obj_railh)
		hsp = ((xscale * movespeed) - 5)
	else if place_meeting(x, (y + 1), obj_railh2)
		hsp = ((xscale * movespeed) + 5)
	move2 = (key_right2 + key_left2)
	move = (key_right + key_left)
	crouchslideAnim = 1
	if (movespeed < 16 && move == xscale)
		movespeed += 0.1
	else if (movespeed > 10 && move != xscale)
		movespeed -= 0.1
	if key_slap2
	{
		state = states.punch
		image_index = 0
		image_speed = 0.35
	}
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 10
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	if (input_buffer_jump < 8 && grounded)
	{
		image_index = 0
		sprite_index = spr_player_secondjump1
		scr_soundeffect(sfx_jump);
		vsp = -11
	}
	if key_jump
		input_buffer_jump = 0
	if (movespeed >= 14 && (!instance_exists(chargeeffectid)))
	{
		with (instance_create(x, y, obj_chargeeffect))
		{
			playerid = other.object_index
			other.chargeeffectid = id
		}
	}	
	if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + 1), y, obj_slope))) && (!place_meeting(x + 1, y, obj_destructibles)))
	{
		with (baddiegrabbedID)
		{
			scr_soundeffect(sfx_hitenemy);
			grabbed = 0
			grav = 0.5
			instance_create(x, y, obj_bangeffect)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			global.combotime = 60
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 5
			alarm[1] = 5
			thrown = 1
			x = obj_player.x
			y = obj_player.y
			state = states.enemy_stun
			hsp = ((-image_xscale) * 10)
			vsp = -10
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		movespeed = 0
		state = states.bump
		hsp = -2.5
		vsp = -3
		mach2 = 0
		image_index = 0
		instance_create((x + 10), (y + 10), obj_bumpeffect)
		
	}
	if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x - 1), y, obj_slope))) && (!place_meeting(x - 1, y, obj_destructibles)))
	{
		with (baddiegrabbedID)
		{
			scr_soundeffect(sfx_hitenemy);
			grabbed = 0
			grav = 0.5
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			global.combotime = 60
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 2
			alarm[1] = 5
			grav = 0.5
			thrown = 1
			x = obj_player.x
			y = obj_player.y
			state = states.enemy_stun
			hsp = ((-image_xscale) * 10)
			vsp = -10
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		movespeed = 0
		state = states.bump
		hsp = 2.5
		vsp = -3
		mach2 = 0
		image_index = 0
		instance_create((x - 10), (y + 10), obj_bumpeffect)
	}
	sprite_index = spr_charge
	image_speed = movespeed / 20
	if (key_down && grounded)
	{
		sprite_index = spr_crouchslip
		if (character == "P")
			machhitAnim = 0
		state = states.crouchslide
	}
	if ((!key_attack) && move != xscale && grounded)
	{
		image_index = 0
		state = states.machslide
		scr_soundeffect(sfx_machslide);
		sprite_index = spr_machslidestart
	}
	if (move == (-xscale) && grounded)
	{
		image_index = 0
		state = states.machslide
		sprite_index = spr_machslideboost
	}
	if (move == xscale && (!key_attack) && grounded)
		state = states.normal;
	if ((!instance_exists(dashcloudid)) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale
			other.dashcloudid = id
		}
	}
	if (!audio_is_playing(sfx_footstepthingy))
        scr_soundeffect(sfx_footstepthingy)



}
