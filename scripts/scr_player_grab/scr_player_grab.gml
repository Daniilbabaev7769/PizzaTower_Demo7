function scr_player_grab() {
	grav = 0.5
	move = (key_left + key_right)
	if grounded
	{
		if (dir != xscale && sprite_index != spr_swingding)
		{
			dir = xscale
			movespeed = 2
			facehurt = 0
		}
		jumpstop = 0
		anger = 100
		if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
			hsp = (move * movespeed)
		else if place_meeting(x, (y + 1), obj_railh)
			hsp = ((move * movespeed) - 5)
		else if place_meeting(x, (y + 1), obj_railh2)
			hsp = ((move * movespeed) + 5)
		if (heavy == 0)
        {
            if (sprite_index != spr_swingding)
            {
                if (move != 0)
                {
                    if (movespeed < 6)
                        movespeed += 0.5
                    else if (floor(movespeed) == 6)
                        movespeed = 6
                }
                else
                    movespeed = 0
                if (movespeed > 6)
                    movespeed -= 0.1
            }
        }
        else
        {
            if (move != 0)
            {
                if (movespeed < 4)
                    movespeed += 0.25
                else if (floor(movespeed) == 4)
                    movespeed = 4
            }
            else
                movespeed = 0
            if (movespeed > 4)
                movespeed -= 0.1
        }
        if (move != 0 && sprite_index != spr_swingding)
            xscale = move
        if (move != 0)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45
            else
                image_speed = 0.6
        }
        else
            image_speed = 0.35
    }
    if (sprite_index != spr_swingding)
    {
        if (!grounded)
        {
            if (dir != xscale && sprite_index != spr_swingding)
            {
                dir = xscale
                movespeed = 2
                facehurt = 0
            }
            if (move != xscale)
                movespeed = 2
            if (momemtum == 0)
                hsp = move * movespeed
            else
                hsp = xscale * movespeed
            if (move != xscale && momemtum == 1 && movespeed != 0)
                movespeed -= 0.05
            if (movespeed == 0)
                momemtum = 0
            if (move != 0 && movespeed < 6)
                movespeed += 0.5
            if (movespeed > 6)
                movespeed -= 0.5
            if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
                movespeed = 0
        }
        if (dir != xscale)
        {
            dir = xscale
            movespeed = 2
            facehurt = 0
        }
        if (move == (-xscale))
        {
            mach2 = 0
            momemtum = 0
        }
        landAnim = true
        if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == false)
        {
            vsp /= 10
            jumpstop = 1
        }
        if (ladderbuffer > 0)
            ladderbuffer--
        if (scr_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == true)
        {
            vsp = grav
            jumpstop = 1
        }
        if (move != 0 && sprite_index != spr_swingding)
            xscale = move
    }
    else
    {
        hsp = xscale * movespeed
        if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
            xscale *= -1
        if (swingdingbuffer == 0 && (!key_attack))
            swingdingbuffer = -1
        if (swingdingbuffer == -1)
            movespeed = Approach(movespeed, 0, 0.5)
        if (movespeed == 0)
            sprite_index = spr_haulingidle
    }
	if key_jump
		input_buffer_jump = 0
	if (grounded && input_buffer_jump < 8 && (!key_down) && (!key_attack) && vsp > 0 && sprite_index != spr_swingding)
	{
		scr_soundeffect(sfx_jump);
		sprite_index = spr_haulingjump
		instance_create(x, y, obj_highjumpcloud2)
		if (heavy == 0)
			vsp = -11
		else
			vsp = -6
		image_index = 0
	}
	if (grounded && move != 0 && sprite_index == spr_haulingidle)
		sprite_index = spr_haulingwalk
	else if (grounded && move == 0 && sprite_index == spr_haulingwalk)
		sprite_index = spr_haulingidle
	if (sprite_index == spr_haulingstart && floor(image_index) == (image_number - 1))
		sprite_index = spr_haulingidle
	if ((sprite_index == spr_haulingjump && floor(image_index) == (image_number - 1)) or ((!grounded) && (sprite_index == spr_haulingwalk or sprite_index == spr_haulingidle)))
		sprite_index = spr_haulingfall
	if (grounded && vsp > 0 && (sprite_index == spr_haulingfall or sprite_index == spr_haulingjump))
		sprite_index = spr_haulingland
	if (sprite_index == spr_haulingland && floor(image_index) == (image_number - 1))
		sprite_index = spr_haulingidle
	if (key_attack && sprite_index != spr_swingding)
    {
        swingdingbuffer = 0
        sprite_index = spr_swingding
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        movespeed = 12
        with (instance_create(x, y, obj_swingdinghitbox))
            playerid = other.object_index
        flash = 1
    }
    if (swingdingbuffer > 0)
    {
        swingdingbuffer--
        if (movespeed > 0)
            movespeed -= 0.1
    }
	if (swingdingbuffer > 300 && sprite_index != spr_swingding)
	{
		sprite_index = spr_swingding
		with (instance_create(x, y, obj_swingdinghitbox))
			playerid = other.object_index
		flash = 1
	}
	if key_slap2
	{
		if (move != 0)
			move = xscale
		state = states.finishingblow
		if (sprite_index == spr_swingding)
			sprite_index = spr_swingdingend
		else if (!key_up)
			sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
		else if key_up
			sprite_index = spr_uppercutfinishingblow
		image_index = 0
		hsp = 0
		movespeed = 0
	}
	if (key_down && (!grounded))
	{
		sprite_index = spr_piledriver
		vsp = -6
		state = states.superslam
		image_index = 0
		image_speed = 0.35
	}
	if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 or floor(image_index) == 10))
		instance_create(x, (y + 43), obj_cloudeffect)
	if (key_down && grounded)
	{
		state = states.crouch
		landAnim = 0
		crouchAnim = 1
		image_index = 0
		idle = 0
	}
	if (move != 0 && (floor(image_index) == 3 or floor(image_index) == 8) && steppy == 0)
		steppy = 1
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
		steppy = 0
	if (sprite_index != spr_swingding)
		image_speed = 0.35
	else
		image_speed = 0.6



}
