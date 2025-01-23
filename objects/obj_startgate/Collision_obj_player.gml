with (obj_player1)
{
	if (key_up && grounded && (state == states.normal or state == states.mach1 or state == states.mach2 or state == states.mach3) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != states.victory && state != states.comingoutdoor && obj_player1.spotlight == 1)
	{
		audio_stop_all()
		backtohubstartx = x
		backtohubstarty = y
		backtohubroom = room
		mach2 = 0
		obj_camera.chargecamera = 0
		image_index = 0
		state = states.victory
		obj_player2.backtohubstartx = x
		obj_player2.backtohubstarty = y
		obj_player2.backtohubroom = room
		if (global.coop == 1)
		{
			with (obj_player2)
			{
				x = obj_player1.x
				mach2 = 0
				obj_camera.chargecamera = 0
				image_index = 0
				state = states.victory
			}
		}
	}
}
with (obj_player2)
{
	if (key_up && grounded && (state == states.normal or state == states.mach1 or state == states.mach2 or state == states.mach3) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != states.victory && state != states.comingoutdoor && obj_player1.spotlight == 0)
	{
		audio_stop_all()
		backtohubstartx = x
		backtohubstarty = y
		backtohubroom = room
		mach2 = 0
		obj_camera.chargecamera = 0
		image_index = 0
		state = states.victory
		obj_player1.backtohubstartx = x
		obj_player1.backtohubstarty = y
		obj_player1.backtohubroom = room
		if (global.coop == 1)
		{
			with (obj_player1)
			{
				x = obj_player2.x
				mach2 = 0
				obj_camera.chargecamera = 0
				image_index = 0
				state = states.victory
			}
		}
	}
}
if ((floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == states.victory) or (floor(obj_player2.image_index) == (obj_player2.image_number - 1) && obj_player2.state == states.victory))
{
	with (obj_player)
	{
		if (other.level == "snickchallenge")
		{
			global.wave = 0
			global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
			if global.panicbg
				scr_panicbg_init()
			global.snickchallenge = 1
			global.collect = 10000
			with (obj_camera)
			{
				alarm[1] = 60
				global.seconds = 59
				global.minutes = 9
			}
		}
		obj_music.fadeoff = 0
		targetDoor = other.targetDoor
		targetRoom = other.targetRoom
		if (!instance_exists(obj_fadeout))
			instance_create(x, y, obj_fadeout)
	}
}

