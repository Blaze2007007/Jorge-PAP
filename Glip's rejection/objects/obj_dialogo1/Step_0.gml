if(mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y - 75, obj_dialogo1))
{
image_index = image_index + 1
if(obj_dialogo1.image_index == 6 && mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y - 75, obj_dialogo1))
{
	instance_destroy(obj_dialogo1)
	instance_destroy(obj_slimepegajoso)
}
}