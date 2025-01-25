function scr_enemy_grabbed() {
	if (grabbedby == 1)
	{
		image_xscale = (-obj_player1.xscale)
		stunned = 200
		obj_player1.baddiegrabbedID = id
		if (obj_player1.state == states.grabbing or obj_player1.state == states.grab or obj_player1.state == states._throw or obj_player1.state == states.slam or obj_player1.state == states.tacklecharge)
		{
			x = obj_player1.x
			if (obj_player1.sprite_index != obj_player1.spr_haulingstart)
				y = (obj_player1.y - 40)
			else if (floor(obj_player1.image_index) == 0)
				y = obj_player1.y
			else if (floor(obj_player1.image_index) == 1)
				y = (obj_player1.y - 10)
			else if (floor(obj_player1.image_index) == 2)
				y = (obj_player1.y - 20)
			else if (floor(obj_player1.image_index) == 3)
				y = (obj_player1.y - 30)
			image_xscale = (-obj_player1.xscale)
		}
		with (obj_player1)
		{
			suplexhavetomash = (other.hp - 1)
			scr_getinput()
			move = (key_left2 + key_right2)
			if (key_slap && sprite_index == spr_grab)
			{
				global.hit += 1
				if (other.object_index == obj_pizzaballOLD)
					global.golfhit += 1
				global.combotime = 60
				image_index = 0
				sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
				other.hp -= 1
				instance_create(other.x, other.y, obj_slapstar)
				instance_create(other.x, other.y, obj_baddiegibs)
				other.flash = 1
				with (obj_camera)
				{
					shake_mag = 3
					shake_mag_acc = (3 / room_speed)
				}
			}
			if (!((state == states.grab or state == states.chainsaw or state == states.finishingblow or state == states.grabbing or state == states._throw or state == states.slam or state == states.tacklecharge or state == states.punch or state == states.superslam or state == states.backkick or state == states.uppunch or state == states.shoulder)))
			{
				other.x = x
				other.y = y
				other.state = states.enemy_stun
				other.image_index = 0
			}
		}
		hsp = 0
		if (obj_player1.state == states.punch)
		{
			var lag = 5
            hitLag = lag
            hitX = x
            hitY = y
            if (object_index != obj_noisey)
                hp -= 5
            else
                hp -= 1
            obj_player.hitLag = lag
            obj_player.hitX = obj_player.x
            obj_player.hitY = obj_player.y
			instance_create(x, y, obj_parryeffect)
			instance_create((x + (obj_player1.xscale * 30)), y, obj_bumpeffect)
            alarm[3] = 3
            global.combotime = 60
            state = states.enemy_hit
            image_xscale = (-obj_player.xscale)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_baddiegibs)
			hithsp = ((-image_xscale) * 25)
			hitvsp = -5
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (obj_player1.state == states.finishingblow && obj_player1.image_index < 5)
		{
			x = (obj_player1.x + (obj_player1.xscale * 60))
			y = obj_player1.y
		}
		if (obj_player1.state == states.backkick)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 1
			instance_create((x + ((-obj_player1.xscale) * 50)), y, obj_bumpeffect)
			alarm[1] = 5
			thrown = 1
			x = obj_player1.x
			y = obj_player1.y
			state = states.enemy_stun
			image_xscale *= -1
			hsp = ((-image_xscale) * 20)
			vsp = -7
			global.combotime = 60
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (obj_player1.state == states.shoulder)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 1
			instance_create(x, (y + 20), obj_bumpeffect)
			alarm[1] = 5
			thrown = 1
			x = obj_player1.x
			y = obj_player1.y
			state = states.enemy_stun
			if (obj_player1.sprite_index == spr_player_shoulder)
				vsp = 15
			if (obj_player1.sprite_index == spr_player_diagonaldownthrow)
			{
				hsp = ((-image_xscale) * 10)
				vsp = 15
			}
			if (obj_player1.sprite_index == spr_player_diagonalupthrow)
			{
				hsp = ((-image_xscale) * 10)
				vsp = -15
			}
			global.combotime = 60
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		if place_meeting(x, y, obj_swordhitbox)
        {
            var lag = 5
            hitLag = lag
            hitX = x
            hitY = y
            if (object_index != obj_noisey)
                hp -= 5
            else
                hp -= 1
            obj_player.hitLag = lag
            obj_player.hitX = obj_player.x
            obj_player.hitY = obj_player.y
			instance_create(x, y, obj_parryeffect)
            alarm[3] = 1
            global.combotime = 60
            state = states.enemy_hit
            image_xscale = (-obj_player.xscale)
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
            with (obj_player1)
            {
                if (sprite_index == spr_uppercutfinishingblow)
                {
                    other.hithsp = 0
                    other.hitvsp = -25
                }
                else
                {
                    other.hithsp = (-other.image_xscale) * 25
                    other.hitvsp = -6
                }
            }
            check_grabbed_solid(obj_player)
            check_grabbed_solid(obj_player)
        }
		if (obj_player1.state == states._throw)
		{
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			alarm[1] = 5
			thrown = 1
			x = obj_player1.x
			y = obj_player1.y
			state = states.enemy_stun
			hsp = ((-image_xscale) * 8)
			vsp = -6
		}
		if (obj_player1.state == states.uppunch)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 1
			instance_create((x + ((-obj_player1.xscale) * 15)), (y - 50), obj_bumpeffect)
			alarm[1] = 5
			thrown = 1
			x = obj_player1.x
			y = obj_player1.y
			hsp = ((-image_xscale) * 2)
			state = states.enemy_stun
			vsp = -20
			global.combotime = 60
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (obj_player1.state == states.tacklecharge)
		{
			x = (obj_player1.x + (obj_player1.xscale * 15))
			y = obj_player1.y
		}
		if (obj_player.state == states.superslam || (obj_player.state == states.chainsaw && sprite_index == spr_player_piledriver))
		{
			if (obj_player1.character == "P")
			{
				if (obj_player.sprite_index != obj_player.spr_piledriverland)
                {
				if (floor(obj_player1.image_index) == 0)
				{
					depth = 0
					x = (obj_player1.x + (obj_player1.xscale * 10))
					y = obj_player1.y
				}
				if (floor(obj_player1.image_index) == 1)
				{
					depth = 0
					x = (obj_player1.x + (obj_player1.xscale * 5))
					y = obj_player1.y
				}
				if (floor(obj_player1.image_index) == 2)
				{
					depth = 0
					x = obj_player1.x
					y = obj_player1.y
				}
				if (floor(obj_player1.image_index) == 3)
				{
					depth = 0
					x = (obj_player1.x + (obj_player1.xscale * -5))
					y = obj_player1.y
				}
				if (floor(obj_player1.image_index) == 4)
				{
					depth = 0
					x = (obj_player1.x + (obj_player1.xscale * -10))
					y = obj_player1.y
				}
				if (floor(obj_player1.image_index) == 5)
				{
					depth = -8
					x = (obj_player1.x + (obj_player1.xscale * -5))
					y = obj_player1.y
				}
				if (floor(obj_player1.image_index) == 6)
				{
					depth = -8
					x = obj_player1.x
					y = obj_player1.y
				}
				if (floor(obj_player1.image_index) == 7)
				{
					depth = -8
					x = (obj_player1.x + (obj_player1.xscale * 5))
					y = obj_player1.y
				}
				check_grabbed_solid(obj_player)
			}
			else
                {
                    x = obj_player.x + obj_player.xscale * 10
                    y = obj_player.y
                    check_grabbed_solid(obj_player)
                }
            }
            else
            {
                depth = -7
                x = obj_player.x
                y = obj_player.y - 40
            }
        }
		if (obj_player.sprite_index == obj_player.spr_piledriverland && floor(obj_player.image_index) == (obj_player.image_number - 1))
        {
            lag = 5
            hitLag = lag
            hitX = x
            hitY = y
            hp -= 99
            obj_player.hitLag = lag
            obj_player.hitX = obj_player.x
            obj_player.hitY = obj_player.y
			instance_create(obj_player.x, obj_player.y, obj_parryeffect)
            alarm[3] = 3
            state = states.enemy_hit
            image_xscale = (-obj_player.xscale)
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
            with (obj_player)
            {
                if (state != states.chainsaw)
                {
                    tauntstoredmovespeed = movespeed
                    tauntstoredsprite = sprite_index
                    tauntstoredstate = state
                    tauntstoredvsp = vsp
                }
                state = states.chainsaw
                other.hithsp = (-other.image_xscale) * 8
                other.hitvsp = -11
            }
		}
		if (obj_player1.state == states.grab && obj_player1.sprite_index == obj_player1.spr_swingding)
		{
			if (floor(obj_player1.image_index) == 0)
			{
				depth = -8
				x = (obj_player1.x + (obj_player1.xscale * 25))
				y = obj_player1.y
			}
			if (floor(obj_player1.image_index) == 1)
			{
				depth = -8
				x = obj_player1.x
				y = obj_player1.y
			}
			if (floor(obj_player1.image_index) == 2)
			{
				depth = -8
				x = (obj_player1.x + (obj_player1.xscale * -25))
				y = obj_player1.y
			}
			if (floor(obj_player1.image_index) == 3)
			{
				depth = 0
				x = (obj_player1.x + (obj_player1.xscale * -50))
				y = obj_player1.y
			}
			if (floor(obj_player1.image_index) == 4)
			{
				depth = 0
				x = (obj_player1.x + (obj_player1.xscale * -25))
				y = obj_player1.y
			}
			if (floor(obj_player1.image_index) == 5)
			{
				depth = 0
				x = obj_player1.x
				y = obj_player1.y
			}
			if (floor(obj_player1.image_index) == 6)
			{
				depth = 0
				x = (obj_player1.x + (obj_player1.xscale * 25))
				y = obj_player1.y
			}
			if (floor(obj_player1.image_index) == 7)
			{
				depth = 0
				x = (obj_player1.x + (obj_player1.xscale * 50))
				y = obj_player1.y
			}
		}
		if (state != states.grabbed || obj_player.state != states.grab)
        {
            check_grabbed_solid(obj_player)
            if (state == states.enemy_hit)
            {
                hitX = x
                hitY = y
            }
        }
	}
	if (grabbedby == 2)
	{
		image_xscale = (-obj_player2.xscale)
		stunned = 200
		obj_player2.baddiegrabbedID = id
		if (obj_player2.state == states.grabbing or obj_player2.state == states.grab or obj_player2.state == states._throw or obj_player2.state == states.slam or obj_player2.state == states.tacklecharge)
		{
			x = obj_player2.x
			if (obj_player2.sprite_index != obj_player2.spr_haulingstart)
				y = (obj_player2.y - 40)
			else if (floor(obj_player2.image_index) == 0)
				y = obj_player2.y
			else if (floor(obj_player2.image_index) == 1)
				y = (obj_player2.y - 10)
			else if (floor(obj_player2.image_index) == 2)
				y = (obj_player2.y - 20)
			else if (floor(obj_player2.image_index) == 3)
				y = (obj_player2.y - 30)
			image_xscale = (-obj_player2.xscale)
		}
		with (obj_player2)
		{
			suplexhavetomash = (other.hp - 1)
			scr_getinput()
			move = (key_left2 + key_right2)
			if (key_slap && sprite_index == spr_grab)
			{
				global.hit += 1
				if (other.object_index == obj_pizzaballOLD)
					global.golfhit += 1
				global.combotime = 60
				image_index = 0
				sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
				other.hp -= 1
				instance_create(other.x, other.y, obj_slapstar)
				instance_create(other.x, other.y, obj_baddiegibs)
				other.flash = 1
				with (obj_camera)
				{
					shake_mag = 3
					shake_mag_acc = (3 / room_speed)
				}
			}
			if (!((state == states.grab or state == states.finishingblow or state == states.grabbing or state == states._throw or state == states.slam or state == states.tacklecharge or state == states.punch or state == states.superslam or state == states.backkick or state == states.uppunch or state == states.shoulder)))
			{
				other.x = x
				other.y = y
				other.state = states.enemy_stun
				other.image_index = 0
			}
		}
		hsp = 0
		if (obj_player2.state == states.punch)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 1
			instance_create((x + (obj_player2.xscale * 30)), y, obj_bumpeffect)
			alarm[1] = 5
			thrown = 1
			x = obj_player2.x
			vsp = 0
			y = obj_player2.y
			state = states.enemy_stun
			hsp = ((-image_xscale) * 25)
			grav = 0
			global.combotime = 60
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (obj_player2.state == states.finishingblow && obj_player2.image_index < 5)
		{
			x = (obj_player2.x + (obj_player2.xscale * 60))
			y = obj_player2.y
		}
		if (obj_player2.state == states.backkick)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 1
			instance_create((x + ((-obj_player2.xscale) * 50)), y, obj_bumpeffect)
			alarm[1] = 5
			thrown = 1
			x = obj_player2.x
			y = obj_player2.y
			state = states.enemy_stun
			image_xscale *= -1
			hsp = ((-image_xscale) * 20)
			vsp = -7
			global.combotime = 60
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (obj_player2.state == states.shoulder)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 1
			instance_create(x, (y + 20), obj_bumpeffect)
			alarm[1] = 5
			thrown = 1
			x = obj_player2.x
			y = obj_player2.y
			state = states.enemy_stun
			if (obj_player2.sprite_index == spr_player_shoulder)
				vsp = 15
			if (obj_player2.sprite_index == spr_player_diagonaldownthrow)
			{
				hsp = ((-image_xscale) * 10)
				vsp = 15
			}
			if (obj_player2.sprite_index == spr_player_diagonalupthrow)
			{
				hsp = ((-image_xscale) * 10)
				vsp = -15
			}
			global.combotime = 60
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		if place_meeting(x, y, obj_swordhitbox)
		{
			hp -= 1
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			instance_create(x, y, obj_baddiegibs)
			instance_create(x, y, obj_baddiegibs)
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			global.combotime = 60
			alarm[1] = 5
			thrown = 1
			state = states.enemy_stun
			with (obj_player2)
			{
				move = (key_right + key_left)
				if (sprite_index == spr_uppercutfinishingblow)
				{
					other.hsp = 0
					other.vsp = -25
				}
				else
				{
					other.hsp = ((-other.image_xscale) * 25)
					other.vsp = -6
				}
			}
		}
		if (obj_player2.state == states._throw)
		{
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			alarm[1] = 5
			thrown = 1
			x = obj_player2.x
			y = obj_player2.y
			state = states.enemy_stun
			hsp = ((-image_xscale) * 8)
			vsp = -6
		}
		if (obj_player2.state == states.uppunch)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaballOLD)
				global.golfhit += 1
			hp -= 1
			instance_create((x + ((-obj_player2.xscale) * 15)), (y - 50), obj_bumpeffect)
			alarm[1] = 5
			thrown = 1
			x = obj_player2.x
			y = obj_player2.y
			hsp = ((-image_xscale) * 2)
			state = states.enemy_stun
			vsp = -20
			global.combotime = 60
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (obj_player2.state == states.tacklecharge)
		{
			x = (obj_player2.x + (obj_player2.xscale * 15))
			y = obj_player2.y
		}
		if (obj_player2.state == states.superslam && obj_player2.sprite_index == obj_player2.spr_piledriver)
		{
			if (obj_player2.character == "P")
			{
				if (floor(obj_player2.image_index) == 0)
				{
					depth = 0
					x = (obj_player2.x + (obj_player2.xscale * 10))
					y = obj_player2.y
				}
				if (floor(obj_player2.image_index) == 1)
				{
					depth = 0
					x = (obj_player2.x + (obj_player2.xscale * 5))
					y = obj_player2.y
				}
				if (floor(obj_player2.image_index) == 2)
				{
					depth = 0
					x = obj_player2.x
					y = obj_player2.y
				}
				if (floor(obj_player2.image_index) == 3)
				{
					depth = 0
					x = (obj_player2.x + (obj_player2.xscale * -5))
					y = obj_player2.y
				}
				if (floor(obj_player2.image_index) == 4)
				{
					depth = 0
					x = (obj_player2.x + (obj_player2.xscale * -10))
					y = obj_player2.y
				}
				if (floor(obj_player2.image_index) == 5)
				{
					depth = -8
					x = (obj_player2.x + (obj_player2.xscale * -5))
					y = obj_player2.y
				}
				if (floor(obj_player2.image_index) == 6)
				{
					depth = -8
					x = obj_player2.x
					y = obj_player2.y
				}
				if (floor(obj_player2.image_index) == 7)
				{
					depth = -8
					x = (obj_player2.x + (obj_player2.xscale * 5))
					y = obj_player2.y
				}
			}
			else
			{
				depth = -7
				x = obj_player2.x
				y = (obj_player2.y - 40)
			}
		}
		if (obj_player2.sprite_index == obj_player2.spr_piledriverland && floor(obj_player2.image_index) == (obj_player2.image_number - 1))
		{
			with (obj_player2)
			{
				state = states.jump
				vsp = -8
				sprite_index = spr_machfreefall
			}
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			global.combotime = 60
			global.hit += 1
			hp -= 5
			alarm[1] = 5
			thrown = 1
			x = obj_player2.x
			y = obj_player2.y
			state = states.enemy_stun
			hsp = ((-image_xscale) * 10)
			vsp = -10
		}
		if (obj_player2.state == states.grab && obj_player2.sprite_index == obj_player2.spr_swingding)
		{
			if (floor(obj_player2.image_index) == 0)
			{
				depth = -8
				x = (obj_player2.x + (obj_player2.xscale * 25))
				y = obj_player2.y
			}
			if (floor(obj_player2.image_index) == 1)
			{
				depth = -8
				x = obj_player2.x
				y = obj_player2.y
			}
			if (floor(obj_player2.image_index) == 2)
			{
				depth = -8
				x = (obj_player2.x + (obj_player2.xscale * -25))
				y = obj_player2.y
			}
			if (floor(obj_player2.image_index) == 3)
			{
				depth = 0
				x = (obj_player2.x + (obj_player2.xscale * -50))
				y = obj_player2.y
			}
			if (floor(obj_player2.image_index) == 4)
			{
				depth = 0
				x = (obj_player2.x + (obj_player2.xscale * -25))
				y = obj_player2.y
			}
			if (floor(obj_player2.image_index) == 5)
			{
				depth = 0
				x = obj_player2.x
				y = obj_player2.y
			}
			if (floor(obj_player2.image_index) == 6)
			{
				depth = 0
				x = (obj_player2.x + (obj_player2.xscale * 25))
				y = obj_player2.y
			}
			if (floor(obj_player2.image_index) == 7)
			{
				depth = 0
				x = (obj_player2.x + (obj_player2.xscale * 50))
				y = obj_player2.y
			}
		}
	}
	sprite_index = grabbedspr
	image_speed = 0.35



}

function check_grabbed_solid(argument0) //gml_Script_check_grabbed_solid
{
	if instakilled
		return;
    if ((!(place_meeting(x, y, obj_destructibles))) && (scr_solid(x, y) || collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true) != -4))
    {
        var _dist = abs(x - obj_player.x)
        x = argument0.x
        y = argument0.y
        if (!(scr_solid((x + argument0.xscale), y)))
        {
            var i = 0
            while (!(scr_solid((x + argument0.xscale), y)))
            {
                x += argument0.xscale
                i++
                if (i > _dist)
                    break
            }
            if scr_solid(x, y)
            {
                i = 0
                while scr_solid(x, y)
                {
                    x -= argument0.xscale
                    i++
                    if (i > _dist)
                        break
                }
            }
        }
    }
}