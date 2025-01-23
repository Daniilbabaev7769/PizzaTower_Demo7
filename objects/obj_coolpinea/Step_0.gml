switch state
{
	case states.enemy_idle:
		scr_enemy_idle()
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
if (hp <= 0)
	instance_destroy()
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (hitboxcreate == 0 && (state == states.enemy_idle or state == states.enemy_walk))
{
	hitboxcreate = 1
	with (instance_create(x, y, obj_pineahitbox))
		ID = other.id
}
if (state != states.grabbed)
	depth = 0
if (state != states.enemy_stun)
	thrown = 0

