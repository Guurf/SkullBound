lifetime++;
if (lifetime > 15)
{
scale -= 0.1;
image_xscale = scale;
image_yscale = scale;
if (scale <= 0) instance_destroy();
}