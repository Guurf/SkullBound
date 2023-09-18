spriteAlpha = lerp(spriteAlpha,0,0.1);
spriteScale = lerp(spriteScale,1,0.1);
draw_sprite_ext(transSprite,0,oCamera.view_w_half,oCamera.view_h_half,spriteScale,spriteScale,0,c_white,spriteAlpha);