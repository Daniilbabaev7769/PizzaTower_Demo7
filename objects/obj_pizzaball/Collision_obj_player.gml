if (other.state == states.handstandjump && state != states.golf)
{
    var _player = other.id
    var _pizzaball = id
    with (_player)
    {
		if (state != states.golf)
		{
	        golfid = _pizzaball
            image_speed = 0.35
			image_index = 0
		    sprite_index = spr_haulingstart
	        other.y = y
			hsp = 0
		    state = states.golf
	        _pizzaball.state = states.golf
			_pizzaball.player = id
			_pizzaball.meter = 0
		    if (xscale > 0)
	            _pizzaball.m_angle = 0
            else
				_pizzaball.m_angle = 180
        }
    }
}
