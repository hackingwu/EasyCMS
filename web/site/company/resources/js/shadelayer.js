/*
	* @method shadeLayer
	* @author Jeffery
	* @date 2009/10/20
	* @usage shadeLayer.init('alertBox')
			 shadeLayer.init('alertBox',{
				id:'shadeBox',		//遮罩层的id
				shadeBox : null,	//遮罩层对象
				opacity: 50,		//遮罩层透明度
				bgColor: '#000',	//遮罩层背景色
				zIndex: 1000		//遮罩层的层叠顺序
			 })
			 shadeLayer.closed() or
			 shadeLayer.closed(function(){
			 	alert('Hello !');
			 })
*/
var shadeLayer = {
		init:function(id,option){
			this.options = option || {
				id:'shadeBox',		//遮罩层的id
				shadeBox : null,	//遮罩层对象
				opacity: 50,		//遮罩层透明度
				bgColor: '#999',	//遮罩层背景色
				zIndex: 1000,		//遮罩层的层叠顺序
				isHideSelect: true
			};
			
			//判断浏览器类型和版本
			var userAgent = navigator.userAgent.toLowerCase();
			this.browser = {
				version: (userAgent.match( /.(?:rv|it|ra|ie)[\/: ]([\d.]+)/ ) || [])[1],
				safari: /webkit/.test( userAgent ),
				opera: /opera/.test( userAgent ),
				msie: /msie/.test( userAgent ) && !/opera/.test( userAgent ),
				mozilla: /mozilla/.test( userAgent ) && !/(compatible|webkit)/.test( userAgent )
			};
			//ie6，需要用到的地方太多了，所以直接写出来
			this.isIE6 = this.browser.msie && (this.browser.version == 6.0);
			//简化document.getElementById
			var $ = function(id){
				return ("string" == typeof(id))?document.getElementById(id):id;	
			};
			//隐藏select
			this.selects = document.getElementsByTagName('select');
			if (this.options.isHideSelect) {
			    if(this.selects.length!=0) this.setSelects(this.selects,true);
			}
			//填充物，真正需要显示的东西
			this.fillBox = $(id) ;
			//检测shadeBox是否在DOM里
			if($(this.options.shadeBox)==null){
				this.create();	//如果遮罩不存在，就创建一个，然后显示
				this.show();
			}else{
				this.show();	//遮罩已经存在了，直接显示
			}
			
		},
		//创建遮罩层
		create:function(){
			this.shadeBox = document.body.insertBefore(document.createElement("div"), document.body.childNodes[0])
			this.shadeBox.id = this.options.id;
			with(this.shadeBox.style){
				position = this.isIE6 ? 'absolute' : 'fixed';	//ie6对fixed的支持有限
				left = '0';
				top = '0';
				width = '100%';
				height = '100%';
				backgroundColor = this.options.bgColor;
				//ie7不支持opcity这个属性，但是ie8，两种写法都支持
				this.browser.msie ? filter = 'alpha(opacity='+parseInt(this.options.opacity)+')' : opacity = parseInt(this.options.opacity) / 100;
				zIndex = this.options.zIndex;
			}
			
			if(this.isIE6) this.resize();	//初始化遮罩在ie6里的宽和高
		},
		//填充物和遮罩的显示
		show:function(){
			with(this.fillBox.style){
				display = this.shadeBox.style.display = 'block';
				position = this.isIE6 ? 'absolute' : 'fixed';	//ie6对fixed的支持有限
				zIndex = this.options.zIndex + 1;	//设置填充物在遮罩的上面
				//以下三行，设置填充物的居中显示
				top = left = '50%';
				marginTop = - this.fillBox.offsetHeight / 2 + "px";
				marginLeft = - this.fillBox.offsetWidth / 2 + "px";
			}
			//修正ie6下的位置以及浏览器窗口大小改变时，遮罩的宽和高
			if(this.isIE6){
				this.resize();
				window.attachEvent("onresize", this.resize);
				this.setScroll();
				window.attachEvent("onscroll",this.setScroll);
			}
		},
		//关闭填充物和遮罩
		closed:function(callback){
			//关闭填充物和遮罩，设为display:none而不是remove是为了不频繁刷新DOM树，以防止某些浏览器内存溢用
			this.fillBox.style.display = this.shadeBox.style.display = 'none';
			//还原之前被隐藏的select
			this.setSelects(this.selects,false);
			//简单的自定义回调，关闭这俩东西后要干嘛，你自己决定吧
			if(callback){
				callback();
			}
		},
		//隐藏select
		setSelects:function(selects,flag){
			for(var i=0,l=selects.length;i<l;i++){
				selects[i].style.visibility = flag?'hidden':'visible';	//使用visibility，可以使隐藏时，不至于让页面太闪
			}
		},
		//主要用于修正ie6的滚动跟随问题
		setScroll:function(){
			shadeLayer.fillBox.style.marginTop = document.documentElement.scrollTop - shadeLayer.fillBox.offsetHeight / 2 + "px";
			shadeLayer.fillBox.style.marginLeft = document.documentElement.scrollLeft - shadeLayer.fillBox.offsetWidth / 2 + "px";
		},
		//主要用于修正ie6的浏览器窗口的resize问题
		resize:function(){
			with(shadeLayer.shadeBox.style){
				height = Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) + 'px';
				width = Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth) + 'px';
			}
		}
	}//shadeLayer end
