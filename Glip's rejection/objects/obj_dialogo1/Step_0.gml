if(keyboard_check_pressed(vk_space))
{
image_index = image_index + 1
if(obj_dialogo1.image_index == 6 && keyboard_check(vk_space))
{
	instance_destroy(obj_dialogo1)
	instance_destroy(obj_slimepegajoso)
}
}