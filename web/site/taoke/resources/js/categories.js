var browser="";
var browserVersion="";
window.name="";
function getElementPoint(el){
for(var lx=0,ly=0;el!=null;lx+=el.offsetLeft,ly+=el.offsetTop,el=el.offsetParent);
return{x:lx,y:ly}
}
var objElement=document.getElementById("text_categories");
var objLayer=document.getElementById("layer_categories");
var objLayerContent=document.getElementById("categoriescontent")
var objLayerMask=document.getElementById("layer_mask")
var lt,ll,lw,lh,mw,mh,et,el,eflag,mflag,dflag;
lt=0;
ll=0;
lw=0;
lh=0;
mw=0;
mh=0;
eflag=false;
mflag=false;
if(document.addEventListener){
objElement.addEventListener("mouseover",ShowCategories,false);
objElement.addEventListener("mouseout",HideCategories,false);
objLayer.addEventListener("mouseover",LayerOver,false);
objLayer.addEventListener("mouseout",HideCategories,false);
}
else if(document.attachEvent){
objElement.attachEvent("onmouseover",ShowCategories,false);
objElement.attachEvent("onmouseout",ElementOut,false);
objLayer.attachEvent("onmouseover",LayerOver,false);
objLayer.attachEvent("onmouseout",IELayerOut,false);
}
function ShowCategories(){
mflag=true;
if (mw==0){mw=mw=objLayer.offsetWidth;}
if (mh==0){
switch(browserVersion){
	case "ie7":
		mh=objLayer.offsetHeight-70;
		break;
	case "ie6":
		mh=objLayer.offsetHeight-85;
		break;
	default:
		mh=objLayer.offsetHeight-60;
		break;
}

}
el=getElementPoint(objElement).x;
et=getElementPoint(objElement).y;
ll=el;
lt=et-304;
objLayer.style.visibility="visible";
with(objLayerMask.style){
top=parseInt(lt)+"px";
left=parseInt(ll)+"px";
width=mw+"px";
switch(browserVersion){
	case "ie7":
		height=mh+"px";
		break;
	case "ie6":
		height=mh+19+"px";
		break;
	default:
		height=mh+"px";
		break;
}
}
if (!eflag&&!dflag){
objLayer.style.top=lt+"px";
objLayer.style.left=el+"px";
ZoomIn();
}
}
function ZoomIn(){
eflag=true;
lw+=100;
lh+=100;
with(objLayer.style){
if (lw>=mw||lh>=mh){
	width=mw+"px";
	height=mh+"px";
	top=lt+"px";
	left=ll+"px";
	window.clearTimeout(timer1);
	objLayerContent.style.display="block";
	objLayerMask.style.visibility="visible";
	lw=0;
	lh=0;
	dflag=true;
	eflag=false;
}
else{
	objLayerContent.style.display="none";
	width=lw+"px";
	height=lh-50+"px";
	timer1=window.setTimeout("ZoomIn()","10");
	left=(parseInt(left))+"px";
}
}
}
function ZoomOut(flag){
if (flag==1){
if (eflag){return;}
}
eflag=true;
with(objLayer.style){
lw=parseInt(width)-100;
lh=parseInt(height)-100;
if (lw<=0||lh<=0){
	if (mflag){
		width=mw+"px";
		height=mh+"px";
		top=lt+"px";
		left=ll+"px";
		lw=0;
		lh=0;
		objLayerContent.style.display="block";
		objLayerMask.style.visibility="visible";
		window.clearTimeout(timer1);
		return;
	}
	objLayerContent.style.display="block";
	width="0px";
	height="0px";
	top=et+"px";
	left=el+"px";
	visibility="hidden";
	lw=0;
	lh=0;
	eflag=false;
	dflag=false;
	window.clearTimeout(timer1);
}
else{
	width=lw+"px";
	height=lh+"px";
	left=(parseInt(left))+"px";
	objLayerContent.style.display="none";
	objLayerMask.style.visibility="hidden";
	timer1=window.setTimeout("ZoomOut(0)","10");
}
}
}
function IELayerOut(){
event.cancelBubble=true;
eflag=false;
setTimeout("ZoomOut(1)","600");
}
function ElementOut(){
mflag=false;
HideCategories();
}
function LayerOver(){
eflag=true;
}
function LayerOut(){
eflag=false;
ZoomOut(0);
}
function HideCategories(){
eflag=false;
mflag=false;
setTimeout("ZoomOut(1)","600")
}
function copyToClipBoard(){
var clipBoardContent="";
clipBoardContent+="给您推荐一个好网址---淘宝皇冠店---本站所有上榜网店是由数万名热心网友推荐整理而成，真实可信赖！";
clipBoardContent+="\n";
clipBoardContent+="网址：https://code.google.com/p/freecms/";
window.clipboardData.setData("Text",clipBoardContent);
alert("文字已经成功复制到粘贴板，您可以使用 Ctrl+V 贴到需要的地方去了哦！");
}
function clect()
{
window.open('https://code.google.com/p/freecms/','favit','width=930,height=470,left=50,top=50,toolbar=no,menubar=no,location=no,scrollbars=yes,status=yes,resizable=yes');void(0)
}