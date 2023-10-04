if (selected)
{
	nameY+=2;
	titleY-=2;
	if nameY >= bbox_bottom+2 nameY = bbox_bottom+2;
	if titleY <= bbox_top-16 titleY = bbox_top-16;
	draw_set_halign(fa_center);
	draw_text(x,nameY,name);
	if (level != -1) draw_text(x,titleY,"Level "+string(level));
}
else 
{
	nameY = bbox_bottom-12;
	titleY = bbox_top;
}
draw_set_halign(fa_left);
draw_self();
var coin = level;
if (coin != -1) && global.coins[coin-1] > 0 draw_sprite_ext(sCoin,0,bbox_right-20,bbox_bottom-20,scale-0.1,scale-0.1,0,c_white,1);