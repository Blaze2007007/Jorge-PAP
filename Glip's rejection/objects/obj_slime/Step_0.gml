//Obter teclas pressionadas
var _direita = keyboard_check(vk_right) or keyboard_check(ord("D"))
var _esquerda = keyboard_check(vk_left) or keyboard_check(ord("A"))
var _cima = keyboard_check(vk_up) or keyboard_check(ord("W"))
var _baixo = keyboard_check(vk_down) or keyboard_check(ord("S"))

var _mapats = layer_tilemap_get_id("Tiles_2")

actual_delta = delta_time/1000000
delta_multiplier = actual_delta/target_delta

//Para onde nos mexemos horizontalmente
velx = (_direita - _esquerda) * slimevel * delta_multiplier

//"" verticalmente
vely = vely + grv
if(place_meeting(x,y+2,_mapats))
{
	vely = 0
if(_cima)
{
vely = salto * grv
}
}else if(vely < 10)
{
	vely += 1
}
if(_baixo)
{
vely = vely + 5
}
move_and_collide(velx,vely,_mapats)

if(_direita)
{
	sprite_index = spr_slimenormal_esquerda
}
if(_esquerda)
{
	sprite_index = spr_slimenormal_direita
}
if(velx == 0)
{
	sprite_index = spr_slimenormal
}

if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y - 75, obj_clicavel) && ativardialogo == true) 
{
	obj_dialogo1.visible = true
	obj_dialogo1.image_speed = 0
	obj_dialogo1.image_index = 0
	show_debug_message("tocado")
}
if(instance_exists(obj_dialogo1) == false)
{
trocadeslimes()
}
if(place_meeting(x,y,obj_centro) && keyboard_check_pressed(ord("C")))
{
	room_goto_next()
	obj_slime.x = 170
	obj_slime.y = 600
}