function scr_player_chainsaw() //gml_Script_scr_player_chainsaw
{
    hsp = 0
    vsp = 0
    x = hitX + (random_range(-4, 4))
    y = hitY + (random_range(-4, 4))
    hitLag--
    if key_jump
        input_buffer_jump = 0
	image_speed = 0
	if (sprite_index == spr_player_lungehit)
		image_speed = 0.35
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
		if (tauntstoredstate == states.shoulderbash)
		{
			with (obj_player)
			{
				jumpAnim = true
				state = states.jump
				sprite_index = spr_player_backflip
				vsp = -11
				jumpstop = 0
				image_index = 0
			}
		}
		if (tauntstoredstate == states.lungeattack)
		{
			with (obj_player)
			{
				sprite_index = spr_player_lungehit
				image_index = 0
			}
		}
        if ((tauntstoredstate == states.handstandjump && (tauntstoredsprite == spr_player_suplexgrabjumpstart || tauntstoredsprite == spr_player_suplexgrabjump || tauntstoredsprite == spr_player_airattack || tauntstoredsprite == spr_player_airattackstart)) || sprite_index == spr_piledriverland)
        {
            jumpAnim = true
            state = states.jump
            sprite_index = spr_player_backflip
            vsp = -11
            jumpstop = 0
            image_index = 0
        }
        else if (tauntstoredstate == states.handstandjump || tauntstoredstate == states.finishingblow)
            state = states.normal
			
    }
}
