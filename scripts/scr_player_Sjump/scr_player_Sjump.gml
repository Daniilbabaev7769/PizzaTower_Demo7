function scr_player_Sjump() {
	move = key_left + key_right
	hsp = 0
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	if (sprite_index == spr_superjump)
		vsp = -15
	if (sprite_index == spr_player_supersidejump)
	{
		if (a < 25)
			a++
		hsp = (xscale * a)
		vsp = 0
	}
	if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
	{
		a = 0
		if (sprite_index == spr_player_supersidejump)
			sprite_index = spr_player_supersidejumpland
		if (sprite_index == spr_superjump)
			sprite_index = spr_superjumpland
		with (obj_camera)
		{
			shake_mag = 10
			shake_mag_acc = (30 / room_speed)
		}
		with (obj_baddie)
		{
			if point_in_rectangle(x, y, __view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), (__view_get(e__VW.XView, 0) + __view_get(e__VW.WView, 0)), (__view_get(e__VW.YView, 0) + __view_get(e__VW.HView, 0)))
			{
				image_index = 0
				if grounded
					vsp = -7
			}
		}
		scr_soundeffect(sfx_groundpound);
		image_index = 0
		state = states.Sjumpland
		machhitAnim = 0
	}
	if (key_attack2 && global.coop == 0 && character == "P")
	{
		if (move != 0)
			xscale = move
		movespeed = 12
		machhitAnim = 0
		state = states.mach3
		flash = 1
		sprite_index = spr_player_dashpad
		instance_create(x, y, obj_jumpdust)
		if global.slop
		{
			instance_create(x, y, obj_mach3effect1)
			instance_create(x, y, obj_mach3effect2)	
		}
	}
	if (key_attack2 && character == "N")
	{
		image_speed = 0.5
            if (move != 0)
                xscale = move
            key_slap = false
            key_slap2 = false
            jumpstop = true
            vsp = -5
            state = states.mach2
            movespeed = 12
            sprite_index = spr_playerN_sidewayspin
            image_index = 0
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale
            instance_create(x, y, obj_jumpdust)
            return true;
	}
	image_speed = 0.5
	scr_collide_player()



}
