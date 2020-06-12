<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户反馈</title>
<link rel="stylesheet" type="text/css"
	href="/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="/static/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="/static/h-ui.admin/css/style.css" />
<script type="text/javascript" src="/static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/static/layer/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript"
	src="/static/datatables/1.10.0/jquery.dataTables.min.js"></script>
</head>
<body>
	<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
		<thead>
				<tr class="text-c">
					<th>序号</th>
					<th>反馈类型</th>
					<th>联系电话</th>
					<th>产品类型</th>
					<th width="10%">反馈内容</th>
					<th>反馈图片</th>
					<th>反馈时间</th>
					<th>用户ID</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${fbList }" var="fb" varStatus="i">
					<tr class="text-c">
						<td>${i.index+1 }</td>
						<td>
							<c:choose>
								<c:when test="${fb.type==0 }">
									问题反馈
								</c:when>
								<c:otherwise>
									体验建议
								</c:otherwise>
							</c:choose>
						</td>
						<td>${fb.conTel }</td>
						<td>
							<c:choose>
								<c:when test="${fb.type==0 }">
									宝威一号
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
						</td>
						<td style="white-space:nowrap;"  data-toggle="popover" title="反馈详情" data-content="${fb.inText }" data-placement="top" data-trigger="hover">
							${fb.inText.substring(0, 10) }...
						</td>
						<td >
							<img alt="" src="${fb.imgPath }" width="50px" onclick="previewPic(this)">
						</td>	
						<td>${fb.createDate }</td>
						<td>${fb.uid }</td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</body>
<script type="text/javascript">
	$('.table-sort').dataTable({
		"aaSorting" : [ [ 0, "asc" ] ],//默认第几个排序
		"bStateSave" : true,//状态保存
		"pading" : false
	});
	$(function () { $("[data-toggle='popover']").popover()});
	function previewPic(item){
		var img = new Image();  
	    img.src = $(item).attr("src");
	    var imgHtml = "<img src='" + img.src + "' width='100%' />";  
	    //弹出层
	    layer.open({  
	        type: 1,  
	        shade: 0.8,
	        offset: 'auto',
	        area: ['22%','90%'],
	        shadeClose:true,//点击外围关闭弹窗
	        scrollbar: false,//不现实滚动条
	        title: "图片预览", //不显示标题  
	        content: imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响  
	        cancel: function () {  
	            //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });  
	        }  
	    }); 
	}
</script>
</html>