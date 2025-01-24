function scr_player_lungeattack()
{
	hsp = xscale * movespeed
	if (sprite_index != spr_player_lungehit)
		move = key_left + key_right
    vsp = 0
	if (move != xscale && move != 0)
		state = states.normal;	
    image_speed = 0.35
	if (sprite_index == spr_player_lungestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_lunge
	if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
	{
		scr_soundeffect(sfx_bumpwall);
		grav = 0.5
		movespeed = 0
		state = states.bump
		hsp = -2.5
		vsp = -3
		mach2 = 0
		image_index = 0
		machslideAnim = 1
		machhitAnim = 0
		instance_create((x + 10), (y + 10), obj_bumpeffect)
	}
	if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
	{
		scr_soundeffect(sfx_bumpwall);
		grav = 0.5
		movespeed = 0
		state = states.bump
		hsp = 2.5
		vsp = -3
		mach2 = 0
		image_index = 0
		machslideAnim = 1
		machhitAnim = 0
		instance_create((x - 10), (y + 10), obj_bumpeffect)
	}
	if (floor(image_index) == (image_number - 1))
        state = states.normal

}