function scr_collide_destructibles() {
	with (obj_player1)
	{
		if (state == states.mach2 or state == states.mach3 or state == states.machroll or state == states.knightpepslopes or state == states.tumble or state == states.hookshot or state == states.tacklecharge or (state == states.fireass && sprite_index == spr_player_fireassdash && sprite_index == spr_player_fireassdashfall) or state == states.breakdance or state == states.slipnslide)
		{
			if place_meeting((x + hsp), y, obj_destructibles)
			{
				with (instance_place((x + hsp), y, obj_destructibles))
					instance_destroy()
				if (state == states.mach2)
					machpunchAnim = 1
			}
		}
		if (state == states.hurt && thrown == 1)
		{
			if place_meeting((x - hsp), y, obj_destructibles)
			{
				with (instance_place((x - hsp), y, obj_destructibles))
					instance_destroy()
			}
		}
		if ((state == states.knightpep or state == states.superslam or state == states.hookshot) && vsp > 0)
		{
			if place_meeting(x, (y + 1), obj_destructibles)
			{
				with (instance_place(x, (y + 1), obj_destructibles))
					instance_destroy()
			}
		}
		if place_meeting(x, (y + 1), obj_destructibleplatform)
		{
			with (instance_place(x, (y + 1), obj_destructibleplatform))
			{
				falling = 1
				if (falling == 1)
					image_speed = 0.35
			}
		}
		if (vsp <= 0.5 && (state == states.jump or state == states.climbwall or state == states.fireass or state == states.Sjump or state == states.mach2 or state == states.mach3 or state == states.shoryuken))
		{
			if place_meeting(x, (y - 1), obj_destructibles)
			{
				with (instance_place(x, (y - 1), obj_destructibles))
				{
					instance_destroy()
					with (other.id)
					{
						if (state != states.Sjump && state != states.climbwall && state != states.shoryuken)
							vsp = 0
					}
				}
			}
		}
		if (vsp >= 0 && (state == states.freefall or state == states.freefallland))
		{
			if place_meeting(x, ((y + vsp) + 2), obj_destructibles)
			{
				with (instance_place(x, ((y + vsp) + 2), obj_destructibles))
				{
					with (obj_player1)
					{
						if (place_meeting(x, ((y + vsp) + 2), obj_bigdestructibles) && freefallsmash < 10)
						{
							if (shotgunAnim == 0)
								sprite_index = spr_bodyslamland
							else
								sprite_index = spr_shotgunjump2
							state = states.freefallland
							image_index = 0
						}
					}
					instance_destroy()
				}
			}
		}
		if (state == states.freefall or state == states.freefallland)
		{
			if (place_meeting(x, (y + 1), obj_metalblock) && freefallsmash > 10)
			{
				with (instance_place(x, (y + 1), obj_metalblock))
					instance_destroy()
			}
		}
		if (state == states.handstandjump or state == states.shoulderbash)
		{
			with (obj_destructibles)
			{
				if place_meeting((x - obj_player1.hsp), y, obj_player1)
				{
					with (obj_player1)
					{
						if place_meeting((x + hsp), y, obj_bigdestructibles)
						{
							if (shotgunAnim == 0)
							{
								sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
								image_index = 0
								state = states.tackle
								movespeed = 3
								vsp = -3
								instance_destroy(other.id)
							}
							else
							{
								state = states.shotgun
								image_index = 0
								sprite_index = spr_shotgunshoot
								if (character == "P")
								{
									instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet)
									with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
										spdh = 4
									with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
										spdh = -4
								}
								instance_destroy(other.id)
							}
						}
						else if (other.object_index != obj_bigdestructibles)
							instance_destroy(other.id)
					}
				}
			}
		}
		with (obj_baddie)
		{
			if (place_meeting((x + hsp), y, obj_destructibles) && thrown == 1)
				instance_destroy(instance_place((x + hsp), y, obj_destructibles))
			if (place_meeting(x, (y + vsp), obj_destructibles) && thrown == 1)
				instance_destroy(instance_place((x + vsp), y, obj_destructibles))
		}
	}
	with (obj_player2)
	{
		if (state == states.hurt && thrown == 1)
		{
			if place_meeting((x - hsp), y, obj_destructibles)
			{
				with (instance_place((x - hsp), y, obj_destructibles))
					instance_destroy()
			}
		}
		if (state == states.mach2 or state == states.mach3 or state == states.machroll or state == states.knightpepslopes or state == states.tumble or state == states.hookshot)
		{
			if place_meeting((x + hsp), y, obj_destructibles)
			{
				with (instance_place((x + hsp), y, obj_destructibles))
					instance_destroy()
				if (state == states.mach2)
					machpunchAnim = 1
			}
		}
		if ((state == states.knightpep or state == states.superslam or state == states.hookshot) && vsp > 0)
		{
			if place_meeting(x, (y + 1), obj_destructibles)
			{
				with (instance_place(x, (y + 1), obj_destructibles))
					instance_destroy()
			}
		}
		if place_meeting(x, (y + 1), obj_destructibleplatform)
		{
			with (instance_place(x, (y + 1), obj_destructibleplatform))
			{
				falling = 1
				if (falling == 1)
					image_speed = 0.35
			}
		}
		if (vsp <= 0.5 && (state == states.jump or state == states.climbwall or state == states.fireass or state == states.Sjump or state == states.mach2 or state == states.mach3))
		{
			if place_meeting(x, (y - 1), obj_destructibles)
			{
				with (instance_place(x, (y - 1), obj_destructibles))
				{
					instance_destroy()
					with (other.id)
					{
						if (state != states.Sjump && state != states.climbwall)
							vsp = 0
					}
				}
			}
		}
		if (vsp >= 0 && (state == states.freefall or state == states.freefallland))
		{
			if place_meeting(x, ((y + vsp) + 2), obj_destructibles)
			{
				with (instance_place(x, ((y + vsp) + 2), obj_destructibles))
				{
					with (obj_player2)
					{
						if place_meeting(x, ((y + vsp) + 2), obj_bigdestructibles)
						{
							if (shotgunAnim == 0)
								sprite_index = spr_bodyslamland
							else
								sprite_index = spr_shotgunjump2
							state = states.freefallland
							image_index = 0
						}
					}
					instance_destroy()
				}
			}
		}
		if (state == states.freefall or state == states.freefallland)
		{
			if (place_meeting(x, (y + 1), obj_metalblock) && freefallsmash > 10)
			{
				with (instance_place(x, (y + 1), obj_metalblock))
					instance_destroy()
			}
		}
		if (state == states.handstandjump)
		{
			with (obj_destructibles)
			{
				if place_meeting((x - obj_player2.hsp), y, obj_player2)
				{
					with (obj_player2)
					{
						if place_meeting((x + hsp), y, obj_bigdestructibles)
						{
							if (shotgunAnim == 0)
							{
								sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
								image_index = 0
								state = states.tackle
								movespeed = 3
								vsp = -3
								instance_destroy(other.id)
							}
							else
							{
								state = states.shotgun
								image_index = 0
								sprite_index = spr_shotgunshoot
								if (character == "P")
								{
									instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet)
									with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
										spdh = 4
									with (instance_create((x + (image_xscale * 20)), (y + 20), obj_shotgunbullet))
										spdh = -4
								}
								instance_destroy(other.id)
							}
						}
						else if (other.object_index != obj_bigdestructibles)
							instance_destroy(other.id)
					}
				}
			}
		}
		with (obj_baddie)
		{
			if (place_meeting((x + hsp), y, obj_destructibles) && thrown == 1)
				instance_destroy(instance_place((x + hsp), y, obj_destructibles))
			if (place_meeting(x, (y + vsp), obj_destructibles) && thrown == 1)
				instance_destroy(instance_place((x + vsp), y, obj_destructibles))
		}
	}



}
