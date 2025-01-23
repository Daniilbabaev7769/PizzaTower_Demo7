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
if (hitboxcreate == 0 && state == states.enemy_charge && obj_player.state != states.mach3 && obj_player.state != states.mach2)
{
	hitboxcreate = 1
	with (instance_create(x, y, obj_forkhitbox))
	{
		sprite_index = spr_player_mask
		ID = other.id
	}
}
if (attack == 0)
	sprite_index = spr_pizzaboy
if (attack == 0 && state != states.grabbed && state != states.enemy_stun)
{
	state = states.enemy_idle
	roaming = 0
}
if (state != states.enemy_idle)
	roaming = 1
if (x != obj_player.x)
{
	if (obj_player.x > (x - 200) && obj_player.x < (x + 200) && obj_player.y == y)
	{
		if (state == states.enemy_walk or state == states.enemy_idle)
		{
			if (sprite_index == spr_pizzaboy)
				instance_create(x, y, obj_balloonpop)
			image_xscale = (-(sign((x - obj_player.x))))
			roaming = 1
			attack = 1
			vsp = -11
			scr_sound(sound_enemythrow)
			image_index = 0
			image_xscale = (-(sign((x - obj_player.x))))
			state = states.enemy_charge
		}
	}
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
	depth = 0
if (state != states.enemy_stun)
	thrown = 0
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		mask_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}

