function scr_enemy_hit() //gml_Script_scr_enemy_hit
{
    x = hitX + (random_range(-6, 6))
    y = hitY + (random_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        state = states.enemy_stun
        vsp = hitvsp
        hsp = hithsp
        global.hit += 1
        if (other.object_index == obj_pizzaballOLD)
            global.golfhit += 1
        global.combotime = 60
        alarm[1] = 5
        stunned = 200
        thrown = 1
        state = states.enemy_stun
        if (hp < -6 && object_get_parent(object_index) != 11)
        {
            instance_destroy()
            instance_create(x, y, obj_genericpoofeffect)
        }
    }
}
