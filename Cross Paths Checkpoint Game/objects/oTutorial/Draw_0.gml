if walkTeach <= 0 && learnt < 1
{
	draw_sprite(sWalkTutor,image_index,oPlayer.x,oPlayer.y-4);
}
if jumpTeach <= 0 && learnt < 2
{
	draw_sprite(sJumpTutor,image_index,oPlayer.x,oPlayer.y-4);
}