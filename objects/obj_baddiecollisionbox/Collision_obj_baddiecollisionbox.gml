if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID.thrown != 1 && baddieID.state != states.enemy_hit && other.baddieID.thrown == 1 && baddieID.killbyenemy && baddieID != other.id && baddieID.state != states.grabbed && (!baddieID.invincible) && baddieID.instantkillable)
{
    scr_soundeffect(sfx_punch)
    baddieID.hp -= 99
    global.combotime = 60
    var lag = 5
    baddieID.hitLag = lag
    baddieID.hitX = baddieID.x
    baddieID.hitY = baddieID.y
    baddieID.hp -= 1
    baddieID.alarm[3] = 3
    baddieID.state = states.enemy_hit
    baddieID.image_xscale = other.baddieID.image_xscale
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
    baddieID.hitvsp = -8
    baddieID.hithsp = (-other.baddieID.image_xscale) * 15
    instance_destroy(baddieID)
	instance_destroy(other.baddieID)
}