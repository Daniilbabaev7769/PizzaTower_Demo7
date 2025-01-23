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
if (cigar == 1)
{
	landspr = 132
	idlespr = 140
	fallspr = 134
	hitceillingspr = 126
	stunfalltransspr = 124
	hitwallspr = 118
	stunfallspr = 122
	rollingspr = 112
	walkspr = 138
	turnspr = 136
	flyingspr = 128
	hitspr = 130
	stunlandspr = 116
	stunspr = 114
	recoveryspr = 110
	stompedspr = 120
	grabbedspr = 108
}
if (cigar == 0)
{
	landspr = 131
	idlespr = 139
	fallspr = 133
	hitceillingspr = 125
	stunfalltransspr = 123
	hitwallspr = 117
	stunfallspr = 121
	rollingspr = 111
	walkspr = 137
	turnspr = 135
	flyingspr = 127
	hitspr = 129
	stunlandspr = 115
	stunspr = 113
	recoveryspr = 109
	stompedspr = 119
	grabbedspr = 106
}
if (cigar == 1 && cigarcreate == 0 && (state == states.enemy_idle or state == states.enemy_walk or state == states.enemy_turn or state == states.enemy_land))
{
	cigarcreate = 1
	with (instance_create(x, y, obj_sausagemancigar))
		ID = other.id
}
if (state != states.grabbed)
	depth = 0
if (state != states.enemy_stun)
	thrown = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)

