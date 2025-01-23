if instance_exists(baddieID)
{
	with (baddieID)
	{
		state = states.enemy_stun
		stunned = 100
		vsp = -5
	}
}

