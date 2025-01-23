switch state
{
	case states.enemy_idle:
		scr_enemy_idle()
		break
	case states.enemy_charge:
		scr_enemy_charge()
		break
	case states.enemy_turn:
		scr_enemy_turn()
		break
	case states.enemy_walk:
		scr_enemy_walk()
		break
	case states.enemy_land:
		scr_enemy_land()
		break
	case states.enemy_hit:
		scr_enemy_hit()
		break
	case states.enemy_stun:
		scr_enemy_stun()
		break
	case states.pizzagoblin_throw:
		scr_pizzagoblin_throw()
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
idlespr = 220
stunfallspr = 214
walkspr = 218
stunspr = 214
grabbedspr = 214
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (hp <= 0)
	instance_destroy()
if (state != states.grabbed)
	depth = 0
if (state != states.enemy_stun)
	thrown = 0
if (bombreset > 0)
	bombreset--
if (x != obj_player.x && state != states.pizzagoblin_throw && bombreset == 0)
{
	if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && y <= (obj_player.y + 20) && y >= (obj_player.y - 20))
	{
		if (state == states.enemy_walk or state == states.enemy_idle)
		{
			scr_sound(sound_enemythrow)
			image_index = 0
			image_xscale = (-(sign((x - obj_player.x))))
			state = states.pizzagoblin_throw
		}
	}
}

