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
	if (key_attack2 && character == "P" && sprite_index != spr_player_Sjumpcancelstart)
    {
        image_index = 0
        sprite_index = spr_player_Sjumpcancelstart
    }
    if (sprite_index == spr_player_Sjumpcancelstart)
    {
        vsp = 0
        if (move != 0)
            xscale = move
        if (floor(image_index) == (image_number - 1))
        {
            vsp = -5
            movespeed = 12
            image_index = 0
            sprite_index = spr_player_Sjumpcancel
            state = states.mach3
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale
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
