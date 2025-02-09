if ((!pause) && (!instance_exists(obj_fadeout)))
{
	if (obj_player1.key_start && room != rank_room && room != Realtitlescreen && room != timesuproom)
	{
		selected = 0
		if (!instance_exists(obj_pausefadeout))
			instance_create(x, y, obj_pausefadeout)
	}
}
if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
	instance_destroy(obj_pausefadeout)
with (obj_player1)
{
    other.paletteselect = paletteselect
    other.spr_palette = spr_palette
}	
if (pause == 1)
{
	scr_getinput()
	application_surface_draw_enable(true)
	var prevselected = selected
	if (key_down2 && selected < 2)
	{
		selected += 1
		scr_soundeffect(sfx_step);
	}
	if (key_up2 && selected > 0)
	{
		selected -= 1
		scr_soundeffect(sfx_step);
	}
	if (prevselected != selected)
    {
        switch selected
        {
            case 0:
                peppino_sprite = spr_player_idle
                break
            case 1:
                peppino_sprite = spr_player_panic
                break
            case 2:
                peppino_sprite = spr_player_winding
                break
        }

        peppino_sprite_number = sprite_get_number(peppino_sprite)
        peppino_index = 0
    }
	if (key_jump && selected == 1)
	{
		var roomname = room_get_name(room)
		if (global.snickchallenge == 0)
		{
			if (string_letters(roomname) == "entrance" or string_letters(roomname) == "entrancesecret")
			{
				instance_activate_all()
				room = entrance_1
				scr_playerreset()
				pause = 0
				obj_player1.targetDoor = "A"
				if instance_exists(obj_player2)
					obj_player2.targetDoor = "A"
			}
			else if (string_letters(roomname) == "medieval" or string_letters(roomname) == "medievalsecret")
			{
				instance_activate_all()
				room = medieval_1
				scr_playerreset()
				pause = 0
				obj_player1.targetDoor = "A"
				if instance_exists(obj_player2)
					obj_player2.targetDoor = "A"
			}
			if (string_letters(roomname) == "chateau" or string_letters(roomname) == "chateausecret")
			{
				instance_activate_all()
				room = chateau_1
				scr_playerreset()
				pause = 0
				obj_player1.targetDoor = "A"
				if instance_exists(obj_player2)
					obj_player2.targetDoor = "A"
			}
			else if (string_letters(roomname) == "ruin" or string_letters(roomname) == "ruinsecret")
			{
				instance_activate_all()
				room = ruin_1
				scr_playerreset()
				pause = 0
				obj_player1.targetDoor = "A"
				if instance_exists(obj_player2)
					obj_player2.targetDoor = "A"
			}
			else if (string_letters(roomname) == "dungeon" or string_letters(roomname) == "dungeonsecret")
			{
				instance_activate_all()
				room = dungeon_1
				scr_playerreset()
				pause = 0
				obj_player1.targetDoor = "A"
				if instance_exists(obj_player2)
					obj_player2.targetDoor = "A"
			}
			else if (string_letters(roomname) == "strongcold" or string_letters(roomname) == "strongcoldsecret")
			{
				instance_activate_all()
				room = strongcold_10
				scr_playerreset()
				pause = 0
				obj_player1.targetDoor = "A"
				if instance_exists(obj_player2)
					obj_player2.targetDoor = "A"
			}
			else
				scr_soundeffect(sfx_enemyprojectile);
		}
		else if (global.snickchallenge == 1)
		{
			instance_activate_all()
			room = medieval_1
			scr_playerreset()
			global.collect = 10000
			global.seconds = 59
			global.minutes = 9
			global.wave = 0
			global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
			if global.panicbg
				scr_panicbg_init()
			obj_player1.targetDoor = "A"
			global.snickchallenge = 1
			pause = 0
		}
	}
	if (key_jump2 && selected == 2)
    {
        if (room == hub_room1 || room == cowboytask || room == Titlescreen || room == Scootertransition)
        {
            pause = 0
            instance_activate_all()
            room = Realtitlescreen
            with (obj_player1)
            {
                character = "P"
                scr_characterspr()
            }
            scr_playerreset()
            obj_player1.state = states.titlescreen
            obj_player2.state = states.titlescreen
            global.cowboyhat = 0
            obj_player1.targetDoor = "A"
            if instance_exists(obj_player2)
                obj_player2.targetDoor = "A"
            global.coop = 0
        }
        else
        {
            pause = 0
            instance_activate_all()
            scr_playerreset()
            obj_player.targetDoor = "A"
            if instance_exists(obj_player2)
                obj_player2.targetDoor = "A"
            room = hub_room1
        }
    }
	if (key_jump2 && selected == 0)
	{
		if (!instance_exists(obj_pausefadeout))
			instance_create(x, y, obj_pausefadeout)
	}
	peppino_index += 0.35
    if (peppino_index > peppino_sprite_number)
    {
        var p = peppino_index - floor(peppino_index)
        peppino_index = p
    }
	for (var i = 0; i < array_length(toppin_sprite); i++)
    {
        toppin_index[i] += 0.35
        if (toppin_index[i] > toppin_number[i])
        {
            var t = toppin_index[i]
            p = t - floor(t)
            toppin_index[i] = p
        }
    }
    toppin_has[0] = global.cheesefollow
    toppin_has[1] = global.pineapplefollow
    toppin_has[2] = global.sausagefollow
    toppin_has[3] = global.shroomfollow
    toppin_has[4] = global.tomatofollow
}

