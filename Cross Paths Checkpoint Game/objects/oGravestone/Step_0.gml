if image_index >= 9 && sprite_index == sGravestone sprite_index = sGravestoneActive;
else if image_index >= 8 && sprite_index == sGravestoneFloat sprite_index = sGravestoneFloatActive;
//if image_index == 6 audio_play_sound(snDing,1,0,0.5,0,0.8);
if image_index == 7 && sprite_index == sGravestone audio_play_sound(snStab,1,0);
if instance_number(oGravestone) > 1
{
	if sprite_index == sGravestoneFloat || sprite_index == sGravestoneFloatActive instance_create_layer(x,y,"Gravestones",oGrave,{sprite_index: sGravestoneFloat});
	else instance_create_layer(x,y,"Gravestones",oGrave);
	instance_destroy();	
}
