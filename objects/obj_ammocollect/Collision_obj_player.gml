if (sprite_index == spr_bulletHUD && global.bullet < 6)
{
    global.bullet += 1
    with (instance_create(x, y, obj_smallletters))
        letters = "BULLET"
    instance_destroy()
	scr_soundeffect(sfx_collectpizza)
}
if (sprite_index == spr_fuelHUD && global.fuel < 3)
{
    global.fuel += 1
    with (instance_create(x, y, obj_smallletters))
        letters = "FUEL"
    instance_destroy()
}
