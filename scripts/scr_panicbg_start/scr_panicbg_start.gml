function scr_panicbg_start() {
	if ((!variable_global_exists("panicbg_surface")) or (!surface_exists(global.panicbg_surface)))
		global.panicbg_surface = surface_create(__view_get(e__VW.WView, 0), __view_get(e__VW.HView, 0))
	if (event_type == 8 && event_number == 0)
	{
		surface_set_target(global.panicbg_surface)
		draw_clear_alpha(c_black, 0)
		var _cam_x = camera_get_view_x(__view_get( e__VW.Camera, 0 ))
		var _cam_y = camera_get_view_y(__view_get( e__VW.Camera, 0 ))
		var bg1 = layer_get_id("Backgrounds_1")
		var bg2 = layer_get_id("Backgrounds_2")
		var bg3 = layer_get_id("Backgrounds_3")
		layer_x(bg1, (layer_get_x(bg1) - _cam_x))
		layer_y(bg1, (layer_get_y(bg1) - _cam_y))
		layer_x(bg2, (layer_get_x(bg2) - _cam_x))
		layer_y(bg2, (layer_get_y(bg2) - _cam_y))
		layer_x(bg3, (layer_get_x(bg3) - _cam_x))
		layer_y(bg3, (layer_get_y(bg3) - _cam_y))
	}



}
