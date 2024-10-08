if(instance_exists(obj_slime))
{
	view_visible[0] = true
	view_visible[1] = false
	x = obj_slime.x
	y = obj_slime.y
	camera_set_view_pos(view_camera[0],x-(caml*0.5),y-(cama*0.5))
}
else if(instance_exists(obj_slimepegajoso))
{
	view_visible[0] = false
	view_visible[1] = true
	x = obj_slimepegajoso.x
	y = obj_slimepegajoso.y
	camera_set_view_pos(view_camera[1],x-(caml*0.5),y-(cama*0.5))
}