function scr_player_slipnslide() {
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	hsp = (xscale * movespeed)
	machhitAnim = 0
	crouchslideAnim = 1
	if (movespeed <= 0)
    {
        state = states.normal
        movespeed = 0
        mach2 = 0
        image_index = 0
    }
	if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        state = states.jump
        vsp = -14
        jumpstop = 1
    }
    if (scr_slope() && movespeed <= 0)
        movespeed = 2
	sprite_index = spr_slipnslide
	image_speed = 0.35
	if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 1.5)
	{
		with (instance_create(x, y, obj_slidecloud))
			image_xscale = other.xscale
	}



}
