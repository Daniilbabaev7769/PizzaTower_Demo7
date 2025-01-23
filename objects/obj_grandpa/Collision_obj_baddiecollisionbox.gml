with (other.id)
{
	if (instance_exists(baddieID) && baddieID != other.id)
	{
		if ((baddieID.state == states.enemy_stun && baddieID.thrown == 1) or obj_player.state == states.superslam)
		{
			instance_destroy()
			instance_destroy(baddieID)
			instance_destroy(other.id)
		}
	}
}

