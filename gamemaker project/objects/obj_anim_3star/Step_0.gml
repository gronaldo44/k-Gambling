//hold last frame
if (image_index >= 105 && image_index < 106)
{
image_speed=0;

if(!isResultShow)
	{
		global.calculateResult(3);
		isResultShow = true;
	}
}