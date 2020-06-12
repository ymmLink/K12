<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.flex_row{
			display: flex;
			flex-direction: row;
		}
		.flex_column{
			display: flex;
			flex-direction: column;
		}
		.avatar{
			width: 100px;
			height: 100px;
		}
	</style>
</head>
<body style="background-image: url(/static/image/hy.png);background-size: 100%">
	<div class="flex_column">
		<div class="flex_row">
			<div class="avatar">
				<img src="${admin.img}" style="width: 100%">
			</div>
			<span>${admin.name }</span>
		</div>
		<div>
			
		</div>	
	</div>
</body>
</html>	