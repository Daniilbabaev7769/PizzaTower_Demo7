function scr_player_climbwall() {
	if (windingAnim < 200)
		windingAnim++
	move = (key_left + key_right)
	suplexmove = 0
	vsp = (-wallspeed)
	if (wallspeed < 24 && move == xscale)
		wallspeed += 0.1
	crouchslideAnim = 1
	sprite_index = spr_machclimbwall
	if (!key_attack)
	{
		state = states.normal;
		movespeed = 0
	}
	if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
	{
		sprite_index = spr_superjumpland
		scr_soundeffect(sfx_groundpound);
		image_index = 0
		state = states.Sjumpland
		machhitAnim = 0
	}
	if (!(scr_solid((x + xscale), y)))
	{
		instance_create(x, y, obj_jumpdust)
		vsp = 0
		if (wallspeed >= 6 && wallspeed < 12)
		{
			state = states.mach2
			movespeed = wallspeed
		}
		else if (wallspeed >= 12)
		{
			state = states.mach3
			sprite_index = spr_mach4
			movespeed = wallspeed
		}
	}
	if key_jump
	{
		movespeed = 10
		state = states.mach2
		image_index = 0
		sprite_index = spr_walljumpstart
		if (character == "P")
			vsp = -11
		else
			vsp = -13
		xscale *= -1
		jumpstop = 0
	}
	if ((grounded && wallspeed <= 0) or wallspeed <= 0)
	{
		state = states.jump
		sprite_index = spr_fall
	}
	image_speed = 0.6
	if (!instance_exists(obj_cloudeffect))
		instance_create(x, (y + 43), obj_cloudeffect)



}
