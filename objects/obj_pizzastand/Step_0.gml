if (place_meeting(x, (y - 1), obj_player) && obj_player.x >= (x - 10) && obj_player.x <= (x + 10) && (global.shroomfollow == 1 or global.cheesefollow == 1 or global.tomatofollow == 1 or global.sausagefollow == 1 or global.pineapplefollow == 1))
	obj_player.state = states.pizzathrow

