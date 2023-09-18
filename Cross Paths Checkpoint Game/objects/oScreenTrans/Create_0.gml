screen_save("Transition.png")
transSprite = sprite_add("Transition.png",0, false, false, window_get_width()/2, window_get_height()/2);
show_debug_message(sprite_get_width(transSprite));
show_debug_message(sprite_get_height(transSprite));
if file_exists(transSprite) file_delete(transSprite);

spriteScale = 0.3;
spriteAlpha = 1;