image_speed = 0;
float = 0;
if collision_circle(x,y+16,28,oPlayer,0,0)
{
	if float instance_create_layer(x,y,"Gravestones",oGravestone,{sprite_index: sGravestoneFloat});
	else instance_create_layer(x,y,"Gravestones",oGravestone);
	instance_destroy();	
}