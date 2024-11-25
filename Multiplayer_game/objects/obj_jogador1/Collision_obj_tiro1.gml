if(other.player == self)
{
	return
}

effect_create_above(ef_ring,x,y,0,c_lime)

x = irandom_range(40,room_width-40)
y = irandom_range(40,room_height-40)

instance_destroy(other)