switch state
{
	case states.enemy_idle:
		scr_enemy_idle()
		break
	case states.enemy_bounce:
		scr_enemy_bounce()
		break
	case states.enemy_stun:
		scr_enemy_stun()
		break
	case states.grabbed:
		scr_enemy_grabbed()
		break
}

if (state == states.enemy_stun && stunned > 40 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state != states.enemy_stun)
	birdcreated = 0
if (state == states.enemy_idle && obj_player.x != x)
	image_xscale = sign((obj_player.x - x))
if (state == states.enemy_idle)
	attack--
if (attack <= 0 && state == states.enemy_idle)
{
	sprite_index = jumpprepspr
	image_index = 0
	state = states.enemy_bounce
}
if (global.bosshealth == 5)
	helmet = 1
if (helmet == 0)
{
	idlespr = 26
	stunfallspr = 18
	walkspr = 26
	grabbedspr = 18
	jumpprepspr = 24
	jumpspr = 22
	landspr = 20
	airspr = 16
}
else
{
	idlespr = 25
	stunfallspr = 17
	walkspr = 25
	grabbedspr = 17
	jumpprepspr = 23
	jumpspr = 21
	landspr = 19
	airspr = 15
}
if (global.bosshealth <= 0)
	instance_destroy()
if (caughtplayer == 1 && (!grounded))
{
	obj_player.state = states.bump
	obj_player.image_index = 0
	obj_player.x = x
	obj_player.y = y
}
if (caughtplayer == 1 && grounded)
{
	obj_player.state = states.boxxedpep
	if (obj_player.sprite_index != spr_boxxedpep_intro)
	{
		obj_player.sprite_index = spr_boxxedpep_intro
		scr_sound(sound_touchspike)
	}
	obj_player.image_index = 0
	obj_player.hsp = 0
	obj_player.vsp = 0
	obj_player.x = x
	obj_player.y = (y - 20)
	caughtplayer = 0
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
	depth = 0
scr_collide()
if (state != states.enemy_stun)
	thrown = 0

