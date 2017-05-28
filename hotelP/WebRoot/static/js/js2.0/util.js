
	//获得分页条
	//Count 总条数,PageSize 每页条数, pageNo 当前页,method 点击页数触发的方法
	function getfenyetiao(Count, PageSize, pageNo,method) {
		//显示分页条
		var pageCount = Math.ceil(Count / PageSize);//计算总页数  
		var item = "";
		if (pageNo == 1) {
			item += '<a  class="prev">上一页</a>';
		} else {
			item += '<a  onclick="' + method + '(' + (pageNo - 1)
					+ ')" class="prev">上一页</a>';
		}
		if (pageCount <= 5) {//总页数小于五页，则加载所有页
			for (i = 1; i <= pageCount; i++) {
				if (i == pageNo) {
					item += '<span id="pageNo" class="cur">' + i + '</span>';
				} else {
					item += '<a  onclick="' + method + '(' + i
							+ ')" >' + i + '</a>';
				}
			}
		} else if (pageCount > 5) {//总页数大于五页，则加载五页
			if (pageNo < 5) {//当前页小于5，加载1-5页
				for (i = 1; i <= 5; i++) {
					if (i == pageNo) {
						item += '<span id="pageNo" class="cur">' + i + '</span>';
					} else {
						item += '<a  onclick="' + method + '(' + i
								+ ')" >' + i + '</a>';
					}
				}
				if (pageNo <= pageCount - 2) {//最后一页追加“...”代表省略的页
					item += '<span class="dot"> . . . </span>';
				}
			} else if (pageNo >= 5) {//当前页大于5页
				for ( var i = 1; i <= 2; i++) {//1,2页码始终显示
					item += '<a  onclick="' + method + '(' + i
							+ ')" >' + i + '</a>';
				}
				item += '<span class="dot"> . . . </span>';//2页码后面用...代替部分未显示的页码
				if (pageNo + 1 == pageCount) {//当前页+1等于总页码
					for (i = pageNo - 1; i <= pageCount; i++) {//“...”后面跟三个页码当前页居中显示
						if (i == pageNo) {
							item += '<span id="pageNo" class="cur">' + i + '</span>';
						} else {
							item += '<a  onclick="' + method + '(' + i
									+ ')" >' + i + '</a>';
						}
					}
				} else if (pageNo == pageCount) {//当前页数等于总页数则是最后一页页码显示在最后
					for (i = pageNo - 2; i <= pageCount; i++) {//...后面跟三个页码当前页居中显示
						if (i == pageNo) {
							item += '<span id="pageNo" class="cur">' + i + '</span>';
						} else {
							item += '<a  onclick="' + method + '(' + i
									+ ')" >' + i + '</a>';
						}
					}
				} else {//当前页小于总页数，则最后一页后面跟...
					for (i = pageNo - 1; i <= pageNo + 1; i++) {//pageNo+1页后面...
						if (i == pageNo) {
							item += '<span id="pageNo" class="cur">' + i + '</span>';
						} else {
							item += '<a  onclick="' + method + '(' + i
									+ ')" >' + i + '</a>';
						}
					}
					item += '<span class="dot"> . . . </span>';
				}

			}
			if ((pageCount - pageNo) > 1) {
				item += '<a  onclick="' + method + '(' + pageCount
						+ ')" >' + pageCount + '</a>';
			}
		}
		if (pageNo == pageCount) {
			item += '<a  class="next">下一页</a>';
		} else {
			item += '<a  onclick="' + method + '(' + (pageNo + 1)
					+ ')" class="next">下一页</a>';
		}
		item += '<span class="all-page">共' + Count + '条</span>';
		return item;
	}
	//时间戳转字符串
	function ChangeDateFormat(d) {
		//将时间戳转为int类型，构造Date类型（这里存疑:时间戳这一大串数字是表示的毫秒数吗？）
		var date = new Date(parseInt(d, 10));
		//月份得+1，且只有个位数时在前面+0
		var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1)
				: date.getMonth() + 1;
		//日期为个位数时在前面+0
		var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date
				.getDate();
		//getFullYear得到4位数的年份 ，返回一串字符串
		return date.getFullYear() + "-" + month + "-" + currentDate;

	}