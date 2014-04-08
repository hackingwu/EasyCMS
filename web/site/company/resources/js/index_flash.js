function flash_gd(value)
{
	val=document.getElementById("banner_r").getElementsByTagName("li").length;
	clearInterval(gd)
	$("#banner_r").stop();
	ks=(value==1)?ks+1001:ks-1001;
	if(ks<0)
	{
		ks=(val-1)*1001;
		$("#banner_r").animate({scrollLeft:ks},"slow");
	}
	else if(ks<val*1001)
	{
		$("#banner_r").animate({scrollLeft:ks},1000);
	}
	else
	{
		ks=0;
		$("#banner_r").animate({scrollLeft:ks},"slow");
	}
	gd=setInterval("flash_gd(1)",5000)
}
gd=setInterval("flash_gd(1)",5000)