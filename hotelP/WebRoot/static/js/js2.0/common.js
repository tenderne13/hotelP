/**
 * 
 * @authors sunbf (hi@sunbf.net)
 * @date    2017-02-25 15:05:49
 * @common.js
 * 1.0页面高耦合
 */
;(function(){
	'use strict'
	//获取当前窗口高度，并固定左侧菜单
	function getWinH(){
		var winH = $(window).height(),
			$sidebox = $('.sidebox'),
			$sidebar = $('#sidebar'),
			sidebarW = $sidebar.width();

		$sidebox.height(winH);
		$sidebar.height(winH -134);
		//展开关闭菜单
		$('.switch a').on('click',function(e){
			var target = e.target.className;
			var classTag = /off/.test(target);
			if(classTag === true){
				$(this).hide().prev().css('display','block');
				$sidebox.css('left',-sidebarW);
				$('.contetbox, .sq-name').css('padding-left','0');
				$('.map-search').css('left','60');
			}else{
				$(this).hide().next().css('display','block');
				$sidebox.css('left','0');
				$('.contetbox').css('padding-left',sidebarW);
				$('.sq-name').css('padding-left','213px');
				$('.map-search').css('left','250');
			}
		});
	}
	getWinH();    	
	$(window).resize(function(){
		getWinH(); 
		$('#sidebar').jScrollPane();
	});

	//滚动条
	$('#sidebar').jScrollPane();

	//左侧菜单切换
	function TabFn(options){
		this.element = options.element;
		this.classname = options.classname;
		this.selectFn().stopPropagaFn();
	}

	TabFn.prototype.selectFn = function(){
		var self = this;
		self.element.on('click', function(event){
			event.stopPropagation();
			$(this).toggleClass(self.classname);
			//addClass(self.classname).siblings().removeClass(self.classname);
			$('#sidebar').jScrollPane();
		});
		return this;
	};
	//stopPropagation
	TabFn.prototype.stopPropagaFn = function(){
		var self = this;
		var _subbox = $('.subbox a');
		_subbox.on('click', function(event){
			event.stopPropagation();
		});
		return this;
	};

	var $firstMenu = $('.first'),
		$secondMenu = $('.second');

	var firstMenu = new TabFn({
		element: $firstMenu,
		classname: 'show1'
	});	
	var secondMenu = new TabFn({
		element: $secondMenu,
		classname: 'show2'
	});	

	//提醒展开
	$('.remind').on('mouseenter mouseleave', function(e){
		if(e.type === 'mouseenter'){
			$(this).addClass('on');
		}else if(e.type === 'mouseleave'){
			$(this).removeClass('on');
		}
	});
}());

'use strict'
//展开搜索
;(function searchSwitch(){
	'use strict'
	var $ssBtn = $('#ss-btn'),
		$scont = $('.s-content'),
		$input = $scont.find('.s-input input'),
		$scolse = $('.s-close');

	$ssBtn.on('click', function(){
		$(this).addClass('none');
		$scont.removeClass('none');
		$input.focus();
	});
	$scolse.on('click', function(){
		$scont.addClass('none');
		$input.val('');
		$ssBtn.removeClass('none');
	});
})();

//输入联想
;(function thinkSelect(){
	'use strict'
	var $ts = $('#js-thinkSelect');

	$ts.off('keyup').on('keyup',function(ev){
		var $ul = $(this).parent().find('ul');
		if($.trim($(this).val()) !== ''){
			$ul.removeClass('none');
			$ul.find('li').on('click',function(){
				$ts.val($(this).text());
				$ul.addClass('none');
			});
		}else{
			$ul.addClass('none');
		}
	});
}());

//锚点滚动
function Iscroll(obj){
	this.obj = obj;
	this.init();
}
Iscroll.prototype = {
	init:function(){
		var self = this;
		var _louceng = $('.fw-c-table');
		this.$li = self.obj.find('.navli');
		this.$link = self.obj.find('.navli a');
		this.$backtop = self.obj.find('.backtop'); 

		$(window).scroll(function(){
			var winH = $(window).height();//可视窗口高度
            var iTop = $(window).scrollTop();//鼠标滚动的距离

            _louceng.each(function(){
                if(winH+iTop-150 - $(this).offset().top>winH/2){
                    self.$li.removeClass('on');
                    self.$li.eq($(this).index()).addClass('on');
                }
            });
		});
		//点击top回到顶部
        self.$backtop.click(function(){
            $('body,html').animate({"scrollTop":0},500);
        });
        //点击回到当前楼层
        self.$link.click(function(){
        	var iscrollNum = $( $.attr(this, 'href') ).offset().top;
            $('html, body').animate({
		        "scrollTop": iscrollNum-60
		    },500);
		    return false;
        });
	}
};

