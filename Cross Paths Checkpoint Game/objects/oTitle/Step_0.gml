if out == 0
{
	drawAlpha = lerp(drawAlpha,1.3,0.02);
}
else
{
	drawAlpha = lerp(drawAlpha,-0.1,0.1);
	if drawAlpha <= 0 instance_destroy();
}
if drawAlpha >= 1 out = 1;
