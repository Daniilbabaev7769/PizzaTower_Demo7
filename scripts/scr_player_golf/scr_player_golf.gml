function scr_player_golf() //gml_Script_scr_player_golf
{
    if (sprite_index == spr_haulingstart && image_index > (image_number - 1))
        sprite_index = spr_haulingidle
    global.combotime = 60
    if ((!instance_exists(golfid)) || golfid.state != states.golf)
        state = states.normal
}

