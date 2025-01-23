if (!instance_exists(ID))
	instance_destroy()
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_index = ID.image_index
if (ID.sprite_index == spr_sausageman_idle)
	sprite_index = spr_cigar_idle
if (ID.sprite_index == spr_sausageman_walk)
	sprite_index = spr_cigar_walk
if (ID.sprite_index == spr_sausageman_turn)
	sprite_index = spr_cigar_turn
if (ID.sprite_index == spr_sausageman_fall)
	sprite_index = spr_cigar_fall
if (ID.sprite_index == spr_sausageman_land)
	sprite_index = spr_cigar_land
with (ID)
{
	if (state != states.enemy_idle && state != states.enemy_walk && state != states.enemy_turn && state != states.enemy_land)
	{
		cigarcreate = 0
		instance_destroy(other.id)
	}
}

