function scr_player_knightpepslopes() {
	if ((x + hsp) == xprevious)
        slope_buffer--
    else
        slope_buffer = 20
	alarm[5] = 2
	alarm[7] = 60
	if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == false && vsp < 0.5 && stompAnim == false)
    {
        vsp /= 2
        jumpstop = true
    }
    if (grounded && vsp > 0)
        jumpstop = false
	hurted = 1
	hsp = (xscale * movespeed)
	if (sprite_index == spr_knightpepdownslope)	
		movespeed = 15
	if (!scr_slope()) && grounded
		sprite_index = spr_knightpepcharge
	if scr_slope()
		sprite_index = spr_knightpepdownslope
	if (flamecloud_buffer > 0)
		flamecloud_buffer--
	else
	{
		flamecloud_buffer = 10
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale
            sprite_index = spr_flamecloud
		}
	}	
	if (input_buffer_jump < 8)
    {
        if (grounded || (!doublejump))
        {
            vsp = -11
            sprite_index = spr_knightpep_fly
            image_index = 0
            input_buffer_jump = 8
            if (!grounded)
            {
                vsp = -11
                doublejump = true
                sprite_index = spr_knightpep_doublejump
            }
        }
    }
	if ((sprite_index == spr_knightpep_doublejump || sprite_index == spr_knightpep_fly) && floor(image_index) == (image_number - 1))
        image_index = image_number - 1
	if ((scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_ratblock))) && (!scr_slope())) || slope_buffer <= 0)
	{
		if (character == "P")
		{
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 0
				sprite_index = spr_knightdebris
			}
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 1
				sprite_index = spr_knightdebris
			}
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 2
				sprite_index = spr_knightdebris
			}
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 3
				sprite_index = spr_knightdebris
			}
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 4
				sprite_index = spr_knightdebris
			}
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 5
				sprite_index = spr_knightdebris
			}
		}
		else if (character == "N")
		{
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 0
				sprite_index = spr_playerN_knightarmor
			}
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 1
				sprite_index = spr_playerN_knightarmor
			}
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 2
				sprite_index = spr_playerN_knightarmor
			}
			with (instance_create(x, y, obj_knightdebris))
			{
				image_index = 3
				sprite_index = spr_playerN_knightarmor
			}
		}
		else
		{
			repeat (6)
				instance_create(x, y, obj_metaldebris)
		}
		if (x != other.x)
			obj_player.hsp = (sign((x - other.x)) * 5)
		else
			obj_player.hsp = 5
		vsp = -3
		scr_soundeffect(sfx_bumpwall);
		scr_soundeffect(sfx_loseknight);
		image_index = 0
		obj_player.image_index = 0
		obj_player.flash = 1
		state = states.bump
	}
	if (movespeed <= 0 && sprite_index == spr_knightpepcharge)
	{
		sprite_index = spr_knightpepidle
		state = states.knightpep
	}
	if ((!grounded) && key_down2 && sprite_index != spr_knightpep_downtrust)
    {
        with (instance_create(x, y, obj_parryeffect))
            sprite_index = spr_knightpep_downcloud
        sprite_index = spr_knightpep_downtrust
        vsp = 10
        hsp = 0
        movespeed = 0
		state = states.knightpep
    }
	with (instance_place(x + hsp, y, obj_ratblock))
		instance_destroy()
	image_speed = 0.4



}
