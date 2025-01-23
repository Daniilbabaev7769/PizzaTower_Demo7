with (other.id)
{
	if ((other.state == states.enemy_stun && other.thrown == 1) or (other.state == states.grabbed && obj_player.state == states.superslam))
		instance_destroy()
}

