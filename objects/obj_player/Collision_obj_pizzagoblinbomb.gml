    if (state == states.handstandjump)
    {
        if (other.state == states.normal && (!cutscene) && state != states.bombpepNEW && (state == states.handstandjump || state == states.punch))
        {
            state = states.bombpepNEW
            image_index = 0
            sprite_index = spr_haulingstart
            other.defused = 1
            bombgrabID = other.id
            movespeed = 6
            with (other)
            {
                state = states.grabbed
                playerid = other.id
            }
        }
    }
else if (other.kickbuffer <= 0)
{
    other.vsp = -9
    other.movespeed = 7
    other.image_xscale = xscale
    other.kickbuffer = 15
    other.y--
    other.defused = 1
}
