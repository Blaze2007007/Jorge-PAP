function Atacar_Inimigos(dano_inimigo)
{
	if(place_meeting(x,y,obj_inimigo) && obj_slime.sprite_index == obj_slime.sprite_ataque)
	{
		Enemy_hp -= dano_inimigo
	}
}