<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../commons/taglibs.jsp"%>

<%@ page import="com.example.demo.entity.AdminEntity"%>
<% 
String path=request.getContextPath();
AdminEntity admin=(AdminEntity)session.getAttribute("admin");
if(admin==null){
response.sendRedirect("/admin/login");
}
%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="renderer" content="webkit">
		<title>后台管理</title>
		<link rel="stylesheet" href="/static/pintuer/css/pintuer.css">
		<link rel="stylesheet" href="/static/pintuer/css/admin.css">
		<script src="/static/pintuer/js/jquery.js"></script>
		<script src="/static/pintuer/js/pintuer.js"></script>
		<script type="text/javascript" src="/static/js/ajaxfileupload.js"></script>
		
	</head>

	<body>
		<%@ include file="../admin/topmenu.jsp" %>
<SCRIPT type="text/javascript">showwhere("peizhiTop",0)</SCRIPT>
		<div class="admin">

			<div class="panel">
				<div class="panel-head">
					自定义菜单制作
				</div>
				<div class="padding border-bottom">

					<button class="button button-small border-red"
						onclick="return addsuper(2)">
						添加二级父菜单
					</button>
					<button class="button button-small border-red"
						onclick="return addsuper(1)">
						添加一级菜单
					</button>
				</div>

				<div class="panel-body">
					<table class="table ">
						<tr>
							<th style="width: 15%;">
								名称
							</th>
							<th style="width: 10%;">
								类型
							</th>
							<th style="width: 20%;">
								内容
							</th>
							<th style="width: 20%;">
								操作
							</th>
						</tr>
					</table>
					<form action="/weixin/addmenu" method="post">
						<div class="caidan" style="text-align: center;">
							<c:forEach items="${ones}" var="o" varStatus="st">
									<c:choose>
										<c:when test="${o.classify==1}">
											<table id="${st.index+1}">
												<tr class="zi" style="text-align: center;">
													<td style="width:15%"><input id="classify1" type="hidden" name="classify${st.index+1}" value="1"/>
													<input value="${o.name}" type="text"  name="name${st.index+1}" class="input"   placeholder="请输入一级菜单名称" /></td><td style="width:10%"></td>
													<td style="width:20%">
														<select onchange="change(this.options[this.options.selectedIndex].value,${st.index+1},${st.index})"name="type${st.index+1}" class="input"  >
															<option <c:if test="${o.type=='view'}"> selected="selected"</c:if> value="view">view</option>
															<option <c:if test="${o.type=='click'}"> selected="selected"</c:if> value="click">click</option>
														</select>
													</td>
													<td style="width:5%"></td>
													<td style="width:25%">
														<c:choose>
															<c:when test="${o.url==null || o.url==''}">
																<input value="${o.key}" type="text" name="url${st.index+1}" id="${st.index+1}${st.index}" class="input"  placeholder="请输入url链接或者key值" />
															</c:when>
															<c:otherwise>
																<input value="${o.url}" type="text" name="url${st.index+1}" id="${st.index+1}${st.index}" class="input"  placeholder="请输入url链接或者key值" />
															</c:otherwise>
														</c:choose>
													</td>
													<td style="width:20%"></td><td style="width:"><button class="button button-small border-main" onclick="deletesuper(${st.index+1})">删除</button>&nbsp;</td>
												</tr><br/>
											</table>
										</c:when>
										<c:otherwise>
											<table id="${st.index+1}">
												<tr class="zi" style="text-align: center;">
													<td style="width:15%"><input type="hidden" name="classify${st.index+1}" value="2"/>
														<input value="${o.name}" type="text"  name="name${st.index+1}" class="input"   placeholder="请输入二级父菜单名称" /></td><td style="width:15%"></td><td style="width:20%"></td><td style="width:30%"></td>
													<td style="width:20%"><button class="button button-small border-main" onclick="deletesuper(${st.index+1})">删除</button>&nbsp;
														<button class="button button-small border-green" type="button" onclick="addchild(${st.index+1})">添加子菜单</button>
													</td>
												</tr></br>
												<c:forEach items="${o.sub_button}" var="two" varStatus="stt">
													<tr style="text-align: center;" class="zizi${st.index+1}" id="${st.index+1}${st.index+1}">
														<td style="width:15%" align="right">∟ </td>
														<td style="width:15%"><input value="${two.name}" type="text"  name="btn${st.index+1}[${stt.index}].name" class="input"  placeholder="请输入子菜单名称" /></td>
														<td style="width:20%"><select onchange="change(this.options[this.options.selectedIndex].value,${st.index+1},${stt.index})"name="btn${st.index+1}[${stt.index}].type" class="input"  >
															<option <c:if test="#two.type=='view'">selected="selected"</c:if> value="view">view</option>
															<option <c:if test="#two.type=='click'">selected="selected"</c:if> value="click">click</option></select></td>
														<td style="width:30%">
														<c:choose>
															<c:when test="${two.url==null || two.url==''}">
																<input value="${two.key}" type="text" name="btn${st.index+1}[${stt.index}].url" id="${st.index+1}${stt.index}" class="input"  placeholder="请输入url链接或者key值" />
															</c:when>
															<c:otherwise>
																<input value="${two.url}" type="text" name="btn${st.index+1}[${stt.index}].url" id="${st.index+1}${stt.index}" class="input"  placeholder="请输入url链接或者key值" />
															</c:otherwise>
														</c:choose>
														</td>
														<td style="width:20%"><button class="button button-small border-main" onclick="return deletechild(${st.index+1}${st.index+1})">删除</button></td>
													</tr>
												</c:forEach>
											</table>
										</c:otherwise>
									</c:choose>
								
							</c:forEach>
						</div>
						<br/>
						<button class="button bg-mix" onclick="return checkForm()">
							提交
						</button>
					</form>
				</div>
			</div>
		</div>

		<script type="text/javascript">
