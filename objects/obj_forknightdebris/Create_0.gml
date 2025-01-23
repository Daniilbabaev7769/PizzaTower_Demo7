image_speed = 0
vsp = random_range(-5, -10)
hsp = (sign(x - obj_player.x)) * (random_range(5, 10))
grav = 0.4
if (x != obj_player.x)
    image_xscale = (-(sign(x - obj_player.x)))
depth = -1
