draw_self();
var angle = point_direction(oPlayer.x, oPlayer.y, x, y);
draw_sprite_ext(sLine, 0, x, y, 1, 1, angle, c_white, .3);