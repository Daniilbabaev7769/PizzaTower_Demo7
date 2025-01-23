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

if (!instance_exists(obj_slaphitbox))
	slapped = 0
stunned = 100
if (cigar == 0)
{
	landspr = 32
	idlespr = 32
	fallspr = 32
	hitceillingspr = 32
	stunfalltransspr = 32
	hitwallspr = 32
	stunfallspr = 30
	rollingspr = 32
	walkspr = 32
	turnspr = 32
	flyingspr = 32
	hitspr = 32
	stunlandspr = 32
	stunspr = 32
	recoveryspr = 32
	stompedspr = 32
	grabbedspr = 30
}
if (state != states.grabbed)
	depth = 0
if (state != states.enemy_stun)
	thrown = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)

