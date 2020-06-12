<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>评价订单</title>
	<link href="/static/css/judge.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/static/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="/static/kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="/static/kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="/static/kindeditor/lang/zh_CN.js"></script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/jsp/w/web/header.jsp"%>
		<%@ include file="/WEB-INF/jsp/w/web/kong.jsp"%>
	</header>
	<form class="judge">
		<div class="judge_div">
			<div class="judge_div_inner">
				<div class="judge_baby">评价宝贝</div>
				<div class="judge_line"></div>

				<div class="judge_context">
					<div class="judge_context_left">
						<div class="judge_context_img"><img alt="" src="${orders.skuMainPic }" style="width: calc(200px * 0.8928);height: calc(113px * 0.8928);"></div>
						<div class="judge_context_title">${orders.title }</div>
						<div class="judge_context_text">${orders.guigeValueIdColorName }/${orders.guigeValueId2Name }</div>
					</div>
					<div class="judge_context_right">
						<textarea name="text" class="textarea" rows="6" cols="15" placeholder="请写点评价吧，您的评价对其他买家很有帮助" style="width: 822px; height: 108px;"></textarea>
						<div class="judge_context_right_img">
							<div id="previewdivqx" style="dislay:flex;">
							</div>
							<!-- <img alt="" src="../static/images/detail/pic10.png">
							<input onchange="preview3(0,this,0)" size="100" style="" type="file" name="file" multiple/>  -->
							<div id="pictureqx" class="fieldqx">
								<div id="qxscan0" class="fieldpicqx">
									<a class="button input-file" href="javascript:void(0);" style="height:100px;width:200px;padding:0px;border:0px;"><img  src="../static/images/detail/pic10.png"><input
											onchange="preview3(0,this,0)" size="100" style="" type="file" name="files" /> </a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		
		<div class="judge_submit"><img style="cursor:pointer" onclick="click_sub()" alt="" src="../static/images/detail/pic11.png" style="width: calc(180px * 0.8928);height: calc(56px * 0.8928);"></div>
	</form>
	<%@ include file="/WEB-INF/jsp/w/web/mark.jsp"%>
	<%@ include file="/WEB-INF/jsp/w/web/footer.jsp"%>
</body>
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
	var oid = getParam('oid')
	var skuId = getParam('skuId')
	var j=0;
	function preview3(data,file,type) {
	
	if(type==0){
		
	  j++;
	  var c=document.getElementsByClassName("fieldpicqx");	
	  	  
		for(var n=0;n<c.length;n++){
		   c[n].style.display="none";
		}
		if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt) {
				$("#previewdivqx").append('<div id="previewdivqx'+j+'" style="float:left;"><img style="margin-left:15px;" src="' + evt.target.result + '" width="200" height="100"/><br/>'
				                     +'&nbsp;&nbsp;&nbsp;<button  style="margin-left:20px;border-radius:5px;color:#2c7;border:1px solid #2c7 ;background:#fff;margin-top:3px;" onclick="preview3('+j+')" type="button">删除</button></div>');
			}
			reader.readAsDataURL(file.files[0]);			
			$("#pictureqx").append(' <div id="scanqx'+j+'" class="fieldpicqx"><a class="button input-file" href="javascript:void(0);" style="float:left;height:100px;width:200px;padding:0px;border:0px;margin-left:15px;"><img src="../static/images/detail/pic10.png"><input onchange="preview3('+j+',this,0)" size="100" type="file" name="files" data-validate="required:请选择上传文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件" /></a></div>');			    
		}else{
		   alert("文件异常！");
		};
	   
	 }else{
	    //删除预览
	    $('#previewdivqx'+data).remove();
        //删除上传
        var a = $('#scanqx'+(data-1)).parent().children('div');
        a[a.length-1].style.display="";
        $('#scanqx'+(data-1)).remove();
	 };
	}
	function click_sub(){
		
		var data = new FormData($(".judge")[0]);
		var url = "/judge/sub?oid="+oid+"&skuId="+skuId; 
		$.ajax({
			"url":url,
			"data":data,
			"type":"POST",
			"dataType":"json",
			"processData": false,
			"contentType": false,
			success:function(json){
				if(json.resInteger==200){
					alert("评价成功")
					window.history.go(-1);
				}else if(json.resInteger==600){
					alert("请上传照片")
				}else if(json.resInteger==601){
					alert("请输入内容")
				}
			}
		})
	}
</SCRIPT>
</html>