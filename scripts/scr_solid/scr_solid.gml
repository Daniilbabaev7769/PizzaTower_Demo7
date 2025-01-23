function scr_solid(argument0, argument1)
{
	var old_x = x
	var old_y = y
	x = argument0
	y = argument1
	
	// walls
	if place_meeting(x, y, obj_solid)
	{
		x = old_x
		y = old_y
		return true;
	}
	
	// platforms
	if (y > old_y && (bbox_bottom % 16) == 0 && (!(place_meeting(x, old_y, obj_platform))) && place_meeting(x, y, obj_platform))
	{
		x = old_x
		y = old_y
		return true;
	}
	
	// slopes
	var slope = instance_place(x, y, obj_slope)
	if slope
	{
		with (slope)
		{
			var object_side = 0
			var slope_start = 0
			var slope_end = 0
			if (image_xscale > 0)
			{
				object_side = other.bbox_right
				slope_start = bbox_bottom
				slope_end = bbox_top
			}
			else
			{
				object_side = other.bbox_left
				slope_start = bbox_top
				slope_end = bbox_bottom
			}
			var m = ((sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left))
			slope = (slope_start - round((m * (object_side - bbox_left))))
			if (other.bbox_bottom >= slope)
			{
				other.x = old_x
				other.y = old_y
				return true;
			}
		}
	}
	
	x = old_x
	y = old_y
	return false;
}

function check_slope(argument0) //gml_Script_check_slope
{
    var slope = instance_place(x, y, argument0)
    if slope
    {
        with (slope)
        {
            var object_side = 0
            var slope_start = 0
            var slope_end = 0
            if (image_xscale > 0)
            {
                object_side = other.bbox_right
                slope_start = bbox_bottom
                slope_end = bbox_top
            }
            else
            {
                object_side = other.bbox_left
                slope_start = bbox_top
                slope_end = bbox_bottom
            }
            var m = sign(image_xscale) * (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
            slope = slope_start - (round(m * (object_side - bbox_left)))
            if (other.bbox_bottom >= slope)
                return 1;
        }
    }
    return 0;
}

function scr_solid_slope(argument0, argument1) //gml_Script_scr_solid_slope
{
    var old_x = x
    var old_y = y
    x = argument0
    y = argument1
    if check_slope(obj_slope)
    {
        var inst = instance_place(x, y, obj_slope)
        if (sign(inst.image_xscale) != xscale)
        {
            x = old_x
            y = old_y
            return 1;
        }
    }
    x = old_x
    y = old_y
    return 0;
}