if obj_player1.key_up2
{
	switch obj_player.character
	{
		case "P":
			if (obj_player1.paletteselect < 5)
				obj_player1.paletteselect += 1
			else
				obj_player1.paletteselect = 1
			break
		case "N":
			if (obj_player1.paletteselect < 7)
				obj_player1.paletteselect += 1
			else
				obj_player1.paletteselect = 0
			break
	}
	instance_create(obj_player.x, obj_player.y, obj_genericpoofeffect)
}

