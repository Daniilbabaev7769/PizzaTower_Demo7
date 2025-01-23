var my_player = obj_player1.id
if (player_id == obj_player)
    my_player = obj_player2.id
if (my_player.state != states.backbreaker && my_player.state != states.parry)
    instance_destroy()
image_xscale = my_player.xscale
