var _input = rollback_get_input()

if(_input.left)
{
	x -= 5
}
if(_input.right)
{
	x += 5
}
if(_input.up)
{
	y -= 5
}
if(_input.down)
{
	y += 5
}

image_angle = point_direction(x,y,_input.mb_x,_input.mb_y)

if(_input.fire_pressed)
{
	var _proj = instance_create_layer(x-32,y -32,layer,obj_tiro1)
	_proj.speed = 20
	_proj.direction = image_angle
	_proj.image_angle = image_angle
	_proj.player = self
}