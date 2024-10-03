function trocadeslimes()
{
	if(instance_exists(obj_dialogo1) == false)
	{
		trocavel = true
		show_debug_message("dialogo acabado")
		if(keyboard_check_pressed(ord("F")))
		{
			instance_change(obj_slimepegajoso,true)
			instance_activate_object(obj_slimepegajoso)
			obj_slimepegajoso.visible = true
			show_debug_message("objeto trocado")
		}
	}
}