if ((!(place_meeting(x, y, obj_transformbarrel))) && (!instance_exists(obj_transformbarrel)) && (!(point_in_rectangle(x, y, (__view_get(e__VW.XView, 0) - 50), __view_get(e__VW.YView, 0), ((__view_get(e__VW.XView, 0) + __view_get(e__VW.WView, 0)) + 50), (__view_get(e__VW.YView, 0) + __view_get(e__VW.HView, 0))))) && obj_player.barrel == 0 && (!instance_exists(obj_barrelfloat)))
	instance_create(x, y, obj_transformbarrel)

