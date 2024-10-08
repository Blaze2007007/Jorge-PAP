function trocadeslimes()
{
	slimes = array_create(3)
	slimes[0] = obj_slime
	slimes[1] = obj_slimepegajoso
	slimes[2] = obj_slimemoldavel
	if(keyboard_check_pressed(ord("C")))
	{
		instance_activate_all()
		instance_change(slimes[+1],true)
		show_debug_message("objeto trocado")
	}
}