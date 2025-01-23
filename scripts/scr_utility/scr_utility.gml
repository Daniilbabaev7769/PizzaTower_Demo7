function Approach(argument0, argument1, argument2) //gml_Script_Approach
{
    if (argument0 < argument1)
    {
        argument0 += argument2
        if (argument0 > argument1)
            return argument1;
    }
    else
    {
        argument0 -= argument2
        if (argument0 < argument1)
            return argument1;
    }
    return argument0;
}
function get_milliseconds() //gml_Script_get_milliseconds
{
    return (get_timer() / 1000);
}
function trace() //gml_Script_trace
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    show_debug_message(_string)
}

function concat() //gml_Script_concat
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    return _string;
}