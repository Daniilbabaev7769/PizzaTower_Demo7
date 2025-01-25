if (!instance_exists(baddieID))
	instance_destroy()
if instance_exists(baddieID)
{
	x = baddieID.x
	y = baddieID.y
	image_xscale = baddieID.image_xscale
}
if (instance_exists(baddieID) && place_meeting(x, y, obj_player1) && obj_player1.cutscene == 0 && obj_player1.state != states.firemouth)
{
	if (baddieID.state != states.grabbed)
	{
		with (obj_player1)
		{
			if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && instakillmove == 1 && other.baddieID.state != states.grabbed)
			{
				if (state == states.mach3 && sprite_index != spr_mach3hit)
				{
					if (fightball == 0)
					{
						sprite_index = spr_mach3hit
						image_index = 0
					}
				}
				if (state == states.mach2 && grounded)
				{
					machpunchAnim = 1
					image_index = 0
				}
				other.baddieID.invtime = 25
				if (state != states.hurt)
					other.baddieID.grabbedby = 1
				else
					other.baddieID.grabbedby = 2
				scr_soundeffect(sfx_punch);
				if (state == states.mach3 || state == states.tumble || (state == states.freefall && freefallsmash > 10) || state == states.superslam || state == states.chainsawbump || state == states.punch || state == states.firemouth || state == states.knightpep || state == states.knightpepslopes || state == states.grab || state == states.shoryuken || state == states.lungeattack)
				{
			        if (!other.baddieID.killprotection)
		            {
						other.baddieID.hp -= 99
					    other.baddieID.instakilled = 1
				    }
			    }
				global.hit += 1
				global.combotime = 60
				if ((!grounded) && state != states.freefall && key_jump2)
				{
					if (state == states.mach2 or (state == states.mach3 && fightball == 0))
						sprite_index = spr_mach2jump
					suplexmove = 0
					vsp = -11
				}
				if (state != states.chainsaw)
                {
					tauntstoredmovespeed = movespeed
                    tauntstoredsprite = sprite_index
                    tauntstoredstate = state
                    tauntstoredvsp = vsp
				}
				if (state != states.lungeattack)
					var lag = 5
				else
					lag = 15
                other.baddieID.hitLag = lag
                other.baddieID.hitX = other.baddieID.x
                other.baddieID.hitY = other.baddieID.y
                other.baddieID.hp -= 1
                hitLag = lag
                hitX = x
                hitY = y
				instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect)
                other.baddieID.alarm[3] = 3
                other.baddieID.state = states.enemy_hit
                other.baddieID.image_xscale = (-xscale)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_baddiegibs)
                instance_create(x, y, obj_baddiegibs)
                instance_create(x, y, obj_baddiegibs)
                with (obj_camera)
                {
					shake_mag = 3
                    shake_mag_acc = 3 / room_speed
				} 
                if key_up
                {
					other.baddieID.hitvsp = -11
                    other.baddieID.hithsp = 0
                }
                else if key_down
                {
					other.baddieID.hitvsp = 11
                    other.baddieID.hithsp = 0
                }
                else
                {
					other.baddieID.hitvsp = -8
                    other.baddieID.hithsp = (-other.baddieID.image_xscale) * 8
                }
                state = states.chainsaw
				if global.slop
				{
					var combosound = choose(sfx_combotitle1, sfx_combotitle2, sfx_combotitle3)
					scr_soundeffect(combosound)
				}
			}
			if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && (state == states.jump or state == states.mach1 or state == states.grab) && vsp > 0 && other.baddieID.vsp >= 0 && other.baddieID.state != states.enemy_hit && sprite_index != spr_stompprep)
			{
				scr_soundeffect(sfx_stompenemy);
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
				image_index = 0
				other.baddieID.state = states.enemy_stun
				if (other.baddieID.stunned < 100)
					other.baddieID.stunned = 100
				other.baddieID.xscale = 1.4
				other.baddieID.yscale = 0.6	
				if key_jump2
				{
					instance_create(x, (y + 50), obj_stompeffect)
					stompAnim = 1
					other.baddieID.image_index = 0
					vsp = -14
					if (state != states.grab)
						sprite_index = spr_stompprep
				}
				else
				{
					instance_create(x, (y + 50), obj_stompeffect)
					stompAnim = 1
					other.baddieID.image_index = 0
					vsp = -9
					if (state != states.grab)
						sprite_index = spr_stompprep
				}
			}
			if (instance_exists(other.baddieID) && (!(y < other.baddieID.y)) && other.baddieID.state != states.punch && other.baddieID.state != states.enemy_hit && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer == 0 && other.baddieID.vsp > 0 && state != states.punch && state != states.backbreaker && state != states.tackle && state != states.superslam && other.baddieID.state != states.grabbed && state != states.machslide && state != states.freefall && state != states.mach2 && state != states.finishingblow && state != states.handstandjump && state != states.hurt && other.baddieID.state != states.chainsawbump && other.baddieID.state != states.chainsaw && state != states.mach3 && state != states.machroll && state != states.climbwall && state != states.shoulderbash && (!other.baddieID.invincible))
			{
				scr_soundeffect(sfx_bumpwall);
				other.baddieID.stuntouchbuffer = 50
				if (state != states.bombpep && state != states.mach1)
					movespeed = 0
				if (other.baddieID.object_index == obj_pizzaballOLD)
					global.golfhit += 1
				if (other.baddieID.stunned < 100)
					other.baddieID.stunned = 100
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
				other.baddieID.vsp = -5
				other.baddieID.hsp = ((-other.baddieID.image_xscale) * 2)
				other.baddieID.state = states.enemy_stun
				other.baddieID.image_index = 0
			}
			if (instance_exists(other.baddieID) && state == states.shoulderbash)
            {
				if (state != states.chainsaw)
                {
					tauntstoredmovespeed = movespeed
                    tauntstoredsprite = sprite_index
                    tauntstoredstate = state
                    tauntstoredvsp = vsp
				}
				scr_soundeffect(sfx_punch)
				var lag = 10
                other.baddieID.hitLag = lag
                other.baddieID.hitX = other.baddieID.x
                other.baddieID.hitY = other.baddieID.y
                other.baddieID.hp -= 1
                hitLag = lag
                hitX = x
                hitY = y
				instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect)
                other.baddieID.alarm[3] = 3
                other.baddieID.state = states.enemy_hit
                other.baddieID.image_xscale = (-xscale)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_baddiegibs)
                instance_create(x, y, obj_baddiegibs)
                instance_create(x, y, obj_baddiegibs)
                with (obj_camera)
                {
					shake_mag = 3
                    shake_mag_acc = 3 / room_speed
                }
				other.baddieID.hitvsp = -8
                other.baddieID.hithsp = (-other.baddieID.image_xscale) * 8
                state = states.chainsaw
				with (obj_player)
				{
					image_index = random_range(0, (image_number - 1))
                    if grounded
						sprite_index = spr_player_groundedattack
                    else
						sprite_index = spr_player_ungroundedattack
				}
			}
			if (instance_exists(other.baddieID) && state == states.handstandjump)
			{
				if (shotgunAnim == 0)
				{
					movespeed = 0
					image_index = 0
					sprite_index = spr_haulingstart
					state = states.grab
					other.baddieID.state = states.grabbed
					other.baddieID.grabbedby = 1
				}
				else
				{
					state = states.shotgun
					with (instance_create(x, y, obj_pistoleffect))
						image_xscale = other.image_xscale
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
					other.baddieID.grabbedby = 1
					instance_destroy(other.baddieID)
					instance_destroy(other.id)
					global.hit += 1
					global.combotime = 60
				}
			}
		}
	}
}
if (instance_exists(baddieID) && place_meeting(x, y, obj_player2) && obj_player2.cutscene == 0 && obj_player2.state != states.firemouth)
{
	if (baddieID.state != states.grabbed)
	{
		with (obj_player2)
		{
			if (instakillmove == 1)
			{
				if (state == states.mach3 && sprite_index != spr_mach3hit)
				{
					if (fightball == 0)
						sprite_index = spr_mach3hit
					image_index = 0
				}
				if (state == states.mach2 && grounded)
				{
					machpunchAnim = 1
					image_index = 0
				}
				if (state != states.hurt)
					other.baddieID.grabbedby = 2
				else
					other.baddieID.grabbedby = 1
				scr_soundeffect(sfx_punch);
				instance_destroy(other.baddieID)
				instance_destroy(other.id)
				global.hit += 1
				global.combotime = 60
				if ((!grounded) && state != states.freefall && key_jump2)
				{
					if (state == states.mach2 or (state == states.mach3 && fightball == 0))
						sprite_index = spr_mach2jump
					suplexmove = 0
					vsp = -11
				}
			}
			if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && (state == states.jump or state == states.mach1 or state == states.grab) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep)
			{
				scr_soundeffect(sfx_stompenemy);
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
				image_index = 0
				other.baddieID.state = states.enemy_stun
				if (other.baddieID.stunned < 100)
					other.baddieID.stunned = 100
				if key_jump2
				{
					instance_create(x, (y + 50), obj_stompeffect)
					stompAnim = 1
					other.baddieID.image_index = 0
					vsp = -14
					if (state != states.grab)
						sprite_index = spr_stompprep
				}
				else
				{
					instance_create(x, (y + 50), obj_stompeffect)
					stompAnim = 1
					other.baddieID.image_index = 0
					vsp = -9
					if (state != states.grab)
						sprite_index = spr_stompprep
				}
			}
			if (instance_exists(other.baddieID) && other.baddieID.state != states.pizzagoblin_throw && other.baddieID.vsp > 0 && state != states.tackle && state != states.superslam && state != states.machslide && state != states.freefall && state != states.mach2 && state != states.handstandjump)
			{
				scr_soundeffect(sfx_bumpwall);
				if (state != states.bombpep && state != states.mach1)
					movespeed = 0
				if (other.baddieID.object_index == obj_pizzaballOLD)
					global.golfhit += 1
				if (other.baddieID.stunned < 100)
					other.baddieID.stunned = 100
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
				other.baddieID.vsp = -5
				other.baddieID.hsp = ((-other.baddieID.image_xscale) * 2)
				other.baddieID.state = states.enemy_stun
				other.baddieID.image_index = 0
			}
			if (instance_exists(other.baddieID) && (state == states.superslam or state == states.freefall))
			{
				scr_soundeffect(sfx_hitenemy);
				global.combotime = 60
				instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs)
				other.baddieID.flash = 1
				other.baddieID.state = states.enemy_stun
				other.baddieID.hp -= 1
				if (other.baddieID.stunned < 100)
					other.baddieID.stunned = 100
				instance_create(x, y, obj_bumpeffect)
				instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect)
				if (other.baddieID.hp <= 0)
				{
					other.baddieID.stunned = 200
					other.baddieID.state = states.enemy_stun
				}
				vsp = -7
				state = states.normal;
				other.baddieID.vsp = -4
				other.baddieID.hsp = (xscale * 5)
			}
			if (instance_exists(other.baddieID) && state == states.handstandjump)
			{
				if (shotgunAnim == 0)
				{
					movespeed = 0
					image_index = 0
					sprite_index = spr_haulingstart
					state = states.grab
					other.baddieID.state = states.grabbed
					other.baddieID.grabbedby = 2
				}
				else
				{
					state = states.shotgun
					with (instance_create(x, y, obj_pistoleffect))
						image_xscale = other.image_xscale
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
					other.baddieID.grabbedby = 2
					instance_destroy(other.baddieID)
					instance_destroy(other.id)
					global.hit += 1
					global.combotime = 60
				}
			}
		}
	}
}

