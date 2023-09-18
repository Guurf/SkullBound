var titleLen = (string_length(string(global.roomName[room]))*2)+64;
draw_set_color(c_black);
draw_set_alpha(drawAlpha/2);
draw_rectangle(oCamera.view_w_half-titleLen, y+50, oCamera.view_w_half+titleLen, y+20, 0);

draw_set_color(c_white);
draw_set_alpha(drawAlpha);
draw_set_halign(fa_center);
draw_set_font(fLevels);
draw_text(oCamera.view_w_half, y+20,global.roomName[room]);

draw_set_alpha(1);
draw_set_font(fMain);
