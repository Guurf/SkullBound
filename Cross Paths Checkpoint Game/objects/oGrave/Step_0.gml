if collision_circle(x,y+16,28,oPlayer,0,0)
{
	audio_play_sound(snPull,1,0);
	if float instance_create_layer(x,y,"Gravestones",oGravestone,{sprite_index: sGravestoneFloat});
	else instance_create_layer(x,y,"Gravestones",oGravestone);
	instance_destroy();	
}
if float sprite_index = sGravestoneFloat;
else if sprite_index = sGravestoneFloat float = 1