//添加删除住址
function AddDelSite(options){
	this.element = options.element; //操作元素
	this.nums = options.nums || 5; //添加数量，默认5
	this.addSite().delSite();
};
AddDelSite.prototype = {
	addSite: function(){
		var _this = this;
		//var _addHtml = '<li class="w100 multiple">'+'<span class="invisible">居住地</span>'+'<input class="input" type="text" name="site" />'+'<b class="site delsite" title="删除住址">删除住址</b>'+'</li>';
		this.addFn = this.element.find('.addsite');

		this.addFn.on('click', function(){
			var multiple = $('.multiple');
			var multipleLen = multiple.length;
			var _addHtml = '<li class="w100 multiple">'+'<span class="invisible">居住地</span>'+'<input id="liveaddress'+(multipleLen+1)+'" class="input" type="text" name="liveaddress'+(multipleLen+1)+'" />'+'<b class="site delsite" title="删除住址">删除住址</b>'+'</li>';
			if(multipleLen < _this.nums){
				multiple.eq(multipleLen - 1).after(_addHtml);
			}else{
				alert('最多只能有5个住址');
			}
		});
		return this;
	},
	delSite: function(){
		var _delFn = $('.multiple .delsite');

		$(document).on('click', _delFn, function(e){
			e.stopPropagation();
			if(e.target.className.indexOf('delsite') > -1){
				var _multiple = $(e.target).parent();
				_multiple.remove();
			}
		});
		return this;
	}
};

//居民状况设置
function AddDelpicture(options){
	this.picture = options.picture; //图片容器
	this.addpic = options.addpic; //添加图片
	this.del = options.del; //删除图片
	this.popup = options.popup; //弹窗容器
	this.picsArr = [];
	this.oldPicsArr = [];
	this.dataIdArr = [];
	this.init();
};
AddDelpicture.prototype = {
	init:function () {
		this.bindEvent();
	},
	bindEvent:function(){
		var _this = this;
		this.cancel = this.popup.find('.cancel');
		this.confirm = this.popup.find('.confirm');
		this.close = this.popup.find('.close'); //关闭弹窗
		this.residentbox = this.popup.find('.residentbox'); 
		var $li = this.residentbox.find('li');

		//删除自身及隐藏相关dom
		$(document).on('click', _this.del, function(){
			var parent = $(this).parent();
			var dataId = $(this).attr('data-id');
			var imgs = parent.find('img').attr('src');
			$('#'+dataId).hide();
			parent.remove();
		});
		//显示弹窗
		this.addpic.on('click', function(){
			_this.popup.show();
			fnAddCurrent();
			//添加图片
			$(document).on('click','.residentbox li', function(e){
				var target = e.target;
				var li = $(target).parents('li');
				var dataId = li.attr('data-id');
				var imgs = li.find('img').attr('src');
				if(li.hasClass('on')){
					li.removeClass('on');
					fnRemoveArr(dataId,_this.dataIdArr);
					fnRemoveArr(imgs,_this.oldPicsArr);
				}else{
					//li.attr('data-class','on');
					li.addClass('on');
					_this.dataIdArr.push(dataId)
					_this.oldPicsArr.push(imgs);
				};	
			});
		});
		//关闭弹窗
		this.close.on('click', function(){
			popHide();
		});
		this.cancel.on('click', function(){
			popHide()
		});
		
		//插入添加的图片
		this.confirm.on('click', function(){
			var html = '';
			var newPics = null;
			if(_this.oldPicsArr.length === 0){
				alert('请选择一个或多个居民状态！');
				return ;
			};
			newPics = tab(_this.picsArr,_this.oldPicsArr);
			for(var i=0;i<_this.picsArr.length;i++){
				fnRemoveArr(_this.picsArr[i],newPics);
			}
			for(var i=0,len=newPics.length;i<len;i++){
				html += '<div class="pics"><img src="'+_this.oldPicsArr[i]+'" alt="icon" width="30" height="30"><a href="javascript:;" data-id="'+ _this.dataIdArr[i] +'" class="del">x</a></div>';
			};
			_this.addpic.before(html);
			for(var i=0,l=_this.dataIdArr.length;i<l;i++){
				$('#'+_this.dataIdArr[i]).show();	
			}
			//$li.removeClass('on');
			popHide();
		});
		//取2个数组的不同值
		function tabarr(arr1,arr2){
			var tmp = arr1.concat(arr2);
			var o = {};
			var c = [];
			for (var i = 0; i < tmp.length; i ++) (tmp[i] in o) ? o[tmp[i]] ++ : o[tmp[i]] = 1;
			for (x in o) if (o[x] == 1) c.push(x);
			console.log(c);
			return c;
		};
		//数组去重复
		function tab(arr1,arr2){
		    var arr = arr1.concat(arr2);
		    var lastArr = [];
		    var newArr = arr1;
		    for(var i = 0;i<arr.length;i++)
		    {
		        if(!unique(arr[i],lastArr))
		        {
		            lastArr.push(arr[i]);

		        }
		    }
		    return lastArr;
		}
		function unique(n,arr)
		{
		    for(var i=0;i<arr.length;i++)
		    {
		        if(n==arr[i]){
		            return true;
		        }
		    }
		    return false;
		}
		//删除数组中的元素
		function fnRemoveArr(val,arr){
			for(var i=0;i<arr.length;i++){
				if(arr[i] == val){
					arr.splice(i, 1);
      				break;
				}
			}
		};
		//弹窗隐藏
		function popHide(){
			_this.popup.hide();
			$li.removeClass('on');
			_this.oldPicsArr = [];
			//_this.picsArr = [];
			//解绑on
			$(document).off('click',".residentbox li");  
		};
		//初始化数组
		function fnInit(){
			_this.picsArr = [];
			_this.dataIdArr = [];
			var len = _this.picture.find('img');
			for(var i=0; i<len.length; i++){
				var imgs = $(len[i]).attr('src');
				_this.picsArr.push(imgs);
			}
		};
		//初始化选项
		function fnAddCurrent(){
			fnInit();
		};
		
		return this;
	}
};
