<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.example.demo.entity.Store"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>门店详情</title>
	<link href="/static/css/shopDetail.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<div class="shopDetail">
		<div class="shopDetail_div">
			<div class="shopDetail_div_top">
				<div class="shopDetail_div_top_left">
					<div class="dianpu_name">${store.name }</div>
					<div class="dianpu_pingjia">
					<% Store store = (Store)session.getAttribute("store");
					Integer star = Integer.valueOf(store.getStar());
					for(int i=0;i<star;i++) {%>
						<div><img alt="" src="../static/images/dianpu/start1.png" style="width:calc(20px * 1);height: calc(20px * 1);margin-right: 10px"></div>
					<%} %>
					<% for(int i=0;i<5-star;i++) {%>
						<div><img alt="" src="../static/images/dianpu/start2.png" style="width:calc(20px * 1);height: calc(20px * 1);margin-right: 10px"></div>
					<%} %>
					</div>
					<div class="dianpu_dizhi">地址：${store.adress }</div>
					<div class="dianpu_phone">电话：${store.phone }</div>
					<div class="dianpu_agree" onclick="click_agree()" style="cursor:pointer">
						<div class="dianpu_agree_img"><img alt="" src="../static/images/dianpu/agree.png" style="width:calc(28px * 1);height: calc(28px * 1);"></div>
						<div class="dianpu_agree_text">点赞</div>
					</div>
				</div>
				<div class="shopDetail_div_top_right" id="container" style='position: relative;width:calc(620px * 0.8928);height:  calc(538px * 0.8928)'>
					<!-- <img alt="" src="../static/images/dianpu/pic1.png" style="width:calc(620px * 1);height: calc(538px * 1);">
					<img alt="" src="../static/images/dianpu/dian.png" style="width:calc(44px * 1);height: calc(51px * 1);position: relative;bottom: 259px;left: 246px;"> -->
				</div>
			</div>
			<div class="shopDetail_buttom">
				<div class="shopDetail_title">门店图片</div>
				<div class="shopDetail_img"><img alt="" src="${store.img }" style="width:calc(1344px * 0.8928);height: calc(756px * 0.8928);"></div>
				
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
<!-- 高德地图 -->
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
<script src="http://webapi.amap.com/maps?v=1.3&key=93d9d7b737a5322647a08c929cf69b57"></script> 
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript">
	var getParam = function(name){
	    var search = document.location.search;
	    var pattern = new RegExp("[?&]"+name+"\=([^&]+)", "g");
	    var matcher = pattern.exec(search);
	    var items = null;
	    if(null != matcher){
	            try{
	                    items = decodeURIComponent(decodeURIComponent(matcher[1]));
	            }catch(e){
	                    try{
	                            items = decodeURIComponent(matcher[1]);
	                    }catch(e){
	                            items = matcher[1];
	                    }
	            }
	    }
	    return items;
	}
	var id = getParam('id')
	window.onload=function(){
		$("#shop").css("color","rgba(255,255,255,1)")
		var map;
		var infoWindow;
		var marker;
		$.ajax({
			url:"/map/getone?id="+id,
			type:"post",
			dataType:"text",
			success:function(data){
			    var location=data;
			    var list=location.split(',');
			    var x=parseFloat(list[0]);
			    var y=parseFloat(list[1]);
			    var adress = list[2]
			    if(map==null){
			    	$("#container").css("display","");
			    	map = new AMap.Map('container', {
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
			}
		});
	}
	function click_agree(){
		$.ajax({
			url:"/shop/agree?id="+id,
			type:"POST",
			dataType:"json",
			success:function(json){
				if(json.resInteger==200){
					alert("点赞成功")
				}else if(json.resInteger==700){
					alert("两周内不能重复点赞")
				}
			}
		})
	}
</script>
</html>