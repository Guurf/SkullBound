if state = "skull"
{
	//var closeGrave = instance_nearest(x,y,oGravestone);
	//draw_line(oPlayer.x,oPlayer.y,closeGrave.x,closeGrave.y);	
}
if place_meeting(x,y,oDoorway)
{
	draw_sprite(sUpArrow,0,x,y-18);
}

draw_self();