if (!instance_exists(ID))
	instance_destroy()
if instance_exists(ID)
{
	x = ID.x
	y = ID.y
	image_xscale = ID.image_xscale
	image_index = ID.image_index
	with (ID)
	{
		if (object_index == obj_forknight or object_index == obj_indiancheese or object_index == obj_noisey)
		{
			if (state != states.enemy_walk)
			{
				hitboxcreate = 0
				instance_destroy(other.id)
			}
		}
		if (object_index == obj_boulder)
		{
			if (hitwall == 0)
				instance_destroy(other.id)
		}
		if (object_index == obj_snickexe)
		{
			if (obj_player1.instakillmove == 1 or obj_player1.state == states.handstandjump)
			{
				instance_destroy(other.id)
				hitboxcreate = 0
			}
		}
		if (object_index == obj_noisecrusher)
		{
			if (state != states.enemy_bounce)
			{
				hitboxcreate = 0
				instance_destroy(other.id)
			}
		}
		if (object_index == obj_peasanto or object_index == obj_fencer or object_index == obj_ninja or object_index == obj_pizzice or object_index == obj_ancho)
		{
			if (state != states.enemy_charge)
			{
				hitboxcreate = 0
				instance_destroy(other.id)
			}
		}
	}
}

