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

if (state == states.enemy_stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state != states.enemy_stun)
	birdcreated = 0
if (state == states.enemy_walk && y > ystart && (!(scr_solid(x, (y - 1)))))
	y--
if (state == states.enemy_walk && y < ystart && (!(scr_solid(x, (y + 1)))))
	y++
if (state == states.enemy_stun)
	grav = 0.5
else
	grav = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
	depth = 0
if (state != states.enemy_charge)
    scr_scareenemy()
if instance_exists(obj_player2)
{
	if (obj_player2.x > (x - 600) && obj_player2.x < (x + 600) && y <= (obj_player2.y + 60) && y >= (obj_player2.y - 60))
	{
		if (state != states.enemy_idle && obj_player2.state == states.mach3)
		{
			state = states.enemy_idle
			sprite_index = scaredspr
			if (x != obj_player2.x)
				image_xscale = (-(sign((x - obj_player2.x))))
		}
	}
}
if (sprite_index == spr_ancho_chargestart && floor(image_index) == (image_number - 1))
{
	if (hitboxcreate == 0 && state == states.enemy_charge)
	{
		hitboxcreate = 1
		with (instance_create(x, y, obj_forkhitbox))
			ID = other.id
	}
	sprite_index = spr_ancho_charge
	movespeed = 10
}
if (x != obj_player1.x && state != states.enemy_charge && y == ystart)
{
	if (obj_player1.x > (x - 200) && obj_player1.x < (x + 200) && y <= (obj_player1.y + 50) && y >= (obj_player1.y - 50))
	{
		if (state == states.enemy_walk)
		{
			image_index = 0
			image_xscale = (-(sign((x - obj_player.x))))
			state = states.enemy_charge
			sprite_index = spr_ancho_chargestart
		}
	}
}
if instance_exists(obj_player2)
{
	if (x != obj_player2.x && state != states.enemy_charge && y == ystart)
	{
		if (obj_player2.x > (x - 200) && obj_player2.x < (x + 200) && y <= (obj_player2.y + 50) && y >= (obj_player2.y - 50))
		{
			if (state == states.enemy_walk)
			{
				image_index = 0
				image_xscale = (-(sign((x - obj_player.x))))
				state = states.enemy_charge
				sprite_index = spr_ancho_chargestart
			}
		}
	}
}
if (state == states.enemy_stun or state == states.enemy_walk)
	movespeed = 0
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

