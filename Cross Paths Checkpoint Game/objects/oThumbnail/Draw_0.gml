if (selected)
{
	nameY+=2;
	titleY-=2;
	if nameY >= bbox_bottom+2 nameY = bbox_bottom+2;
	if titleY <= bbox_top-16 titleY = bbox_top-16;
	draw_set_halign(fa_center);
	draw_text(x,nameY,name);
	draw_text(x,titleY,level);
}
else 
{
	nameY = bbox_bottom-12;
	titleY = bbox_top;
}
draw_set_halign(fa_left);
draw_self();