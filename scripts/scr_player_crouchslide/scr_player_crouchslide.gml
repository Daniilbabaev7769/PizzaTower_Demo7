function scr_player_crouchslide() {
	if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
		hsp = (xscale * movespeed)
	else if place_meeting(x, (y + 1), obj_railh)
		hsp = ((xscale * movespeed) - 5)
	else if place_meeting(x, (y + 1), obj_railh2)
		hsp = ((xscale * movespeed) + 5)
	if (movespeed >= 0 && grounded)
		movespeed -= 0.2
	mask_index = spr_crouchmask
	if (grounded && key_attack && (!(scr_solid((x + 27), (y - 32)))) && (!(scr_solid((x - 27), (y - 32)))) && (!(scr_solid(x, (y - 32)))) && (!(scr_solid(x, (y - 16)))))
    {
        movespeed = 8
        state = states.mach2
        image_index = 0
        sprite_index = spr_rollgetup
    }
    if (((movespeed <= 5 || (scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) || movespeed <= 0)
        state = states.crouch
    if (scr_solid((x + 1), y) && xscale == 1 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
        state = states.crouch
    if (scr_solid((x - 1), y) && xscale == -1 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
        state = states.crouch
	if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
	{
		with (instance_create(x, y, obj_slidecloud))
			image_xscale = other.xscale
	}
	image_speed = movespeed / 24



}
