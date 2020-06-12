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
	<div>
		<span>选择日期：</span><input type="date" id="date" value="${date }"><input type="button" value="确认" onclick="searchMaterial()">
	</div>
	<table class="table table-border table-bordered table-bg table-hover table-sort">
		<thead>
			<tr class="text-c">
				<th>序号</th>
				<th>标签</th>
				<th>素材描述</th>
				<th>图片</th>
				<th>收藏数量</th>
				<th>打印数量</th>
				<th>点赞数量</th>
				<th>发布时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mList }" var="m" varStatus="i">
				<tr>
					<td>${i.index+1 }</td>
					<td>${m.label }</td>
					<td>
						<div style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width:200px">
							${m.story }
						</div>
					</td>
					<td>
						<div style="display: flex;flex-direction: row;">
							<c:forEach items="${m.imgPath.split(',')}" var="img" >
			          		 <div style="width:40px;height:40px;overflow:hidden;" onclick="previewPic(this)">
			            		<img alt="" src="${img.replaceAll('\\.', 'mini.')}" width="100%" >
			            	 </div>
			            	 </c:forEach>
			            </div>
					</td>
					<td>${m.collectCount }</td>
					<td>${m.printCount }</td>
					<td>${m.zanCount }</td>
					<td>${m.publishDate }</td>
					<td>
						<c:choose>
							<c:when test="${m.state==0 }">
								可显示
							</c:when>
							<c:when test="${m.state==1 }">
								不显示
							</c:when>
						</c:choose>	
					</td>
					<td>
						<c:choose>
							<c:when test="${m.state==0 }">
								<a onclick="pass(${m.id},1,this)" title="不可显示" class="c-success">不可显示</a>
							</c:when>
							<c:when test="${m.state==1 }">
								<a onclick="pass(${m.id},0,this)" title="可显示" class="c-success">可显示</a>
							</c:when>
						</c:choose>	
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page">
	   <c:if test="${pageNum>1 }">
	   		<input class="btn btn-default" type="button" value="上一页" onclick="topage(${pageNum-1})">
	   </c:if>
	   <c:choose>
	   		<c:when test="${pagecount<=10 }">
	   			<c:forEach begin="1" end="${pagecount }" var="pg">
	   				<c:if test="${pageNum==pg }">
	   					<input class="btn radius btn-secondary" type="button" value="${pg }" onclick="topage(${pg})">
	   				</c:if>
	   				<c:if test="${pageNum!=pg }">
	   					<input class="btn btn-default" type="button" value="${pg }" onclick="topage(${pg})">
	   				</c:if>
		   		</c:forEach>
	   		</c:when>
	   		<c:when test="${pagecount>10&&pageNum<=6 }">
	   			<c:forEach begin="1" end="10" var="pg">
	   				<c:if test="${pageNum==pg }">
	   					<input class="btn radius btn-secondary" type="button" value="${pg }" onclick="topage(${pg})">
	   				</c:if>
	   				<c:if test="${pageNum!=pg }">
	   					<input class="btn btn-default" type="button" value="${pg }" onclick="topage(${pg})">
	   				</c:if>
		   		</c:forEach>
	   		</c:when>
	   		<c:when test="${pagecount>10&&pageNum>6 }">
	   			<c:forEach begin="${pageNum-5 }" end="${pageNum+4 }" var="pg">
	   				<c:if test="${pageNum==pg }">
	   					<input class="btn radius btn-secondary" type="button" value="${pg }" onclick="topage(${pg})">
	   				</c:if>
	   				<c:if test="${pageNum!=pg }">
	   					<input class="btn btn-default" type="button" value="${pg }" onclick="topage(${pg})">
	   				</c:if>
		   		</c:forEach>
	   		</c:when>
	   </c:choose>
	   <input class="btn btn-default" type="button" value="下一页" onclick="topage(${pageNum+1})">
	</div>
</body>
<script type="text/javascript">
	function searchMaterial(){
		var date=$("#date").val();
		window.location.href="toMaterialPage?date="+date;
	}
	function topage(pageNum){
		var date=$("#date").val();
		window.location.href="toMaterialPage?date="+date+"&pageNum="+pageNum;
	}
	function previewPic(item){
		var pic=$(item).children();
		var img = new Image();  
	    img.src = $(pic[0]).attr("src");
	    
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
	function pass(id,type,item){
		layer.confirm('确认？',function(){
			$.ajax({
				url : 'passMaterial',
				data:{'id':id,'type':type},
				type : 'POST',
				dataType : 'json',
				success : function(data) {
					if(data.code==100){
						layer.msg('设置成功!', {
							icon : 1,
							time : 1000
						});
						if(type=='0'){
							$($($(item).parent()).prev()).text("可显示");
							$($(item).parent()).html('<a onclick="pass('+id+',1,this)" title="不可显示" class="c-success">不可显示</a>');
						}else if(type=='1'){
							$($($(item).parent()).prev()).text("不可显示");
							$($(item).parent()).html('<a onclick="pass('+id+',0,this)" title="可显示" class="c-success">可显示</a>');
						}
					}else{
						layer.msg('设置失败!', {
							icon : 0,
							time : 1000
						});
					}
				},
				error : function(data) {
					console.log(data.msg);
				},
			});
		})
	}
</script>
</html>