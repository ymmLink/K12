<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>实体门店</title>
	<link href="/static/css/shop.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
	<style type="text/css">
		.kuang{
			padding:0px 10%;
		}
		.shopimg{
			float:left;
			margin:40px 1% 35px 1%;
			width:48%;
		}
		.images{
			width:100%;
			height:auto;
		}
		.ziti{
			padding-top:15px;
			padding-left:10px;
			font-size:20px;
			font-weight:bold;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap
		}
	</style>
	<div class="header_img"><img alt="" src="../static/images/customize.png" style="width: 100%;height: auto;"></div>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="kuang">
		<c:forEach items="${stores}" var="store">
			<div class='shopimg' onclick='click_adress(${store.id})'>
				<img src="${store.img}" class="images">
				<div class='ziti'>${store.name} | ${store.adress}</div>
			</div>
		</c:forEach>
	</div>
	<%-- <div class="shop">
		<div class="shop_div">
			<div class="shop_img_1">
				<c:forEach items="${stores}" var="store">
					<div class='shop_img_1_1' onclick='click_adress(${store.id}'>
						<div id='"+index+"' style='position: relative;height: calc(372px * 1)'><img src="${store.img}"></div>
						<div class='shop_img_1_1_text'>${store.name}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div> --%>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<!-- 高德地图 -->
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
<script src="http://webapi.amap.com/maps?v=1.3&key=93d9d7b737a5322647a08c929cf69b57"></script> 
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
 <script type="text/javascript">
	
	window.onload=function(){
		$("#shop").css("color","rgba(255,255,255,1)")
		
		/* $.ajax({
			url:"/map/getmore",
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json)
			    var lists=json.objs;
				for(var i=0;i<lists.length;i++){
					var index = "container" + i
					var map;
					var infoWindow;
					var marker;
				    var list=lists[i].split(',');
				    var x=parseFloat(list[0]);
				    var y=parseFloat(list[1]);
				    var adress=list[2];
				    var name = list[3];
				    var id = list[4]
					var op = "<div class='shop_img_1_1' onclick='click_adress("+id+")'>"+
					"<div id='"+index+"' style='position: relative;height: calc(372px * 1)'></div>"+
					"<div class='shop_img_1_1_text'>"+name+"</div>"+
					"</div>";
					$(".shop_img_1").append(op)
					
				    console.log(map)
				    if(map==null){
				    	 $("#shop_img_1_1_div").css("display",""); 
				    	map = new AMap.Map(index, {
				            resizeEnable: true,
				            zoom:18,
				            center: [x, y],
				            adress:adress
				        });
				    	//信息窗体的创建与设定
				        infoWindow = new AMap.InfoWindow({
				        	anchor: 'top-left',
				            content: '<h3>位置</h1><div>'+adress+'</div>'
				       });
				       //点标记的创建与添加
				        marker = new AMap.Marker({
				            position: [x, y],
				            map:map
				        });
				        infoWindow.open(map, map.getCenter());
				    }else{
				    	map.remove(marker);
				    	infoWindow.close();
				    	var position = new AMap.LngLat(x, y);  // 标准写法
				    	// 简写 var position = [116, 39]; 
				    	map.setCenter(position);
				    	infoWindow = new AMap.InfoWindow({
				    		anchor: 'top-left',
				            content: '<h3>位置</h1><div>'+adress+'</div>'
				       });
				    	infoWindow.open(map, map.getCenter());
				        marker = new AMap.Marker({
				            position: [x, y],
				            map:map
				        });
				    }
					map = null;
				}
			}
		}); */
	}
	function click_adress(id){
		location.href = "/map/toDetail?id="+id;
	}
</script>
</html>