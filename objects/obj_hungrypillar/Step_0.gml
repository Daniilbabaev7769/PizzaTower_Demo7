with (obj_player)
{
	if (place_meeting((x + hsp), y, other.id) && state == states.handstandjump && other.hp != 0)
	{
		instance_create(other.x, other.y, obj_bangeffect)
		instance_create(other.x, other.y, obj_slapstar)
		instance_create(other.x, other.y, obj_baddiegibs)
		with (obj_camera)
		{
			shake_mag = 3
			shake_mag_acc = (3 / room_speed)
		}
		scr_soundeffect(sfx_hitenemy);
		other.sprite_index = spr_hungrypillar_angry
		other.hp -= 1
		movespeed = 3
		image_index = 0
		state = states.tackle
		sprite_index = choose(394, 393, 392, 391, 390, 389, 388)
	}
	if (place_meeting((x + hsp), y, other.id) && state == states.handstandjump && other.hp <= 0)
	{
		state = states.finishingblow
		sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
		image_index = 0
		hsp = 0
		movespeed = 0
	} 
	if (place_meeting((x + hsp), y, other.id) && instakillmove == 1)
		instance_destroy(other.id)
}
if place_meeting(x, y, obj_swordhitbox)
	instance_destroy()
if (global.snickchallenge == 1)
	instance_destroy()

