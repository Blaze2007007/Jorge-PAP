var _mapats = layer_tilemap_get_id("Tiles_2")

move_and_collide(x,y,_mapats)

state = ENEMYSTATES.IDLE
switch(state)
{
	case ENEMYSTATES.IDLE:
	#region
	alarm[0] = 3000
		//Contagem para troca de estados
		if(canchange == true)
		{	
			var _troca = choose(0,1)
			switch(_troca)
			{
				case 0:
				state = ENEMYSTATES.MOVING
				canchange = false
				case 1:
				//Recomeçar contagem
				canchange = false
				break
			}
		}
		
		//verificação de proximidade
		if(collision_circle(x,y,64,obj_slime,false,false) ||collision_circle(x,y,64,obj_slimepegajoso,false,false)|| collision_circle(x,y,64,obj_slimemoldavel,false,false))
		{
			state = ENEMYSTATES.ALERT
		}
		
		//sprite
		sprite_index = spr_boomba
	#endregion
	case ENEMYSTATES.MOVING:
	#region
		x += movex
		if(canchange == true)
		{
			var _troca = choose(0,1)
			switch(_troca)
			{
				case 0:
				state = ENEMYSTATES.IDLE
				canchange = false
				case 1:
				//Escolha de direção de movimento do inimigo
				var _direcao = choose(0,1)
				switch(_direcao)
				{
					case 0:
						x -= 2
					case 1:
						x += 2
				}
				canchange = false
			}
		}
		if(collision_circle(x,y,48,obj_slime,false,false))
		{
			state = ENEMYSTATES.ALERT
		}
	#endregion
	case ENEMYSTATES.ALERT:
	#region
		
		if(instance_exists(obj_slime))
		{
			my_dir = point_direction(x,y,obj_slime.x,obj_slime.y)
			movex = lengthdir_x(0.5,obj_slime.x)
		}
		if(instance_exists(obj_slimepegajoso))
		{
			my_dir = point_direction(x,y,obj_slimepegajoso.x,obj_slimepegajoso.y)
			movex = lengthdir_x(0.5,obj_slimepegajoso.x)
		}
		if(instance_exists(obj_slimemoldavel))
		{
			my_dir = point_direction(x,y,obj_slimemoldavel.x,obj_slimemoldavel.y)
			movex = lengthdir_x(0.5,obj_slimemoldavel.x)
		}
		x += movex
		
		if(!collision_circle(x,y,48,obj_slime,false,false))
		{
			state = ENEMYSTATES.IDLE
		}
		if(collision_circle(x,y,16,obj_slime,false,false))
		{
			state = ENEMYSTATES.ATTACKING
		}
	#endregion
	case ENEMYSTATES.ATTACKING:
	#region
	global.vida -= 1
	sprite_index = spr_boomba_esplosao_esquerda
	#endregion
	case ENEMYSTATES.HIT:
	#region
	global.vida -= 1
	sprite_index = spr_boomba_esplosao_esquerda
	#endregion
}