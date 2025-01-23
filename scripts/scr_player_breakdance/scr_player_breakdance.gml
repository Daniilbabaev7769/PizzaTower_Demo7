function scr_player_breakdance()
{
        hsp = xscale * movespeed
        move = key_left + key_right
        jumpstop = 0
        if (sprite_index == spr_player_breakdancesuper && key_shoot2)
            movespeed = 14
        if (movespeed > 0 && sprite_index == spr_player_breakdance && grounded)
            movespeed -= 0.5
        if (movespeed > 0 && sprite_index == spr_player_breakdancesuper)
            movespeed -= 0.25
        if (place_meeting((x + xscale), y, obj_solid) && (sprite_index == spr_player_breakdancestart || sprite_index == spr_player_breakdance))
            movespeed = 0
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdancestart)
            sprite_index = spr_player_breakdance
        if (key_shoot2 && move == xscale && sprite_index == spr_player_breakdance)
        {
            image_index = 0
            sprite_index = spr_player_buttattackstart
            movespeed = 16
            vsp = -5
            if (!instance_exists(crazyruneffectid))
            {
                with (instance_create(x, y, obj_crazyrunothereffect))
                {
                    playerid = other.object_index
                    other.crazyruneffectid = id
                }
            }
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_buttattackstart)
            sprite_index = spr_player_buttattack
        if (grounded && sprite_index == spr_player_buttattack)
            sprite_index = spr_player_buttattackend
        if (sprite_index == spr_player_buttattackend)
            movespeed -= 0.25
        if (key_shoot2 && sprite_index == spr_player_breakdance && move == 0)
        {
            sprite_index = spr_player_breakdancesuper
            movespeed = 12
        }
        if (breakdance > 0)
            breakdance--
        landAnim = false
        if (movespeed <= 0 && (sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_buttattackend))
            state = states.normal
        if (breakdance <= 0 && sprite_index == spr_player_breakdance)
            state = states.normal
        if (place_meeting((x + xscale), y, obj_solid) && sprite_index == spr_player_breakdancesuper)
            xscale *= -1
        if (sprite_index == spr_player_breakdancesuper)
            image_speed = movespeed / 24
        else
            image_speed = 0.4
		var buttattackspr = (sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart || sprite_index == spr_player_buttattackend)
		if (key_attack2 && buttattackspr)
		{
			state = states.mach3
			sprite_index = spr_player_dashpad
			image_index = 0
			flash = 1
			if global.slop
			{
				instance_create(x, y, obj_mach3effect1)
				instance_create(x, y, obj_mach3effect2)
			}
		}	
        if (sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart || sprite_index == spr_player_buttattackend)
        {
            if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                scr_soundeffect(sfx_bumpwall)
                grav = 0.5
                movespeed = 0
                state = states.bump
                hsp = -2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                machslideAnim = true
                machhitAnim = false
                instance_create((x + 10), (y + 10), obj_bumpeffect)
            }
            if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                scr_soundeffect(sfx_bumpwall)
                grav = 0.5
                movespeed = 0
                state = states.bump
                hsp = 2.5
                vsp = -3
                mach2 = 0
                image_index = 0
                machslideAnim = true
                machhitAnim = false
                instance_create((x - 10), (y + 10), obj_bumpeffect)
            }
        }
        if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale
        }
}