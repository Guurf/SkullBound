currentRoom = room;
draw_set_font(fMain);
if !audio_is_playing(snMusic) audio_play_sound(snMusic, 1, 1);
global.coins = [0, 0, 0, 0, 0, 0, 0, 0, 0];
global.roomName =
[
	"Init",
	"Menu",
	"Level Select",
	"''A Grave Mistake''",
	"''Heads Up''",
	"''Bone-A-Rang''",
	"''Restless Dead''",
	"''Jaw Dropping''",
	"''Six Feet Under''",
	"''Across Bone''",
	"''Drop Dead''",
	"''Sticky Situation''",
	"''Slimemate''"
];