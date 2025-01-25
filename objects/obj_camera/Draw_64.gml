if (obj_player1.spotlight == 1)
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
else
	pal_swap_set(obj_player2.spr_palette, obj_player2.paletteselect, 0)
if (obj_player.backupweapon == 1)
	draw_sprite_ext(spr_shotgunbackup, -1, 50, 100, 1, 1, 1, c_white, alpha)
if (obj_player.state != states.gameover)
{
	if (obj_player1.character == "P" && obj_player1.spotlight == 1)
	{
		if (shoving == 1)
		{
			if (image_index < 3)
				draw_sprite_ext(spr_noiseHUD_idle, image_index, 125, 100, 1, 1, 1, c_white, alpha)
			draw_sprite_ext(spr_pepinoHUD_shove, image_index, 125, 100, 1, 1, 1, c_white, alpha)
		}
		else if (obj_player1.sprite_index == spr_knightpep_thunder)
			draw_sprite_ext(spr_pepinoHUDthunder, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index != spr_knightpep_start && (obj_player1.state == states.knightpep or obj_player1.state == states.knightpepslopes or obj_player1.state == states.knightpepattack))
			draw_sprite_ext(spr_pepinoHUDknight, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == spr_bombpep_end)
			draw_sprite_ext(spr_pepinoHUDbombend, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (instance_exists(obj_itspizzatime) or obj_player1.sprite_index == spr_bombpep_intro or obj_player1.sprite_index == spr_bombpep_runabouttoexplode or obj_player1.sprite_index == spr_bombpep_run or obj_player1.sprite_index == spr_player_fireass)
			draw_sprite_ext(spr_pepinoHUDscream, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.Sjumpland or (obj_player1.state == states.freefallland && shake_mag > 0))
			draw_sprite_ext(spr_pepinoHUDstun, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == spr_player_victory or obj_player1.state == states.keyget or obj_player1.state == states.smirk or obj_player1.state == states.gottreasure or (obj_player1.state == states.bossintro && obj_player1.sprite_index == spr_player_levelcomplete))
			draw_sprite_ext(spr_pepinoHUDhappy, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == spr_player_machroll or obj_player1.sprite_index == spr_player_tumble)
			draw_sprite_ext(spr_pepinoHUDrolling, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (global.combo >= 3)
			draw_sprite_ext(spr_pepinoHUDmenacing, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.mach1 or obj_player1.state == states.chainsaw or obj_player1.state == states.freefallprep or obj_player1.state == states.freefall or obj_player1.state == states.tackle or obj_player1.state == states.Sjump or obj_player1.state == states.slam or obj_player1.state == states.Sjumpprep or obj_player1.state == states.grab or obj_player1.state == states.punch or obj_player1.state == states.backbreaker or obj_player1.state == states.backkick or obj_player1.state == states.uppunch or obj_player1.state == states.shoulder)
			draw_sprite_ext(spr_pepinoHUDmach1, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.mach2 or obj_player1.sprite_index == spr_player_dive or obj_player1.sprite_index == spr_player_machslideboost or obj_player1.state == states.climbwall or obj_player1.state == states.handstandjump or obj_player1.state == states.superslam or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance)
			draw_sprite_ext(spr_pepinoHUDmach2, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.mach3 && obj_player1.sprite_index == spr_player_crazyrun)
			draw_sprite_ext(spr_pepinoHUDmach4, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.mach3 or obj_player1.sprite_index == spr_player_machslideboost3)
			draw_sprite_ext(spr_pepinoHUDmach3, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.hurt or obj_player1.sprite_index == spr_bombpep_end or obj_player1.sprite_index == spr_player_fireassend or obj_player1.state == states.timesup or obj_player1.state == states.bombpep or (obj_player1.state == states.bossintro && obj_player1.sprite_index == spr_player_bossintro) or (obj_player1.state == states.bossintro && obj_player1.sprite_index == spr_player_idle))
			draw_sprite_ext(spr_pepinoHUDhurt, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.angry == 1)
			draw_sprite_ext(spr_pepinoHUD3hp, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == spr_player_hurtidle or obj_player1.sprite_index == spr_player_hurtwalk)
			draw_sprite_ext(spr_pepinoHUD1hp, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (global.panic == 1 or global.snickchallenge == 1 or global.miniboss == 1)
			draw_sprite_ext(spr_pepinoHUDpanic, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == spr_shotgun_pullout)
			draw_sprite_ext(spr_pepinoHUDmenacing, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else
			draw_sprite_ext(spr_pepinoHUD, -1, 125, 100, 1, 1, 1, c_white, alpha)
	}
	if (obj_player2.character == "P" && obj_player1.spotlight == 0)
	{
		if (shoving == 1)
		{
			if (image_index < 3)
				draw_sprite_ext(spr_noiseHUD_idle, image_index, 125, 100, 1, 1, 1, c_white, alpha)
			draw_sprite_ext(spr_pepinoHUD_shove, image_index, 125, 100, 1, 1, 1, c_white, alpha)
		}
		else if (obj_player2.sprite_index == spr_knightpep_thunder)
			draw_sprite_ext(spr_pepinoHUDthunder, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index != spr_knightpep_start && (obj_player2.state == states.knightpep or obj_player2.state == states.knightpepslopes))
			draw_sprite_ext(spr_pepinoHUDknight, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == spr_bombpep_end)
			draw_sprite_ext(spr_pepinoHUDbombend, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (instance_exists(obj_itspizzatime) or obj_player2.sprite_index == spr_bombpep_intro or obj_player2.sprite_index == spr_bombpep_runabouttoexplode or obj_player2.sprite_index == spr_bombpep_run or obj_player2.sprite_index == spr_player_fireass)
			draw_sprite_ext(spr_pepinoHUDscream, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.Sjumpland or (obj_player2.state == states.freefallland && shake_mag > 0))
			draw_sprite_ext(spr_pepinoHUDstun, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == spr_player_victory or obj_player2.state == states.keyget or obj_player2.state == states.smirk or obj_player2.state == states.gottreasure or (obj_player2.state == states.bossintro && obj_player2.sprite_index == spr_player_levelcomplete))
			draw_sprite_ext(spr_pepinoHUDhappy, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == spr_player_machroll or obj_player2.sprite_index == spr_player_tumble)
			draw_sprite_ext(spr_pepinoHUDrolling, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (global.combo >= 3)
			draw_sprite_ext(spr_pepinoHUDmenacing, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.mach1 or obj_player2.state == states.chainsaw or obj_player2.state == states.freefallprep or obj_player2.state == states.freefall or obj_player2.state == states.tackle or obj_player2.state == states.Sjump or obj_player2.state == states.slam or obj_player2.state == states.Sjumpprep or obj_player2.state == states.grab or obj_player2.state == states.punch or obj_player2.state == states.backbreaker or obj_player2.state == states.backkick or obj_player2.state == states.uppunch or obj_player2.state == states.shoulder)
			draw_sprite_ext(spr_pepinoHUDmach1, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.mach2 or obj_player2.sprite_index == spr_player_dive or obj_player2.sprite_index == spr_player_machslideboost or obj_player2.state == states.climbwall or obj_player2.state == states.handstandjump or obj_player2.state == states.superslam)
			draw_sprite_ext(spr_pepinoHUDmach2, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.mach3 && obj_player2.sprite_index == spr_player_crazyrun)
			draw_sprite_ext(spr_pepinoHUDmach4, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.mach3 or obj_player2.sprite_index == spr_player_machslideboost3)
			draw_sprite_ext(spr_pepinoHUDmach3, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.hurt or obj_player2.sprite_index == spr_bombpep_end or obj_player2.sprite_index == spr_player_fireassend or obj_player2.state == states.timesup or obj_player2.state == states.bombpep or (obj_player2.state == states.bossintro && obj_player2.sprite_index == spr_player_bossintro) or (obj_player2.state == states.bossintro && obj_player2.sprite_index == spr_player_idle))
			draw_sprite_ext(spr_pepinoHUDhurt, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.angry == 1)
			draw_sprite_ext(spr_pepinoHUD3hp, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == spr_player_hurtidle or obj_player2.sprite_index == spr_player_hurtwalk)
			draw_sprite_ext(spr_pepinoHUD1hp, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (global.panic == 1 or global.snickchallenge == 1 or global.miniboss == 1)
			draw_sprite_ext(spr_pepinoHUDpanic, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == spr_shotgun_pullout)
			draw_sprite_ext(spr_pepinoHUDmenacing, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else
			draw_sprite_ext(spr_pepinoHUD, -1, 125, 100, 1, 1, 1, c_white, alpha)
	}
	if (obj_player.character == "S")
		draw_sprite_ext(spr_snickHUD, -1, 125, 60, 1, 1, 1, c_white, alpha)
	if (obj_player2.character == "N" && obj_player1.spotlight == 0)
	{
		if (shoving == 1)
		{
			if (image_index < 3)
				draw_sprite_ext(spr_pepinoHUD, image_index, 125, 100, 1, 1, 1, c_white, alpha)
			draw_sprite_ext(spr_noiseHUD_shove, image_index, 125, 100, 1, 1, 1, c_white, alpha)
		}
		else if (obj_player2.sprite_index == obj_player2.spr_knightpepthunder)
			draw_sprite_ext(spr_noiseHUD_thunder, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index != obj_player2.spr_knightpepstart && (obj_player2.state == states.knightpep or obj_player2.state == states.knightpepslopes))
			draw_sprite_ext(spr_noiseHUD_knight, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == obj_player2.spr_bombpepend)
			draw_sprite_ext(spr_noiseHUD_bomb, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (instance_exists(obj_itspizzatime) or obj_player2.sprite_index == obj_player2.spr_bombpepintro or obj_player2.sprite_index == obj_player2.spr_bombpeprunabouttoexplode or obj_player2.sprite_index == obj_player2.spr_bombpeprun or obj_player2.sprite_index == obj_player2.spr_fireass)
			draw_sprite_ext(spr_noiseHUD_panic, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.Sjumpland or (obj_player2.state == states.freefallland && shake_mag > 0))
			draw_sprite_ext(spr_noiseHUD_groundpound, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == obj_player2.spr_victory or obj_player2.state == states.keyget or obj_player2.state == states.smirk or obj_player2.state == states.gottreasure or (obj_player2.state == states.bossintro && obj_player2.sprite_index == obj_player2.spr_player_levelcomplete))
			draw_sprite_ext(spr_noiseHUD_happy, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (global.combo >= 3)
			draw_sprite_ext(spr_noiseHUD_menacing, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.mach1 or obj_player2.state == states.chainsaw or obj_player2.state == states.freefallprep or obj_player2.state == states.freefall or obj_player2.state == states.tackle or obj_player2.state == states.Sjump or obj_player2.state == states.slam or obj_player2.state == states.Sjumpprep or obj_player2.state == states.grab or obj_player2.state == states.punch or obj_player2.state == states.backbreaker or obj_player2.state == states.backkick or obj_player2.state == states.uppunch or obj_player2.state == states.shoulder)
			draw_sprite_ext(spr_noiseHUD_mach1, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.mach2 or obj_player2.sprite_index == obj_player2.spr_dive or obj_player2.sprite_index == obj_player2.spr_machslideboost or obj_player2.state == states.climbwall or obj_player2.state == states.handstandjump or obj_player2.state == states.superslam)
			draw_sprite_ext(spr_noiseHUD_mach2, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.mach3 && obj_player2.sprite_index == obj_player2.spr_crazyrun)
			draw_sprite_ext(spr_noiseHUD_crazyrun, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.mach3 or obj_player2.sprite_index == obj_player2.spr_mach3boost)
			draw_sprite_ext(spr_noiseHUD_mach3, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.state == states.hurt or obj_player2.sprite_index == obj_player2.spr_bombpepend or obj_player2.sprite_index == obj_player2.spr_fireassend or obj_player2.state == states.timesup or obj_player2.state == states.bombpep or (obj_player2.state == states.bossintro && obj_player2.sprite_index == obj_player2.spr_player_bossintro) or (obj_player2.state == states.bossintro && obj_player2.sprite_index == obj_player2.spr_idle))
			draw_sprite_ext(spr_noiseHUD_hurt, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.angry == 1)
			draw_sprite_ext(spr_noiseHUD_angry, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == obj_player2.spr_hurtidle or obj_player2.sprite_index == obj_player2.spr_hurtwalk)
			draw_sprite_ext(spr_noiseHUD_lowhealth, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (global.panic == 1 or global.snickchallenge == 1 or global.miniboss == 1)
			draw_sprite_ext(spr_noiseHUD_panic, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player2.sprite_index == spr_shotgun_pullout)
			draw_sprite_ext(spr_noiseHUD_menacing, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else
			draw_sprite_ext(spr_noiseHUD_idle, -1, 125, 100, 1, 1, 1, c_white, alpha)
	}
	if (obj_player1.character == "N" && obj_player1.spotlight == 1)
	{
		if (shoving == 1)
		{
			if (image_index < 3)
				draw_sprite_ext(spr_pepinoHUD, image_index, 125, 100, 1, 1, 1, c_white, alpha)
			draw_sprite_ext(spr_noiseHUD_shove, image_index, 125, 100, 1, 1, 1, c_white, alpha)
		}
		else if (obj_player1.sprite_index == obj_player1.spr_knightpepthunder)
			draw_sprite_ext(spr_noiseHUD_thunder, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index != obj_player1.spr_knightpepstart && (obj_player1.state == states.knightpep or obj_player1.state == states.knightpepslopes))
			draw_sprite_ext(spr_noiseHUD_knight, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == obj_player1.spr_bombpepend)
			draw_sprite_ext(spr_noiseHUD_bomb, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (instance_exists(obj_itspizzatime) or obj_player1.sprite_index == obj_player1.spr_bombpepintro or obj_player1.sprite_index == obj_player1.spr_bombpeprunabouttoexplode or obj_player1.sprite_index == obj_player1.spr_bombpeprun or obj_player1.sprite_index == obj_player1.spr_fireass)
			draw_sprite_ext(spr_noiseHUD_panic, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.Sjumpland or (obj_player1.state == states.freefallland && shake_mag > 0))
			draw_sprite_ext(spr_noiseHUD_groundpound, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == obj_player1.spr_victory or obj_player1.state == states.keyget or obj_player1.state == states.smirk or obj_player1.state == states.gottreasure or (obj_player1.state == states.bossintro && obj_player1.sprite_index == obj_player1.spr_player_levelcomplete))
			draw_sprite_ext(spr_noiseHUD_happy, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (global.combo >= 3)
			draw_sprite_ext(spr_noiseHUD_menacing, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.mach1 or obj_player1.state == states.chainsaw or obj_player1.state == states.freefallprep or obj_player1.state == states.freefall or obj_player1.state == states.tackle or obj_player1.state == states.Sjump or obj_player1.state == states.slam or obj_player1.state == states.Sjumpprep or obj_player1.state == states.grab or obj_player1.state == states.punch or obj_player1.state == states.backbreaker or obj_player1.state == states.backkick or obj_player1.state == states.uppunch or obj_player1.state == states.shoulder)
			draw_sprite_ext(spr_noiseHUD_mach1, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.mach2 or obj_player1.sprite_index == obj_player1.spr_dive or obj_player1.sprite_index == obj_player1.spr_machslideboost or obj_player1.state == states.climbwall or obj_player1.state == states.handstandjump or obj_player1.state == states.superslam)
			draw_sprite_ext(spr_noiseHUD_mach2, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.mach3 && obj_player1.sprite_index == obj_player1.spr_crazyrun)
			draw_sprite_ext(spr_noiseHUD_crazyrun, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.mach3 or obj_player1.sprite_index == obj_player1.spr_mach3boost)
			draw_sprite_ext(spr_noiseHUD_mach3, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.state == states.hurt or obj_player1.sprite_index == obj_player1.spr_bombpepend or obj_player1.sprite_index == obj_player1.spr_fireassend or obj_player1.state == states.timesup or obj_player1.state == states.bombpep or (obj_player1.state == states.bossintro && obj_player1.sprite_index == obj_player1.spr_player_bossintro) or (obj_player1.state == states.bossintro && obj_player1.sprite_index == obj_player1.spr_idle))
			draw_sprite_ext(spr_noiseHUD_hurt, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.angry == 1)
			draw_sprite_ext(spr_noiseHUD_angry, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == obj_player1.spr_hurtidle or obj_player1.sprite_index == obj_player1.spr_hurtwalk)
			draw_sprite_ext(spr_noiseHUD_lowhealth, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (global.panic == 1 or global.snickchallenge == 1 or global.miniboss == 1)
			draw_sprite_ext(spr_noiseHUD_panic, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else if (obj_player1.sprite_index == spr_shotgun_pullout)
			draw_sprite_ext(spr_noiseHUD_menacing, -1, 125, 100, 1, 1, 1, c_white, alpha)
		else
			draw_sprite_ext(spr_noiseHUD_idle, -1, 125, 100, 1, 1, 1, c_white, alpha)
	}
	shader_reset()
	if (obj_player1.spotlight == 1)
	{
		if (obj_player1.movespeed < 2.4 or (!((obj_player1.state == states.mach1 or obj_player1.state == states.mach2 or obj_player1.state == states.mach3 or obj_player1.state == states.climbwall or obj_player1.state == states.machslide or obj_player1.state == states.machroll or obj_player1.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))))
			draw_sprite_ext(spr_speedbar, 0, 125, 140, 1, 1, 1, c_white, alpha)
		else if (obj_player1.movespeed >= 2.4 && obj_player1.movespeed < 4.8 && (obj_player1.state == states.mach1 or obj_player1.state == states.mach2 or obj_player1.state == states.mach3 or obj_player1.state == states.climbwall or obj_player1.state == states.machslide or obj_player1.state == states.machroll or obj_player1.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
			draw_sprite_ext(spr_speedbar, 1, 125, 140, 1, 1, 1, c_white, alpha)
		else if (obj_player1.movespeed >= 4.8 && obj_player1.movespeed < 7.2 && (obj_player1.state == states.mach1 or obj_player1.state == states.mach2 or obj_player1.state == states.mach3 or obj_player1.state == states.climbwall or obj_player1.state == states.machslide or obj_player1.state == states.machroll or obj_player1.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
			draw_sprite_ext(spr_speedbar, 2, 125, 140, 1, 1, 1, c_white, alpha)
		else if (obj_player1.movespeed >= 7.2 && obj_player1.movespeed < 9.6 && (obj_player1.state == states.mach1 or obj_player1.state == states.mach2 or obj_player1.state == states.mach3 or obj_player1.state == states.climbwall or obj_player1.state == states.machslide or obj_player1.state == states.machroll or obj_player1.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
			draw_sprite_ext(spr_speedbar, 3, 125, 140, 1, 1, 1, c_white, alpha)
		else if (obj_player1.movespeed >= 9.6 && obj_player1.movespeed < 12 && (obj_player1.state == states.mach1 or obj_player1.state == states.mach2 or obj_player1.state == states.mach3 or obj_player1.state == states.climbwall or obj_player1.state == states.machslide or obj_player1.state == states.machroll or obj_player1.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
			draw_sprite_ext(spr_speedbar, 4, 125, 140, 1, 1, 1, c_white, alpha)
		else if (obj_player1.movespeed >= 12 && (obj_player1.state == states.mach1 or obj_player1.state == states.mach2 or obj_player1.state == states.mach3 or obj_player1.state == states.climbwall or obj_player1.state == states.machslide or obj_player1.state == states.machroll or obj_player1.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
			draw_sprite_ext(spr_speedbarmax, -1, 125, 140, 1, 1, 1, c_white, alpha)
	}
	else if (obj_player2.movespeed < 2.4 or (!((obj_player2.state == states.mach1 or obj_player2.state == states.mach2 or obj_player2.state == states.mach3 or obj_player2.state == states.climbwall or obj_player2.state == states.machslide or obj_player2.state == states.machroll or obj_player2.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))))
		draw_sprite_ext(spr_speedbar, 0, 125, 140, 1, 1, 1, c_white, alpha)
	else if (obj_player2.movespeed >= 2.4 && obj_player2.movespeed < 4.8 && (obj_player2.state == states.mach1 or obj_player2.state == states.mach2 or obj_player2.state == states.mach3 or obj_player2.state == states.climbwall or obj_player2.state == states.machslide or obj_player2.state == states.machroll or obj_player2.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
		draw_sprite_ext(spr_speedbar, 1, 125, 140, 1, 1, 1, c_white, alpha)
	else if (obj_player2.movespeed >= 4.8 && obj_player2.movespeed < 7.2 && (obj_player2.state == states.mach1 or obj_player2.state == states.mach2 or obj_player2.state == states.mach3 or obj_player2.state == states.climbwall or obj_player2.state == states.machslide or obj_player2.state == states.machroll or obj_player2.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
		draw_sprite_ext(spr_speedbar, 2, 125, 140, 1, 1, 1, c_white, alpha)
	else if (obj_player2.movespeed >= 7.2 && obj_player2.movespeed < 9.6 && (obj_player2.state == states.mach1 or obj_player2.state == states.mach2 or obj_player2.state == states.mach3 or obj_player2.state == states.climbwall or obj_player2.state == states.machslide or obj_player2.state == states.machroll or obj_player2.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
		draw_sprite_ext(spr_speedbar, 3, 125, 140, 1, 1, 1, c_white, alpha)
	else if (obj_player2.movespeed >= 9.6 && obj_player2.movespeed < 12 && (obj_player2.state == states.mach1 or obj_player2.state == states.mach2 or obj_player2.state == states.mach3 or obj_player2.state == states.climbwall or obj_player2.state == states.machslide or obj_player2.state == states.machroll or obj_player2.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
		draw_sprite_ext(spr_speedbar, 4, 125, 140, 1, 1, 1, c_white, alpha)
	else if (obj_player2.movespeed >= 12 && (obj_player2.state == states.mach1 or obj_player2.state == states.mach2 or obj_player2.state == states.mach3 or obj_player2.state == states.climbwall or obj_player2.state == states.machslide or obj_player2.state == states.machroll or obj_player2.state == states.handstandjump or obj_player1.state == states.shoulderbash or obj_player1.state == states.breakdance))
		draw_sprite_ext(spr_speedbarmax, -1, 125, 140, 1, 1, 1, c_white, alpha)
	if (obj_player.y < 200 && obj_player.x < 200)
		alpha = 0.5
	else
		alpha = 1
	font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
	draw_set_font(font)
	draw_set_halign(fa_center)
	draw_set_color(c_white)
	if (global.panic == 1 or global.snickchallenge == 1 or global.miniboss == 1)
	{
		if (global.seconds < 10)
		{
			if (global.minutes < 1)
				draw_set_color(c_red)
			else
				draw_set_color(c_white)
			draw_text((random_range(1, -1) + 480), (random_range(1, -1) + 65), string_hash_to_newline(string_hash_to_newline(((string(global.minutes) + ":0") + string(global.seconds)))))
		}
		else if (global.seconds >= 10)
		{
			if (global.minutes == 0 && global.seconds <= 30)
				draw_set_color(c_red)
			else
				draw_set_color(c_white)
			draw_text((random_range(1, -1) + 480), (random_range(1, -1) + 65), string_hash_to_newline(string_hash_to_newline(((string(global.minutes) + ":") + string(global.seconds)))))
			if (global.minutes == 0 && global.seconds <= 10)
				scr_soundeffect(mu_dungeondepth)
		}
	}
	if (global.key_inv == 1)
		draw_sprite_ext(spr_key, -1, 50, 30, 1, 1, 1, c_white, alpha)
	draw_sprite_ext(spr_inv, -1, 50, 30, 1, 1, 1, c_white, alpha)
	var _score = global.collect
	var rx = 222
    var ry = 62
    var rank_ix = 0
    if (_score >= global.srank)
        rank_ix = 4
    else if (_score >= global.arank)
        rank_ix = 3
    else if (_score >= global.brank)
        rank_ix = 2
    else if (_score >= global.crank)
        rank_ix = 1
    if (previousrank != rank_ix)
    {
        previousrank = rank_ix
        rank_scale = 3
    }
    rank_scale = Approach(rank_scale, 1, 0.2)
	draw_sprite_ext(spr_ranks_hud, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, 1)
    var spr_w = sprite_get_width(spr_ranks_hudfill)
    var spr_h = sprite_get_height(spr_ranks_hudfill)
    var spr_xo = sprite_get_xoffset(spr_ranks_hudfill)
    var spr_yo = sprite_get_yoffset(spr_ranks_hudfill)
    var perc = 0
    switch rank_ix
    {
        case 4:
            perc = 1
            break
        case 3:
            perc = (_score - global.arank) / (global.srank - global.arank)
            break
        case 2:
            perc = (_score - global.brank) / (global.arank - global.brank)
            break
        case 1:
            perc = (_score - global.crank) / (global.brank - global.crank)
            break
        default:
            perc = _score / global.crank
    }

    var t = spr_h * perc
    var top = spr_h - t
    draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, top, spr_w, (spr_h - top), (rx - spr_xo), (ry - spr_yo + top))
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
}
draw_set_blend_mode(bm_normal)

