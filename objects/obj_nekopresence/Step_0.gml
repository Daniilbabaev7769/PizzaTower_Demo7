np_update()
var roomname = room_get_name(room)
if (room == rm_video)
	details = "Loading..."
if (room == rm_playtestdisclaimer)
{
	if (obj_playtestdisclaimer.isloaded == true)
		details = "Loaded!"
	else	
		details = "Disclaimer"
}
if (room == Realtitlescreen)
	details = "Main Menu"
if (room == characterselect)
	details = "Character Select"
if (room == Titlescreen)
	details = "Outside at Tower"
if (room == hub_room1 || room == hub_room2)
{
	details = "Hub"
	state = ""
}
if (room != rm_video && room != rm_playtestdisclaimer)
{
	if (global.snickchallenge == 0)
	{
		if (string_letters(roomname) == "entrance" || string_letters(roomname) == "entrancesecret")
		{
			details = "Finishing John Gutter"
			state = string_hash_to_newline("The Score: " + string(global.collect))
		}
		if (string_letters(roomname) == "medieval" || string_letters(roomname) == "medievalsecret")
		{
			details = "Finishing Pizzascape"
			state = string_hash_to_newline("The Score: " + string(global.collect))
		}
		if (string_letters(roomname) == "ruin" || string_letters(roomname) == "ruinsecret")
		{
			details = "Finishing The Ancient Cheese"
			state = string_hash_to_newline("The Score: " + string(global.collect))
		}
		if (string_letters(roomname) == "dungeon" || string_letters(roomname) == "dungeonsecret")
		{
			details = "Finishing Bloodsauce Dungeon"
			state = string_hash_to_newline("The Score: " + string(global.collect))
		}
}
if (global.snickchallenge == 1)
{
	details = "Snick Challenge"
	state = string_hash_to_newline("The Score: " + string(global.collect))
}
}
if (room == rank_room)
{
	details = "You Finished!"
	state = ""
}
if (string_letters(roomname) == "chateau" || string_letters(roomname) == "chateausecret")
{
	details = "Finishing Pizzascare"
	state = string_hash_to_newline("The Score: " + string(global.collect))
}
if (string_letters(roomname) == "strongcold" || string_letters(roomname) == "strongcoldsecret")
{
	details = "Finishing Strongcold"
	state = string_hash_to_newline("The Score: " + string(global.collect))
}