//添加父菜单
function addsuper(type){
	var num=0;
    var zi=document.getElementsByClassName("zi");
   	for(var i=0;i<zi.length;i++){
   	     num=num+1; 
   	}
	var id=num+1;
	if(num<3){
		if(type==2){
			$('.caidan').append(
				'<table id="'
				+id
				+'"><tr class="zi"><td style="width:15%">'
				+'<input type="hidden" name="classify'
				+id
				+'" value="2"/>'
				+'<input type="text"  name="name'
				+id
				+'" class="input"   placeholder="请输入二级父菜单名称" /></td><td style="width:15%"></td><td style="width:20%"></td><td style="width:30%"></td><td style="width:20%"><button class="button button-small border-main" onclick="deletesuper('
				+id
				+')">删除</button>&nbsp;<button class="button button-small border-green" type="button" onclick="addchild('
				+id
				+')">添加子菜单</button></td></tr></br></table>'
				);
	   }else{
	   		$('.caidan').append(
				'<table id="'+id+'"><tr class="zi"><td style="width:15%">'
				+'<input id="classify'+id+'" type="hidden" name="classify'
				+id+'" value="1"/>'
				+'<input type="text"  name="name'
				+id+'" class="input"   placeholder="请输入一级菜单名称" /></td><td style="width:10%"></td><td style="width:20%"><select onchange="change(this.options[this.options.selectedIndex].value,'+id+','+num+')"name="type'
				+id+'" class="input"  ><option value="view">view</option><option value="click">click</option></select></td><td style="width:5%"></td><td style="width:20%"><input type="text" name="url'
				+id+'" id='+id+'+'+num+' class="input"  placeholder="请输入url链接或者key值" /></td><td style="width:10%"></td><td style="width:"><button class="button button-small border-main" onclick="deletesuper('+id+')">删除</button>&nbsp;'
				+'</td></tr></br></table>'
			);
				
	   }
   }else{
	   alert("对不起，父菜单最多只能3个！");
   }
}


function addchild(id){


    var num=0;
    
   var child= document.getElementsByClassName("zizi"+id);

   	for(var i=0;i<child.length;i++){
   	
   	     num=num+1;
   	    
   	}
   	
  id1=num+1;
   	
   	if(num<5){
   
		$('#'+id).append(
							
			'<tr class="zizi'
			+id 
			+'" id="'
			+id
			+id1
			+'"><td style="width:15%" align="right">∟ </td><td style="width:15%"><input type="text"  name="btn'
			+id
			+'['
			+num
			+'].name" class="input"  placeholder="请输入子菜单名称" /></td><td style="width:20%"><select onchange="change(this.options[this.options.selectedIndex].value,'
			+id
			+','
			+num
			+')"name="btn'
			+id
			+'['
			+num
			+'].type" class="input"  ><option value="view">view</option><option value="click">click</option></select></td><td style="width:30%"><input type="text" name="btn'
			+id
			+'['
			+num
			+'].url" id='
			+id
			+'+'
			+num
			+' class="input"  placeholder="请输入url链接或者key值" /></td><td style="width:20%"><button class="button button-small border-main" onclick="return deletechild('
			+id
			+id1
			+')">删除</button></td></tr>'
							
				);
		    }else{
		    
		    alert("对不起，子菜单最多只能5个！");
		    
		    }
		    
}

function deletechild(id1){

document.getElementById(id1).remove();

}

function deletesuper(id){
	document.getElementById(id).remove();
}



function checkForm(){
var input=document.getElementsByClassName("input");

for(var i=0;i<input.length;i++){
   
   var value=(input[i]).value;
  
   if(value==""){
      alert("菜单的相关内容不能为空！");
      return false;
   }
}

   var num=0;
   var zi=document.getElementsByClassName("zi");
   
   	for(var i=0;i<zi.length;i++){
   	     num=num+1; 
   	}
   	if(num==0){ 	
   	return false;
   	}
   	
   	
   	var a=document.getElementById("1");
   	if(a!=null&&a!=""){
   	   	var aa=document.getElementById("11");
   	   	var classify = $('#classify'+1).val();
   	   	if((aa==null||aa=="")&& classify==2){
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	   	 
   	}
   	
   	var b=document.getElementById("2");
   	if(b!=null&&b!=""){
   	var bb=document.getElementById("21");
   	var classify = $('#classify'+2).val();
   	   	if((bb==null||bb=="") && classify==2){	
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	}
   	
   	var c=document.getElementById("3");
   		if(c!=null&&c!=""){
   		var cc=document.getElementById("31");
   		var classify = $('#classify'+3).val();
   	   	if((cc==null||cc=="")&& classify==2){
   	   	alert("请添加相关子菜单！");
   	   	return false;
   	   	}
   	}
  
   	
return true;
}

function change(value,id,num){

if(value=="view"){
    var va="url";
    document.getElementById(id+num).name="btn"+id+"["+num+"]"+"."+va;
}

if(value=="click"){
var va="key";
document.getElementById(id+num).name="btn"+id+"["+num+"]"+"."+va;

}



//var c= document.getElementById(id+num).name;
//alert("btn"+id+"["+num+"]"+"."+value);

}


</script>
	</body>
</html>