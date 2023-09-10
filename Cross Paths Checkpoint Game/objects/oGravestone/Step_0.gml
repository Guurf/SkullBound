if image_index >= 7 sprite_index = sGravestoneActive;

if instance_number(oGravestone) > 1
{
	instance_create_layer(x,y,"Gravestones",oGrave);
	instance_destroy();	
}