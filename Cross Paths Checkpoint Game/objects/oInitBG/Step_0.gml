if room== rInit && oGuurf.image_index > 60 room_goto(rMenu);
if room != rInit y = lerp(y,-10,0.06);
if y <= 0 instance_destroy();