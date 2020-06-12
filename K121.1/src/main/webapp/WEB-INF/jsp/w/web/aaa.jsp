<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="../css/pintuer.css"/>
		<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
		<script src="../js/pintuer.js" type="text/javascript" charset="utf-8"></script>
		<title>
			选择地址
		</title>
		<script type="text/javascript">
			$(document).ready(function(){
				var width = document.documentElement.clientWidth; //获取屏幕的宽度
					var height = document.documentElement.clientHeight; //获取屏幕的高度
					var bili1 = width / 750; //屏幕宽度与设计稿宽度的比例（750是设计稿的宽度）
					var bili2 = height / (1336 - 48); //屏幕高度与设计稿高度的比例(1336是设计稿的高度，其中48是设计稿中含有手机顶部的状态栏，需要去掉，1366-48才是真正需要显示的东西)
					var bili = bili1 < bili2 ? bili1 : bili2; //宽度的比例和高度的比例进行比较，取值最小的
					var html = document.querySelector('html'); //选择html节点
					var rem = 16; //手动设置rem与px的比例；
					html.style.fontSize = rem + "px"; //设置html的默认fontsize为16px。(注意，浏览器中最小值为12px，)
					var __bili = bili / rem; //将比例和rem进行联系。
					document.documentElement.style.setProperty('--bili', __bili + "rem"); //设置css中的变量为--bili，值为__bili
					
				
			})
		</script>
		<style type="text/css">
			:root {
				--bili: 0.027rem;
			}
			.header {
				height: calc(var(--bili) * 80);
			}
			body{
				font-size: calc(var(--bili) * 28);
				font-family:PingFang-SC-Regular;
				background-color: rgba(248,248,248,1);;
			}
			@font-face {
				/* font-family: MyFontName;//自定义字体名称 */
				font-family:'PingFang-SC-Regular';
				src: url("../font/PINGFANG REGULAR.TTF");
			}
			.flex_row{
				display: flex;
				flex-direction: row;
			}
			.flex_column{
				display: flex;
				flex-direction: column;
			}
			.flex_center{
				display: flex;
				flex-direction: row;
				
				justify-content: center; /* 相对父元素水平居中 */
				align-items: center; 
			}
			.tab{
				width:calc(var(--bili) * 165);
				height:calc(var(--bili) * 80);
				font-size: calc(var(--bili) * 30);
				background-color: white;
			}
			.tab_icon{
				width:calc(var(--bili) * 90);
				height:calc(var(--bili) * 80);
				background-color: white;
			}
			a{
				color: black;
				text-decoration: none;
			}
			.logo{
				width:calc(var(--bili) * 209);
				height:calc(var(--bili) * 48);
				margin-left: calc(var(--bili) * 30);
			}
			.home_icon{
				width:calc(var(--bili) * 44);
				height:calc(var(--bili) * 44);
			}
			.carousel-img{
				width:calc(var(--bili) * 750);
				height:calc(var(--bili) * 422);
			}
			.item{
				width:calc(var(--bili) * 750);
				height:calc(var(--bili) * 482);
			}
			.pointer{
				display: flex;
				align-items: center;
			}
			.pointer li{
				margin-left: calc(var(--bili) * 10);
				width:calc(var(--bili) * 10);
				height:calc(var(--bili) * 10);
				border-radius:50%;
			}
			.pointer .active{
				margin-left: calc(var(--bili) * 10);
				width:calc(var(--bili) * 10);
				height:calc(var(--bili) * 10);
				border-radius:50%;
			}
			.line_0{
				font-size:calc(var(--bili) * 36);
				margin-top: calc(var(--bili) * 60);
				font-weight:bold;
			}
			.cm_img{
				width:calc(var(--bili) * 335);
				height:calc(var(--bili) * 370);
			}
			#hose_customized{
				margin-top: calc(var(--bili) * 80);
				width:calc(var(--bili) * 750);
				height:calc(var(--bili) * 435);
				background:rgba(243,243,243,1);
			}
			.hc_img{
				width:calc(var(--bili) * 218);
				height:calc(var(--bili) * 218);
			}
			.product_tab{
				width:calc(var(--bili) * 690) ;
				height: calc(var(--bili) * 66) ;
				margin-left: calc(var(--bili) * 30);
				border-bottom: calc(var(--bili) * 1) solid rgba(210,210,210,1);
				display: block;
				align-content: center;
				align-items: center;
			}
			.product_img{
				width:calc(var(--bili) * 330);
				height:calc(var(--bili) * 188);
			}
			#quality_stories{
				width:calc(var(--bili) * 750);
				height:calc(var(--bili) * 1308);
				background:rgba(243,243,243,1);
			}
			#bt{
				width:calc(var(--bili) * 300);
				height:calc(var(--bili) * 72);
				border:calc(var(--bili) * 2) solid rgba(229,229,229,1);
				font-size: calc(var(--bili) * 28);
				color:rgba(153,153,153,1);;
			}
			.bottom{
				width:calc(var(--bili) * 750);
				height:calc(var(--bili) * 733);
				background:rgba(243,243,243,1);
				margin-top: calc(var(--bili) * 60);
			}
			.search_blank{
				margin-top: calc(var(--bili) * 80);
				margin-left:calc(var(--bili) * 80) ;
				display: flex;
				width: calc(var(--bili) * 590);
				height: calc(var(--bili) * 80);
				background-color: white;
				
			}
			.b_input{
				width: calc(var(--bili) * 410);
				height:calc(var(--bili) * 80);
				background:rgba(255,255,255,1);
				border:calc(var(--bili) * 1) solid rgba(82,51,24,1);
			}
			.bt_search{
				width:calc(var(--bili) * 180);
				height:calc(var(--bili) * 80);
				background:rgba(82,51,24,1);
				color: white;
				font-size: calc(var(--bili) * 28);
			}
			.b_line2{
				font-size: calc(var(--bili) * 24);
				margin-left:calc(var(--bili) * 80) ;
				margin-top: calc(var(--bili) * 70);
				width: calc(var(--bili) * 590);
				
				border-bottom:calc(var(--bili) * 1) solid rgba(160,160,160,1);
			}
			.evaluate_tab{
				width:calc(var(--bili) * 750);
				height:calc(var(--bili) * 80);
				background:rgba(255,255,255,1);
				border-bottom:calc(var(--bili) * 1) solid rgba(220,220,220,1);
				font-size:calc(var(--bili) * 36);
				font-family:PingFang-SC-Regular;
				font-weight:400;
				color:rgba(51,51,51,1);
			}
			.return_icon{
				position: absolute;
				left: calc(var(--bili) * 48);
			}
			.return_icon img{
				width:calc(var(--bili) * 16);
				height:calc(var(--bili) * 31);
			}
			
			.list_blank{
				margin-top: calc(var(--bili) * 20);
				width:calc(var(--bili) * 750);
				background:white;
			}
			.list_tab{
				margin: calc(var(--bili) * 50) calc(var(--bili) * 30);
				width: calc(var(--bili) * 690);
				
			}
			.adress_line{
				width:calc(var(--bili) * 690);
				height:calc(var(--bili) * 3);
				background:rgba(238,238,238,1);
				margin-top: calc(var(--bili) * 40);
			}
			.confirm{
				width: calc(var(--bili) * 40);
				height: calc(var(--bili) * 40);
			}
			.cart_bottom{
				position: fixed;
				bottom: 0;
				width:calc(var(--bili) * 750);
				height:calc(var(--bili) * 120);
				background:rgba(49,49,49,1);
				color: white;
				font-size: calc(var(--bili) * 30);
			}
			.message_blank{
				width:calc(var(--bili) * 750);
				font-size: calc(var(--bili) * 32);
				
			}
			.message_tab{
				width:calc(var(--bili) * 750);
				height:calc(var(--bili) * 100);
				background:rgba(255,255,255,1);
			}
			.message_contain{
				margin-left: calc(var(--bili) * 30);
				width: calc(var(--bili) * 690);
			}
			.message_input{
				width: calc(var(--bili) * 520);
				position: relative;
				border: none;
				left:  calc(var(--bili) * 40);
			}
			::-moz-placeholder{
				color: rgba(204,204,204,1);
				z-index: 1;
			}
			::-ms-input-placeholder{
				color: rgba(204,204,204,1);
				z-index: 1;
			}
			::-webkit-input-placeholder{
				color: rgba(204,204,204,1);
				z-index: 1;
			}
			#cover{
				display: flex;
				position: absolute;
				width: calc(var(--bili) * 750);
				height: calc(var(--bili) * 1334);
				background-color: rgba(0,0,0,0.4);;
			}
			.body_fixed{
				width: calc(var(--bili) * 750);
				height: calc(var(--bili) * 1334);
				overflow: hidden;
			}
			.cover_body{
				border-radius: calc(var(--bili) * 25) calc(var(--bili) * 25) calc(var(--bili) * 0) calc(var(--bili) * 0);
				margin: calc(var(--bili) * 0) calc(var(--bili) * 10);
				width: calc(var(--bili) * 730);
				height: calc(var(--bili) * 1143);
				background-color: white;
				position: absolute;
				bottom: 0;
				overflow: auto;
				z-index: 10;
			}
			.cancel{
				position: absolute;
				right: calc(var(--bili) * 30);
				width:calc(var(--bili) * 27);
				height:calc(var(--bili) * 27);
				
			
			}
			.cover_tab{
				display: flex;
				width: 100%;
				height: calc(var(--bili) * 100);
			}
		</style>
		<script type="text/javascript">
			function show_tab(item){
				var state=$(item).attr("data-state");
				if(state=='0'){
					$(item).attr("src","../img/0通用/导航栏2.png");
					$("#show_tab").css("display","");
					$(item).attr("data-state","1");
				}else{
					$(item).attr("src","../img/0通用/导航栏1.png");
					$("#show_tab").css("display","none");
					$(item).attr("data-state","0");
				}
			}
			var cities = [
  {
    "firstName": "A",
    "name": "安徽省",
    "cityList": [
      {
        "firstName": "A",
        "name": "安庆市",
        "areaList": [
          { "firstName": "C", "name": "枞阳县" },
          { "firstName": "D", "name": "大观区" },
          { "firstName": "H", "name": "怀宁县" },
          { "firstName": "J", "name": "郊区" },
          { "firstName": "Q", "name": "潜山县" },
          { "firstName": "S", "name": "宿松县" },
          { "firstName": "T", "name": "太湖县" },
          { "firstName": "T", "name": "桐城市" },
          { "firstName": "W", "name": "望江县" },
          { "firstName": "Y", "name": "迎江区" },
          { "firstName": "Y", "name": "岳西县" }
        ]
      },
      {
        "firstName": "B",
        "name": "蚌埠市",
        "areaList": [
          { "firstName": "B", "name": "蚌山区" },
          { "firstName": "G", "name": "固镇县" },
          { "firstName": "H", "name": "淮上区" },
          { "firstName": "H", "name": "怀远县" },
          { "firstName": "L", "name": "龙子湖区" },
          { "firstName": "W", "name": "五河县" },
          { "firstName": "Y", "name": "禹会区" }
        ]
      },
      {
        "firstName": "B",
        "name": "亳州市",
        "areaList": [
          { "firstName": "L", "name": "利辛县" },
          { "firstName": "M", "name": "蒙城县" },
          { "firstName": "Q", "name": "谯城区" },
          { "firstName": "W", "name": "涡阳县" }
        ]
      },
      {
        "firstName": "C",
        "name": "滁州市",
        "areaList": [
          { "firstName": "D", "name": "定远县" },
          { "firstName": "F", "name": "凤阳县" },
          { "firstName": "L", "name": "琅琊区" },
          { "firstName": "L", "name": "来安县" },
          { "firstName": "M", "name": "明光市" },
          { "firstName": "N", "name": "南谯区" },
          { "firstName": "Q", "name": "全椒县" },
          { "firstName": "T", "name": "天长市" }
        ]
      },
      {
        "firstName": "C",
        "name": "巢湖市",
        "areaList": [
          { "firstName": "H", "name": "含山县" },
          { "firstName": "H", "name": "和县" },
          { "firstName": "J", "name": "居巢区" },
          { "firstName": "L", "name": "庐江县" },
          { "firstName": "W", "name": "无为县" }
        ]
      },
      {
        "firstName": "C",
        "name": "池州市",
        "areaList": [
          { "firstName": "D", "name": "东至县" },
          { "firstName": "G", "name": "贵池区" },
          { "firstName": "Q", "name": "青阳县" },
          { "firstName": "S", "name": "石台县" }
        ]
      },
      {
        "firstName": "F",
        "name": "阜阳市",
        "areaList": [
          { "firstName": "F", "name": "阜南县" },
          { "firstName": "J", "name": "界首市" },
          { "firstName": "L", "name": "临泉县" },
          { "firstName": "T", "name": "太和县" },
          { "firstName": "Y", "name": "颍州区" },
          { "firstName": "Y", "name": "颍东区" },
          { "firstName": "Y", "name": "颍泉区" },
          { "firstName": "Y", "name": "颍上县" }
        ]
      },
      {
        "firstName": "H",
        "name": "合肥市",
        "areaList": [
          { "firstName": "B", "name": "包河区" },
          { "firstName": "C", "name": "长丰县" },
          { "firstName": "F", "name": "肥东县" },
          { "firstName": "F", "name": "肥西县" },
          { "firstName": "L", "name": "庐阳区" },
          { "firstName": "S", "name": "蜀山区" },
          { "firstName": "Y", "name": "瑶海区" }
        ]
      },
      {
        "firstName": "H",
        "name": "淮南市",
        "areaList": [
          { "firstName": "B", "name": "八公山区" },
          { "firstName": "D", "name": "大通区" },
          { "firstName": "F", "name": "凤台县" },
          { "firstName": "P", "name": "潘集区" },
          { "firstName": "T", "name": "田家庵区" },
          { "firstName": "X", "name": "谢家集区" }
        ]
      },
      {
        "firstName": "H",
        "name": "淮北市",
        "areaList": [
          { "firstName": "D", "name": "杜集区" },
          { "firstName": "L", "name": "烈山区" },
          { "firstName": "S", "name": "濉溪县" },
          { "firstName": "X", "name": "相山区" }
        ]
      },
      {
        "firstName": "H",
        "name": "黄山市",
        "areaList": [
          { "firstName": "H", "name": "黄山区" },
          { "firstName": "H", "name": "徽州区" },
          { "firstName": "Q", "name": "祁门县" },
          { "firstName": "T", "name": "屯溪区" },
          { "firstName": "X", "name": "歙县" },
          { "firstName": "X", "name": "休宁县" },
          { "firstName": "Y", "name": "黟县" }
        ]
      },
      {
        "firstName": "L",
        "name": "六安市",
        "areaList": [
          { "firstName": "H", "name": "霍邱县" },
          { "firstName": "H", "name": "霍山县" },
          { "firstName": "J", "name": "金安区" },
          { "firstName": "J", "name": "金寨县" },
          { "firstName": "S", "name": "寿县" },
          { "firstName": "S", "name": "舒城县" },
          { "firstName": "Y", "name": "裕安区" }
        ]
      },
      {
        "firstName": "M",
        "name": "马鞍山市",
        "areaList": [
          { "firstName": "D", "name": "当涂县" },
          { "firstName": "H", "name": "花山区" },
          { "firstName": "J", "name": "金家庄区" },
          { "firstName": "Y", "name": "雨山区" }
        ]
      },
      {
        "firstName": "S",
        "name": "宿州市",
        "areaList": [
          { "firstName": "D", "name": "砀山县" },
          { "firstName": "L", "name": "灵璧县" },
          { "firstName": "S", "name": "泗县" },
          { "firstName": "X", "name": "萧县" },
          { "firstName": "Y", "name": "墉桥区" }
        ]
      },
      {
        "firstName": "T",
        "name": "铜陵市",
        "areaList": [
          { "firstName": "J", "name": "郊区" },
          { "firstName": "S", "name": "狮子山区" },
          { "firstName": "T", "name": "铜官山区" },
          { "firstName": "T", "name": "铜陵县" }
        ]
      },
      {
        "firstName": "W",
        "name": "芜湖市",
        "areaList": [
          { "firstName": "F", "name": "繁昌县" },
          { "firstName": "J", "name": "镜湖区" },
          { "firstName": "M", "name": "马塘区" },
          { "firstName": "N", "name": "南陵县" },
          { "firstName": "Q", "name": "鸠江区" },
          { "firstName": "W", "name": "芜湖县" },
          { "firstName": "X", "name": "新芜区" }
        ]
      },
      {
        "firstName": "X",
        "name": "宣城市",
        "areaList": [
          { "firstName": "G", "name": "广德县" },
          { "firstName": "J", "name": "泾县" },
          { "firstName": "J", "name": "绩溪县" },
          { "firstName": "J", "name": "旌德县" },
          { "firstName": "L", "name": "郎溪县" },
          { "firstName": "N", "name": "宁国市" },
          { "firstName": "X", "name": "宣州区" }
        ]
      }
    ]
  },
  {
    "firstName": "B",
    "name": "北京",
    "areaList": [
      { "firstName": "C", "name": "崇文区" },
      { "firstName": "C", "name": "朝阳区" },
      { "firstName": "C", "name": "昌平区" },
      { "firstName": "D", "name": "东城区" },
      { "firstName": "D", "name": "大兴区" },
      { "firstName": "F", "name": "丰台区" },
      { "firstName": "F", "name": "房山区" },
      { "firstName": "H", "name": "海淀区" },
      { "firstName": "H", "name": "怀柔区" },
      { "firstName": "M", "name": "门头沟区" },
      { "firstName": "M", "name": "密云县" },
      { "firstName": "P", "name": "平谷区" },
      { "firstName": "S", "name": "石景山区" },
      { "firstName": "S", "name": "顺义区" },
      { "firstName": "T", "name": "通州区" },
      { "firstName": "X", "name": "西城区" },
      { "firstName": "X", "name": "宣武区" },
      { "firstName": "Y", "name": "延庆县" }
    ]
  },
  {
    "firstName": "F",
    "name": "福建省",
    "cityList": [
      {
        "firstName": "F",
        "name": "福州市",
        "areaList": [
          { "firstName": "C", "name": "仓山区" },
          { "firstName": "C", "name": "长乐市" },
          { "firstName": "F", "name": "福清市" },
          { "firstName": "G", "name": "鼓楼区" },
          { "firstName": "J", "name": "晋安区" },
          { "firstName": "L", "name": "连江县" },
          { "firstName": "L", "name": "罗源县" },
          { "firstName": "M", "name": "马尾区" },
          { "firstName": "M", "name": "闽侯县" },
          { "firstName": "M", "name": "闽清县" },
          { "firstName": "P", "name": "平潭县" },
          { "firstName": "T", "name": "台江区" },
          { "firstName": "Y", "name": "永泰县" }
        ]
      },
      {
        "firstName": "L",
        "name": "龙岩市",
        "areaList": [
          { "firstName": "C", "name": "长汀县" },
          { "firstName": "L", "name": "连城县" },
          { "firstName": "S", "name": "上杭县" },
          { "firstName": "W", "name": "武平县" },
          { "firstName": "X", "name": "新罗区" },
          { "firstName": "Y", "name": "永定县" },
          { "firstName": "Z", "name": "漳平市" }
        ]
      },
      {
        "firstName": "N",
        "name": "南平市",
        "areaList": [
          { "firstName": "G", "name": "光泽县" },
          { "firstName": "J", "name": "建瓯市" },
          { "firstName": "J", "name": "建阳市" },
          { "firstName": "P", "name": "浦城县" },
          { "firstName": "S", "name": "顺昌县" },
          { "firstName": "S", "name": "松溪县" },
          { "firstName": "S", "name": "邵武市" },
          { "firstName": "W", "name": "武夷山市" },
          { "firstName": "Y", "name": "延平区" },
          { "firstName": "Z", "name": "政和县" }
        ]
      },
      {
        "firstName": "N",
        "name": "宁德市",
        "areaList": [
          { "firstName": "F", "name": "福安市" },
          { "firstName": "F", "name": "福鼎市" },
          { "firstName": "G", "name": "古田县" },
          { "firstName": "J", "name": "蕉城区" },
          { "firstName": "P", "name": "屏南县" },
          { "firstName": "S", "name": "寿宁县" },
          { "firstName": "X", "name": "霞浦县" },
          { "firstName": "Z", "name": "周宁县" },
          { "firstName": "Z", "name": "柘荣县" }
        ]
      },
      {
        "firstName": "P",
        "name": "莆田市",
        "areaList": [
          { "firstName": "C", "name": "城厢区" },
          { "firstName": "H", "name": "涵江区" },
          { "firstName": "L", "name": "荔城区" },
          { "firstName": "X", "name": "秀屿区" },
          { "firstName": "X", "name": "仙游县" }
        ]
      },
      {
        "firstName": "Q",
        "name": "泉州市",
        "areaList": [
          { "firstName": "A", "name": "安溪县" },
          { "firstName": "D", "name": "德化县" },
          { "firstName": "F", "name": "丰泽区" },
          { "firstName": "H", "name": "惠安县" },
          { "firstName": "J", "name": "金门县" },
          { "firstName": "J", "name": "晋江市" },
          { "firstName": "L", "name": "鲤城区" },
          { "firstName": "L", "name": "洛江区" },
          { "firstName": "N", "name": "南安市" },
          { "firstName": "Q", "name": "泉港区" },
          { "firstName": "S", "name": "石狮市" },
          { "firstName": "Y", "name": "永春县" }
        ]
      },
      {
        "firstName": "S",
        "name": "三明市",
        "areaList": [
          { "firstName": "D", "name": "大田县" },
          { "firstName": "J", "name": "将乐县" },
          { "firstName": "J", "name": "建宁县" },
          { "firstName": "M", "name": "梅列区" },
          { "firstName": "M", "name": "明溪县" },
          { "firstName": "N", "name": "宁化县" },
          { "firstName": "Q", "name": "清流县" },
          { "firstName": "S", "name": "三元区" },
          { "firstName": "S", "name": "沙县" },
          { "firstName": "T", "name": "泰宁县" },
          { "firstName": "Y", "name": "尤溪县" },
          { "firstName": "Y", "name": "永安市" }
        ]
      },
      {
        "firstName": "X",
        "name": "厦门市",
        "areaList": [
          { "firstName": "H", "name": "海沧区" },
          { "firstName": "H", "name": "湖里区" },
          { "firstName": "J", "name": "集美区" },
          { "firstName": "S", "name": "思明区" },
          { "firstName": "T", "name": "同安区" },
          { "firstName": "X", "name": "翔安区" }
        ]
      },
      {
        "firstName": "Z",
        "name": "漳州市",
        "areaList": [
          { "firstName": "C", "name": "长泰县" },
          { "firstName": "D", "name": "东山县" },
          { "firstName": "H", "name": "华安县" },
          { "firstName": "L", "name": "龙文区" },
          { "firstName": "L", "name": "龙海市" },
          { "firstName": "N", "name": "南靖县" },
          { "firstName": "P", "name": "平和县" },
          { "firstName": "X", "name": "芗城区" },
          { "firstName": "Y", "name": "云霄县" },
          { "firstName": "Z", "name": "漳浦县" },
          { "firstName": "Z", "name": "诏安县" }
        ]
      }
    ]
  },
  {
    "firstName": "G",
    "name": "贵州省",
    "cityList": [
      {
        "firstName": "A",
        "name": "安顺市",
        "areaList": [
          { "firstName": "G", "name": "关岭布依族苗族自治县" },
          { "firstName": "P", "name": "平坝县" },
          { "firstName": "P", "name": "普定县" },
          { "firstName": "X", "name": "西秀区" },
          { "firstName": "Z", "name": "镇宁布依族苗族自治县" },
          { "firstName": "Z", "name": "紫云苗族布依族自治县" }
        ]
      },
      {
        "firstName": "B",
        "name": "毕节地区",
        "areaList": [
          { "firstName": "B", "name": "毕节市" },
          { "firstName": "D", "name": "大方县" },
          { "firstName": "H", "name": "赫章县" },
          { "firstName": "J", "name": "金沙县" },
          { "firstName": "N", "name": "纳雍县" },
          { "firstName": "Q", "name": "黔西县" },
          { "firstName": "W", "name": "威宁彝族回族苗族自治县" },
          { "firstName": "Z", "name": "织金县" }
        ]
      },
      {
        "firstName": "G",
        "name": "贵阳市",
        "areaList": [
          { "firstName": "B", "name": "白云区" },
          { "firstName": "H", "name": "花溪区" },
          { "firstName": "K", "name": "开阳县" },
          { "firstName": "N", "name": "南明区" },
          { "firstName": "Q", "name": "清镇市" },
          { "firstName": "W", "name": "乌当区" },
          { "firstName": "X", "name": "小河区" },
          { "firstName": "X", "name": "息烽县" },
          { "firstName": "X", "name": "修文县" },
          { "firstName": "Y", "name": "云岩区" }
        ]
      },
      {
        "firstName": "L",
        "name": "六盘水市",
        "areaList": [
          { "firstName": "L", "name": "六枝特区" },
          { "firstName": "P", "name": "盘县" },
          { "firstName": "S", "name": "水城县" },
          { "firstName": "Z", "name": "钟山区" }
        ]
      },
      {
        "firstName": "Q",
        "name": "黔西南布依族苗族自治州",
        "areaList": [
          { "firstName": "A", "name": "安龙县" },
          { "firstName": "C", "name": "册亨县" },
          { "firstName": "P", "name": "普安县" },
          { "firstName": "Q", "name": "晴隆县" },
          { "firstName": "W", "name": "望谟县" },
          { "firstName": "X", "name": "兴义市" },
          { "firstName": "X", "name": "兴仁县" },
          { "firstName": "Z", "name": "贞丰县" }
        ]
      },
      {
        "firstName": "Q",
        "name": "黔东南苗族侗族自治州",
        "areaList": [
          { "firstName": "C", "name": "岑巩县" },
          { "firstName": "C", "name": "从江县" },
          { "firstName": "D", "name": "丹寨县" },
          { "firstName": "H", "name": "黄平县" },
          { "firstName": "J", "name": "锦屏县" },
          { "firstName": "J", "name": "剑河县" },
          { "firstName": "K", "name": "凯里市" },
          { "firstName": "L", "name": "黎平县" },
          { "firstName": "L", "name": "雷山县" },
          { "firstName": "M", "name": "麻江县" },
          { "firstName": "R", "name": "榕江县" },
          { "firstName": "S", "name": "施秉县" },
          { "firstName": "S", "name": "三穗县" },
          { "firstName": "T", "name": "天柱县" },
          { "firstName": "T", "name": "台江县" },
          { "firstName": "Z", "name": "镇远县" }
        ]
      },
      {
        "firstName": "Q",
        "name": "黔南布依族苗族自治州",
        "areaList": [
          { "firstName": "C", "name": "长顺县" },
          { "firstName": "D", "name": "都匀市" },
          { "firstName": "D", "name": "独山县" },
          { "firstName": "F", "name": "福泉市" },
          { "firstName": "G", "name": "贵定县" },
          { "firstName": "H", "name": "惠水县" },
          { "firstName": "L", "name": "荔波县" },
          { "firstName": "L", "name": "罗甸县" },
          { "firstName": "L", "name": "龙里县" },
          { "firstName": "P", "name": "平塘县" },
          { "firstName": "S", "name": "三都水族自治县" },
          { "firstName": "W", "name": "瓮安县" }
        ]
      },
      {
        "firstName": "T",
        "name": "铜仁地区",
        "areaList": [
          { "firstName": "D", "name": "德江县" },
          { "firstName": "J", "name": "江口县" },
          { "firstName": "S", "name": "石阡县" },
          { "firstName": "S", "name": "思南县" },
          { "firstName": "S", "name": "松桃苗族自治县" },
          { "firstName": "T", "name": "铜仁市" },
          { "firstName": "W", "name": "万山特区" },
          { "firstName": "Y", "name": "玉屏侗族自治县" },
          { "firstName": "Y", "name": "印江土家族苗族自治县" },
          { "firstName": "Y", "name": "沿河土家族自治县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "遵义市",
        "areaList": [
          { "firstName": "C", "name": "赤水市" },
          { "firstName": "D", "name": "道真仡佬族苗族自治县" },
          { "firstName": "F", "name": "凤冈县" },
          { "firstName": "H", "name": "红花岗区" },
          { "firstName": "H", "name": "汇川区" },
          { "firstName": "M", "name": "湄潭县" },
          { "firstName": "R", "name": "仁怀市" },
          { "firstName": "S", "name": "绥阳县" },
          { "firstName": "T", "name": "桐梓县" },
          { "firstName": "W", "name": "务川仡佬族苗族自治县" },
          { "firstName": "X", "name": "习水县" },
          { "firstName": "Y", "name": "余庆县" },
          { "firstName": "Z", "name": "遵义县" },
          { "firstName": "Z", "name": "正安县" }
        ]
      }
    ]
  },
  {
    "firstName": "G",
    "name": "广东省",
    "cityList": [
      {
        "firstName": "C",
        "name": "潮州市",
        "areaList": [
          { "firstName": "C", "name": "潮安县" },
          { "firstName": "R", "name": "饶平县" },
          { "firstName": "X", "name": "湘桥区" }
        ]
      },
      { "firstName": "D", "name": "东莞市", "areaList": [{ "firstName": "D", "name": "东莞市" }] },
      {
        "firstName": "F",
        "name": "佛山市",
        "areaList": [
          { "firstName": "C", "name": "禅城区" },
          { "firstName": "G", "name": "高明区" },
          { "firstName": "N", "name": "南海区" },
          { "firstName": "S", "name": "顺德区" },
          { "firstName": "S", "name": "三水区" }
        ]
      },
      {
        "firstName": "G",
        "name": "广州市",
        "areaList": [
          { "firstName": "B", "name": "白云区" },
          { "firstName": "C", "name": "从化市" },
          { "firstName": "D", "name": "东山区" },
          { "firstName": "F", "name": "芳村区" },
          { "firstName": "F", "name": "番禺区" },
          { "firstName": "H", "name": "海珠区" },
          { "firstName": "H", "name": "黄埔区" },
          { "firstName": "H", "name": "花都区" },
          { "firstName": "L", "name": "荔湾区" },
          { "firstName": "T", "name": "天河区" },
          { "firstName": "Y", "name": "越秀区" },
          { "firstName": "Z", "name": "增城市" }
        ]
      },
      {
        "firstName": "H",
        "name": "惠州市",
        "areaList": [
          { "firstName": "B", "name": "博罗县" },
          { "firstName": "H", "name": "惠城区" },
          { "firstName": "H", "name": "惠阳区" },
          { "firstName": "H", "name": "惠东县" },
          { "firstName": "L", "name": "龙门县" }
        ]
      },
      {
        "firstName": "H",
        "name": "河源市",
        "areaList": [
          { "firstName": "D", "name": "东源县" },
          { "firstName": "H", "name": "和平县" },
          { "firstName": "L", "name": "龙川县" },
          { "firstName": "L", "name": "连平县" },
          { "firstName": "Y", "name": "源城区" },
          { "firstName": "Z", "name": "紫金县" }
        ]
      },
      {
        "firstName": "J",
        "name": "江门市",
        "areaList": [
          { "firstName": "E", "name": "恩平市" },
          { "firstName": "H", "name": "鹤山市" },
          { "firstName": "J", "name": "江海区" },
          { "firstName": "K", "name": "开平市" },
          { "firstName": "P", "name": "蓬江区" },
          { "firstName": "T", "name": "台山市" },
          { "firstName": "X", "name": "新会区" }
        ]
      },
      {
        "firstName": "J",
        "name": "揭阳市",
        "areaList": [
          { "firstName": "H", "name": "惠来县" },
          { "firstName": "J", "name": "揭东县" },
          { "firstName": "J", "name": "揭西县" },
          { "firstName": "P", "name": "普宁市" },
          { "firstName": "R", "name": "榕城区" }
        ]
      },
      {
        "firstName": "M",
        "name": "茂名市",
        "areaList": [
          { "firstName": "D", "name": "电白县" },
          { "firstName": "G", "name": "高州市" },
          { "firstName": "H", "name": "化州市" },
          { "firstName": "M", "name": "茂南区" },
          { "firstName": "M", "name": "茂港区" },
          { "firstName": "X", "name": "信宜市" }
        ]
      },
      {
        "firstName": "M",
        "name": "梅州市",
        "areaList": [
          { "firstName": "D", "name": "大埔县" },
          { "firstName": "F", "name": "丰顺县" },
          { "firstName": "J", "name": "蕉岭县" },
          { "firstName": "M", "name": "梅江区" },
          { "firstName": "M", "name": "梅县" },
          { "firstName": "P", "name": "平远县" },
          { "firstName": "W", "name": "五华县" },
          { "firstName": "X", "name": "兴宁市" }
        ]
      },
      {
        "firstName": "Q",
        "name": "清远市",
        "areaList": [
          { "firstName": "F", "name": "佛冈县" },
          { "firstName": "L", "name": "连山壮族瑶族自治县" },
          { "firstName": "L", "name": "连南瑶族自治县" },
          { "firstName": "L", "name": "连州市" },
          { "firstName": "Q", "name": "清城区" },
          { "firstName": "Q", "name": "清新县" },
          { "firstName": "Y", "name": "阳山县" },
          { "firstName": "Y", "name": "英德市" }
        ]
      },
      {
        "firstName": "S",
        "name": "韶关市",
        "areaList": [
          { "firstName": "C", "name": "浈江区" },
          { "firstName": "L", "name": "乐昌市" },
          { "firstName": "N", "name": "南雄市" },
          { "firstName": "Q", "name": "曲江区" },
          { "firstName": "R", "name": "仁化县" },
          { "firstName": "R", "name": "乳源瑶族自治县" },
          { "firstName": "S", "name": "始兴县" },
          { "firstName": "W", "name": "武江区" },
          { "firstName": "W", "name": "翁源县" },
          { "firstName": "X", "name": "新丰县" }
        ]
      },
      {
        "firstName": "S",
        "name": "深圳市",
        "areaList": [
          { "firstName": "B", "name": "宝安区" },
          { "firstName": "F", "name": "福田区" },
          { "firstName": "L", "name": "罗湖区" },
          { "firstName": "L", "name": "龙岗区" },
          { "firstName": "N", "name": "南山区" },
          { "firstName": "Y", "name": "盐田区" }
        ]
      },
      {
        "firstName": "S",
        "name": "汕头市",
        "areaList": [
          { "firstName": "C", "name": "潮阳区" },
          { "firstName": "C", "name": "潮南区" },
          { "firstName": "C", "name": "澄海区" },
          { "firstName": "H", "name": "濠江区" },
          { "firstName": "J", "name": "金平区" },
          { "firstName": "L", "name": "龙湖区" },
          { "firstName": "N", "name": "南澳县" }
        ]
      },
      {
        "firstName": "S",
        "name": "汕尾市",
        "areaList": [
          { "firstName": "C", "name": "城区" },
          { "firstName": "H", "name": "海丰县" },
          { "firstName": "L", "name": "陆河县" },
          { "firstName": "L", "name": "陆丰市" }
        ]
      },
      {
        "firstName": "Y",
        "name": "阳江市",
        "areaList": [
          { "firstName": "J", "name": "江城区" },
          { "firstName": "Y", "name": "阳西县" },
          { "firstName": "Y", "name": "阳东县" },
          { "firstName": "Y", "name": "阳春市" }
        ]
      },
      {
        "firstName": "Y",
        "name": "云浮市",
        "areaList": [
          { "firstName": "L", "name": "罗定市" },
          { "firstName": "X", "name": "新兴县" },
          { "firstName": "Y", "name": "云城区" },
          { "firstName": "Y", "name": "郁南县" },
          { "firstName": "Y", "name": "云安县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "珠海市",
        "areaList": [
          { "firstName": "D", "name": "斗门区" },
          { "firstName": "J", "name": "金湾区" },
          { "firstName": "X", "name": "香洲区" }
        ]
      },
      {
        "firstName": "Z",
        "name": "湛江市",
        "areaList": [
          { "firstName": "C", "name": "赤坎区" },
          { "firstName": "L", "name": "廉江市" },
          { "firstName": "L", "name": "雷州市" },
          { "firstName": "M", "name": "麻章区" },
          { "firstName": "P", "name": "坡头区" },
          { "firstName": "S", "name": "遂溪县" },
          { "firstName": "W", "name": "吴川市" },
          { "firstName": "X", "name": "霞山区" },
          { "firstName": "X", "name": "徐闻县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "肇庆市",
        "areaList": [
          { "firstName": "D", "name": "端州区" },
          { "firstName": "D", "name": "鼎湖区" },
          { "firstName": "D", "name": "德庆县" },
          { "firstName": "F", "name": "封开县" },
          { "firstName": "G", "name": "广宁县" },
          { "firstName": "G", "name": "高要市" },
          { "firstName": "H", "name": "怀集县" },
          { "firstName": "S", "name": "四会市" }
        ]
      },
      { "firstName": "Z", "name": "中山市", "areaList": [{ "firstName": "Z", "name": "中山市" }] }
    ]
  },
  {
    "firstName": "G",
    "name": "广西壮族自治区",
    "cityList": [
      {
        "firstName": "B",
        "name": "北海市",
        "areaList": [
          { "firstName": "H", "name": "海城区" },
          { "firstName": "H", "name": "合浦县" },
          { "firstName": "T", "name": "铁山港区" },
          { "firstName": "Y", "name": "银海区" }
        ]
      },
      {
        "firstName": "B",
        "name": "百色市",
        "areaList": [
          { "firstName": "D", "name": "德保县" },
          { "firstName": "J", "name": "靖西县" },
          { "firstName": "L", "name": "凌云县" },
          { "firstName": "L", "name": "乐业县" },
          { "firstName": "L", "name": "隆林各族自治县" },
          { "firstName": "N", "name": "那坡县" },
          { "firstName": "P", "name": "平果县" },
          { "firstName": "T", "name": "田阳县" },
          { "firstName": "T", "name": "田东县" },
          { "firstName": "T", "name": "田林县" },
          { "firstName": "X", "name": "西林县" },
          { "firstName": "Y", "name": "右江区" }
        ]
      },
      {
        "firstName": "C",
        "name": "崇左市",
        "areaList": [
          { "firstName": "D", "name": "大新县" },
          { "firstName": "F", "name": "扶绥县" },
          { "firstName": "J", "name": "江洲区" },
          { "firstName": "L", "name": "龙州县" },
          { "firstName": "N", "name": "宁明县" },
          { "firstName": "P", "name": "凭祥市" },
          { "firstName": "T", "name": "天等县" }
        ]
      },
      {
        "firstName": "F",
        "name": "防城港市",
        "areaList": [
          { "firstName": "D", "name": "东兴市" },
          { "firstName": "F", "name": "防城区" },
          { "firstName": "G", "name": "港口区" },
          { "firstName": "S", "name": "上思县" }
        ]
      },
      {
        "firstName": "G",
        "name": "桂林市",
        "areaList": [
          { "firstName": "D", "name": "叠彩区" },
          { "firstName": "G", "name": "灌阳县" },
          { "firstName": "G", "name": "恭城瑶族自治县" },
          { "firstName": "L", "name": "临桂县" },
          { "firstName": "L", "name": "灵川县" },
          { "firstName": "L", "name": "龙胜各族自治县" },
          { "firstName": "L", "name": "荔蒲县" },
          { "firstName": "P", "name": "平乐县" },
          { "firstName": "Q", "name": "七星区" },
          { "firstName": "Q", "name": "全州县" },
          { "firstName": "X", "name": "秀峰区" },
          { "firstName": "X", "name": "象山区" },
          { "firstName": "X", "name": "兴安县" },
          { "firstName": "Y", "name": "雁山区" },
          { "firstName": "Y", "name": "阳朔县" },
          { "firstName": "Y", "name": "永福县" },
          { "firstName": "Z", "name": "资源县" }
        ]
      },
      {
        "firstName": "G",
        "name": "贵港市",
        "areaList": [
          { "firstName": "G", "name": "港北区" },
          { "firstName": "G", "name": "港南区" },
          { "firstName": "G", "name": "桂平市" },
          { "firstName": "P", "name": "平南县" },
          { "firstName": "T", "name": "覃塘区" }
        ]
      },
      {
        "firstName": "H",
        "name": "贺州市",
        "areaList": [
          { "firstName": "B", "name": "八步区" },
          { "firstName": "F", "name": "富川瑶族自治县" },
          { "firstName": "Z", "name": "昭平县" },
          { "firstName": "Z", "name": "钟山县" }
        ]
      },
      {
        "firstName": "H",
        "name": "河池市",
        "areaList": [
          { "firstName": "B", "name": "巴马瑶族自治县" },
          { "firstName": "D", "name": "东兰县" },
          { "firstName": "D", "name": "都安瑶族自治县" },
          { "firstName": "D", "name": "大化瑶族自治县" },
          { "firstName": "F", "name": "凤山县" },
          { "firstName": "H", "name": "环江毛南族自治县" },
          { "firstName": "J", "name": "金城江区" },
          { "firstName": "L", "name": "罗城仫佬族自治县" },
          { "firstName": "N", "name": "南丹县" },
          { "firstName": "T", "name": "天峨县" },
          { "firstName": "Y", "name": "宜州市" }
        ]
      },
      {
        "firstName": "L",
        "name": "柳州市",
        "areaList": [
          { "firstName": "C", "name": "城中区" },
          { "firstName": "L", "name": "柳南区" },
          { "firstName": "L", "name": "柳北区" },
          { "firstName": "L", "name": "柳江县" },
          { "firstName": "L", "name": "柳城县" },
          { "firstName": "L", "name": "鹿寨县" },
          { "firstName": "R", "name": "融安县" },
          { "firstName": "R", "name": "融水苗族自治县" },
          { "firstName": "S", "name": "三江侗族自治县" },
          { "firstName": "Y", "name": "鱼峰区" }
        ]
      },
      {
        "firstName": "L",
        "name": "来宾市",
        "areaList": [
          { "firstName": "H", "name": "合山市" },
          { "firstName": "J", "name": "金秀瑶族自治县" },
          { "firstName": "W", "name": "武宣县" },
          { "firstName": "X", "name": "兴宾区" },
          { "firstName": "X", "name": "忻城县" },
          { "firstName": "X", "name": "象州县" }
        ]
      },
      {
        "firstName": "N",
        "name": "南宁市",
        "areaList": [
          { "firstName": "B", "name": "宾阳县" },
          { "firstName": "H", "name": "横　县" },
          { "firstName": "J", "name": "江南区" },
          { "firstName": "L", "name": "良庆区" },
          { "firstName": "L", "name": "隆安县" },
          { "firstName": "M", "name": "马山县" },
          { "firstName": "Q", "name": "青秀区" },
          { "firstName": "S", "name": "上林县" },
          { "firstName": "W", "name": "武鸣县" },
          { "firstName": "X", "name": "兴宁区" },
          { "firstName": "X", "name": "西乡塘区" },
          { "firstName": "Y", "name": "邕宁区" }
        ]
      },
      {
        "firstName": "Q",
        "name": "钦州市",
        "areaList": [
          { "firstName": "L", "name": "灵山县" },
          { "firstName": "P", "name": "浦北县" },
          { "firstName": "Q", "name": "钦南区" },
          { "firstName": "Q", "name": "钦北区" }
        ]
      },
      {
        "firstName": "W",
        "name": "梧州市",
        "areaList": [
          { "firstName": "C", "name": "长洲区" },
          { "firstName": "C", "name": "苍梧县" },
          { "firstName": "C", "name": "岑溪市" },
          { "firstName": "D", "name": "蝶山区" },
          { "firstName": "M", "name": "蒙山县" },
          { "firstName": "T", "name": "藤　县" },
          { "firstName": "W", "name": "万秀区" }
        ]
      },
      {
        "firstName": "Y",
        "name": "玉林市",
        "areaList": [
          { "firstName": "B", "name": "博白县" },
          { "firstName": "B", "name": "北流市" },
          { "firstName": "L", "name": "陆川县" },
          { "firstName": "R", "name": "容县" },
          { "firstName": "X", "name": "兴业县" },
          { "firstName": "Y", "name": "玉州区" }
        ]
      }
    ]
  },
  {
    "firstName": "G",
    "name": "甘肃省",
    "cityList": [
      {
        "firstName": "B",
        "name": "白银市",
        "areaList": [
          { "firstName": "B", "name": "白银区" },
          { "firstName": "H", "name": "会宁县" },
          { "firstName": "J", "name": "靖远县" },
          { "firstName": "J", "name": "景泰县" },
          { "firstName": "P", "name": "平川区" }
        ]
      },
      {
        "firstName": "D",
        "name": "定西市",
        "areaList": [
          { "firstName": "A", "name": "安定区" },
          { "firstName": "L", "name": "陇西县" },
          { "firstName": "L", "name": "临洮县" },
          { "firstName": "M", "name": "岷县" },
          { "firstName": "T", "name": "通渭县" },
          { "firstName": "W", "name": "渭源县" },
          { "firstName": "Z", "name": "漳县" }
        ]
      },
      {
        "firstName": "G",
        "name": "甘南藏族自治州",
        "areaList": [
          { "firstName": "D", "name": "迭部县" },
          { "firstName": "H", "name": "合作市" },
          { "firstName": "L", "name": "临潭县" },
          { "firstName": "L", "name": "碌曲县" },
          { "firstName": "M", "name": "玛曲县" },
          { "firstName": "X", "name": "夏河县" },
          { "firstName": "Z", "name": "卓尼县" },
          { "firstName": "Z", "name": "舟曲县" }
        ]
      },
      { "firstName": "J", "name": "嘉峪关市", "areaList": [{ "firstName": "S", "name": "市辖区" }] },
      {
        "firstName": "J",
        "name": "金昌市",
        "areaList": [{ "firstName": "J", "name": "金川区" }, { "firstName": "Y", "name": "永昌县" }]
      },
      {
        "firstName": "J",
        "name": "酒泉市",
        "areaList": [
          { "firstName": "A", "name": "安西县" },
          { "firstName": "A", "name": "阿克塞哈萨克族自治县" },
          { "firstName": "D", "name": "敦煌市" },
          { "firstName": "J", "name": "金塔县" },
          { "firstName": "S", "name": "肃州区" },
          { "firstName": "S", "name": "肃北蒙古族自治县" },
          { "firstName": "Y", "name": "玉门市" }
        ]
      },
      {
        "firstName": "L",
        "name": "兰州市",
        "areaList": [
          { "firstName": "A", "name": "安宁区" },
          { "firstName": "C", "name": "城关区" },
          { "firstName": "G", "name": "皋兰县" },
          { "firstName": "H", "name": "红古区" },
          { "firstName": "Q", "name": "七里河区" },
          { "firstName": "X", "name": "西固区" },
          { "firstName": "Y", "name": "永登县" },
          { "firstName": "Y", "name": "榆中县" }
        ]
      },
      {
        "firstName": "L",
        "name": "陇南市",
        "areaList": [
          { "firstName": "C", "name": "成　县" },
          { "firstName": "D", "name": "宕昌县" },
          { "firstName": "H", "name": "徽县" },
          { "firstName": "K", "name": "康县" },
          { "firstName": "L", "name": "礼县" },
          { "firstName": "L", "name": "两当县" },
          { "firstName": "W", "name": "武都区" },
          { "firstName": "W", "name": "文县" },
          { "firstName": "X", "name": "西和县" }
        ]
      },
      {
        "firstName": "L",
        "name": "临夏回族自治州",
        "areaList": [
          { "firstName": "D", "name": "东乡族自治县" },
          { "firstName": "G", "name": "广河县" },
          { "firstName": "H", "name": "和政县" },
          { "firstName": "J", "name": "积石山保安族东乡族撒拉族自治县" },
          { "firstName": "K", "name": "康乐县" },
          { "firstName": "L", "name": "临夏市" },
          { "firstName": "L", "name": "临夏县" },
          { "firstName": "Y", "name": "永靖县" }
        ]
      },
      {
        "firstName": "P",
        "name": "平凉市",
        "areaList": [
          { "firstName": "C", "name": "崇信县" },
          { "firstName": "H", "name": "华亭县" },
          { "firstName": "J", "name": "泾川县" },
          { "firstName": "J", "name": "静宁县" },
          { "firstName": "K", "name": "崆峒区" },
          { "firstName": "L", "name": "灵台县" },
          { "firstName": "Z", "name": "庄浪县" }
        ]
      },
      {
        "firstName": "Q",
        "name": "庆阳市",
        "areaList": [
          { "firstName": "H", "name": "环县" },
          { "firstName": "H", "name": "华池县" },
          { "firstName": "H", "name": "合水县" },
          { "firstName": "N", "name": "宁县" },
          { "firstName": "Q", "name": "庆城县" },
          { "firstName": "X", "name": "西峰区" },
          { "firstName": "Z", "name": "正宁县" },
          { "firstName": "Z", "name": "镇原县" }
        ]
      },
      {
        "firstName": "T",
        "name": "天水市",
        "areaList": [
          { "firstName": "B", "name": "北道区" },
          { "firstName": "G", "name": "甘谷县" },
          { "firstName": "Q", "name": "秦城区" },
          { "firstName": "Q", "name": "清水县" },
          { "firstName": "Q", "name": "秦安县" },
          { "firstName": "W", "name": "武山县" },
          { "firstName": "Z", "name": "张家川回族自治县" }
        ]
      },
      {
        "firstName": "W",
        "name": "武威市",
        "areaList": [
          { "firstName": "G", "name": "古浪县" },
          { "firstName": "L", "name": "凉州区" },
          { "firstName": "M", "name": "民勤县" },
          { "firstName": "T", "name": "天祝藏族自治县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "张掖市",
        "areaList": [
          { "firstName": "G", "name": "甘州区" },
          { "firstName": "G", "name": "高台县" },
          { "firstName": "L", "name": "临泽县" },
          { "firstName": "M", "name": "民乐县" },
          { "firstName": "S", "name": "肃南裕固族自治县" },
          { "firstName": "S", "name": "山丹县" }
        ]
      }
    ]
  },
  {
    "firstName": "H",
    "name": "河南省",
    "cityList": [
      {
        "firstName": "A",
        "name": "安阳市",
        "areaList": [
          { "firstName": "A", "name": "安阳县" },
          { "firstName": "B", "name": "北关区" },
          { "firstName": "H", "name": "滑　县" },
          { "firstName": "L", "name": "龙安区" },
          { "firstName": "L", "name": "林州市" },
          { "firstName": "N", "name": "内黄县" },
          { "firstName": "T", "name": "汤阴县" },
          { "firstName": "W", "name": "文峰区" },
          { "firstName": "Y", "name": "殷都区" }
        ]
      },
      {
        "firstName": "H",
        "name": "鹤壁市",
        "areaList": [
          { "firstName": "H", "name": "鹤山区" },
          { "firstName": "J", "name": "浚　县" },
          { "firstName": "Q", "name": "淇滨区" },
          { "firstName": "Q", "name": "淇　县" },
          { "firstName": "S", "name": "山城区" }
        ]
      },
      {
        "firstName": "J",
        "name": "焦作市",
        "areaList": [
          { "firstName": "B", "name": "博爱县" },
          { "firstName": "J", "name": "解放区" },
          { "firstName": "J", "name": "济源市" },
          { "firstName": "M", "name": "马村区" },
          { "firstName": "M", "name": "孟州市" },
          { "firstName": "Q", "name": "沁阳市" },
          { "firstName": "S", "name": "山阳区" },
          { "firstName": "W", "name": "武陟县" },
          { "firstName": "W", "name": "温县" },
          { "firstName": "X", "name": "修武县" },
          { "firstName": "Z", "name": "中站区" }
        ]
      },
      {
        "firstName": "K",
        "name": "开封市",
        "areaList": [
          { "firstName": "G", "name": "鼓楼区" },
          { "firstName": "J", "name": "郊　区" },
          { "firstName": "K", "name": "开封县" },
          { "firstName": "L", "name": "龙亭区" },
          { "firstName": "L", "name": "兰考县" },
          { "firstName": "N", "name": "南关区" },
          { "firstName": "Q", "name": "杞　县" },
          { "firstName": "S", "name": "顺河回族区" },
          { "firstName": "T", "name": "通许县" },
          { "firstName": "W", "name": "尉氏县" }
        ]
      },
      {
        "firstName": "L",
        "name": "洛阳市",
        "areaList": [
          { "firstName": "C", "name": "廛河回族区" },
          { "firstName": "J", "name": "涧西区" },
          { "firstName": "J", "name": "吉利区" },
          { "firstName": "L", "name": "老城区" },
          { "firstName": "L", "name": "洛龙区" },
          { "firstName": "L", "name": "栾川县" },
          { "firstName": "L", "name": "洛宁县" },
          { "firstName": "M", "name": "孟津县" },
          { "firstName": "R", "name": "汝阳县" },
          { "firstName": "S", "name": "嵩　县" },
          { "firstName": "X", "name": "西工区" },
          { "firstName": "X", "name": "新安县" },
          { "firstName": "Y", "name": "宜阳县" },
          { "firstName": "Y", "name": "伊川县" },
          { "firstName": "Y", "name": "偃师市" }
        ]
      },
      {
        "firstName": "L",
        "name": "漯河市",
        "areaList": [
          { "firstName": "L", "name": "临颍县" },
          { "firstName": "W", "name": "舞阳县" },
          { "firstName": "Y", "name": "源汇区" },
          { "firstName": "Y", "name": "郾城区" },
          { "firstName": "Z", "name": "召陵区" }
        ]
      },
      {
        "firstName": "N",
        "name": "南阳市",
        "areaList": [
          { "firstName": "D", "name": "邓州市" },
          { "firstName": "F", "name": "方城县" },
          { "firstName": "N", "name": "南召县" },
          { "firstName": "N", "name": "内乡县" },
          { "firstName": "S", "name": "社旗县" },
          { "firstName": "T", "name": "唐河县" },
          { "firstName": "T", "name": "桐柏县" },
          { "firstName": "W", "name": "宛城区" },
          { "firstName": "W", "name": "卧龙区" },
          { "firstName": "X", "name": "西峡县" },
          { "firstName": "X", "name": "淅川县" },
          { "firstName": "X", "name": "新野县" },
          { "firstName": "Z", "name": "镇平县" }
        ]
      },
      {
        "firstName": "P",
        "name": "平顶山市",
        "areaList": [
          { "firstName": "B", "name": "宝丰县" },
          { "firstName": "J", "name": "郏　县" },
          { "firstName": "L", "name": "鲁山县" },
          { "firstName": "R", "name": "汝州市" },
          { "firstName": "S", "name": "石龙区" },
          { "firstName": "W", "name": "卫东区" },
          { "firstName": "W", "name": "舞钢市" },
          { "firstName": "X", "name": "新华区" },
          { "firstName": "Y", "name": "叶　县" },
          { "firstName": "Z", "name": "湛河区" }
        ]
      },
      {
        "firstName": "P",
        "name": "濮阳市",
        "areaList": [
          { "firstName": "F", "name": "范县" },
          { "firstName": "H", "name": "华龙区" },
          { "firstName": "N", "name": "南乐县" },
          { "firstName": "P", "name": "濮阳县" },
          { "firstName": "Q", "name": "清丰县" },
          { "firstName": "T", "name": "台前县" }
        ]
      },
      {
        "firstName": "S",
        "name": "三门峡市",
        "areaList": [
          { "firstName": "H", "name": "湖滨区" },
          { "firstName": "L", "name": "卢氏县" },
          { "firstName": "L", "name": "灵宝市" },
          { "firstName": "S", "name": "渑池县" },
          { "firstName": "S", "name": "陕县" },
          { "firstName": "Y", "name": "义马市" }
        ]
      },
      {
        "firstName": "S",
        "name": "商丘市",
        "areaList": [
          { "firstName": "L", "name": "梁园区" },
          { "firstName": "M", "name": "民权县" },
          { "firstName": "N", "name": "宁陵县" },
          { "firstName": "S", "name": "睢阳区" },
          { "firstName": "S", "name": "睢县" },
          { "firstName": "X", "name": "夏邑县" },
          { "firstName": "Y", "name": "虞城县" },
          { "firstName": "Y", "name": "永城市" },
          { "firstName": "Z", "name": "柘城县" }
        ]
      },
      {
        "firstName": "X",
        "name": "新乡市",
        "areaList": [
          { "firstName": "C", "name": "长垣县" },
          { "firstName": "F", "name": "凤泉区" },
          { "firstName": "F", "name": "封丘县" },
          { "firstName": "H", "name": "红旗区" },
          { "firstName": "H", "name": "获嘉县" },
          { "firstName": "H", "name": "辉县市" },
          { "firstName": "M", "name": "牧野区" },
          { "firstName": "W", "name": "卫滨区" },
          { "firstName": "W", "name": "卫辉市" },
          { "firstName": "X", "name": "新乡县" },
          { "firstName": "Y", "name": "原阳县" },
          { "firstName": "Y", "name": "延津县" }
        ]
      },
      {
        "firstName": "X",
        "name": "许昌市",
        "areaList": [
          { "firstName": "C", "name": "长葛市" },
          { "firstName": "W", "name": "魏都区" },
          { "firstName": "X", "name": "许昌县" },
          { "firstName": "X", "name": "襄城县" },
          { "firstName": "Y", "name": "鄢陵县" },
          { "firstName": "Y", "name": "禹州市" }
        ]
      },
      {
        "firstName": "X",
        "name": "信阳市",
        "areaList": [
          { "firstName": "G", "name": "光山县" },
          { "firstName": "G", "name": "固始县" },
          { "firstName": "H", "name": "潢川县" },
          { "firstName": "H", "name": "淮滨县" },
          { "firstName": "L", "name": "罗山县" },
          { "firstName": "P", "name": "平桥区" },
          { "firstName": "S", "name": "师河区" },
          { "firstName": "S", "name": "商城县" },
          { "firstName": "X", "name": "新　县" },
          { "firstName": "X", "name": "息　县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "郑州市",
        "areaList": [
          { "firstName": "D", "name": "登封市" },
          { "firstName": "E", "name": "二七区" },
          { "firstName": "G", "name": "管城回族区" },
          { "firstName": "G", "name": "巩义市" },
          { "firstName": "J", "name": "金水区" },
          { "firstName": "M", "name": "邙山区" },
          { "firstName": "S", "name": "上街区" },
          { "firstName": "X", "name": "荥阳市" },
          { "firstName": "X", "name": "新密市" },
          { "firstName": "X", "name": "新郑市" },
          { "firstName": "Z", "name": "中原区" },
          { "firstName": "Z", "name": "中牟县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "周口市",
        "areaList": [
          { "firstName": "C", "name": "川汇区" },
          { "firstName": "D", "name": "郸城县" },
          { "firstName": "F", "name": "扶沟县" },
          { "firstName": "H", "name": "淮阳县" },
          { "firstName": "L", "name": "鹿邑县" },
          { "firstName": "S", "name": "商水县" },
          { "firstName": "S", "name": "沈丘县" },
          { "firstName": "T", "name": "太康县" },
          { "firstName": "X", "name": "西华县" },
          { "firstName": "X", "name": "项城市" }
        ]
      },
      {
        "firstName": "Z",
        "name": "驻马店市",
        "areaList": [
          { "firstName": "M", "name": "泌阳县" },
          { "firstName": "P", "name": "平舆县" },
          { "firstName": "Q", "name": "确山县" },
          { "firstName": "R", "name": "汝南县" },
          { "firstName": "S", "name": "上蔡县" },
          { "firstName": "S", "name": "遂平县" },
          { "firstName": "X", "name": "西平县" },
          { "firstName": "X", "name": "新蔡县" },
          { "firstName": "Y", "name": "驿城区" },
          { "firstName": "Z", "name": "正阳县" }
        ]
      }
    ]
  },
  {
    "firstName": "H",
    "name": "湖北省",
    "cityList": [
      {
        "firstName": "E",
        "name": "鄂州市",
        "areaList": [
          { "firstName": "E", "name": "鄂城区" },
          { "firstName": "H", "name": "华容区" },
          { "firstName": "L", "name": "梁子湖区" }
        ]
      },
      {
        "firstName": "E",
        "name": "恩施土家族苗族自治州",
        "areaList": [
          { "firstName": "B", "name": "巴东县" },
          { "firstName": "E", "name": "恩施市" },
          { "firstName": "H", "name": "鹤峰县" },
          { "firstName": "J", "name": "建始县" },
          { "firstName": "L", "name": "利川市" },
          { "firstName": "L", "name": "来凤县" },
          { "firstName": "X", "name": "宣恩县" },
          { "firstName": "X", "name": "咸丰县" }
        ]
      },
      {
        "firstName": "H",
        "name": "黄石市",
        "areaList": [
          { "firstName": "D", "name": "大冶市" },
          { "firstName": "H", "name": "黄石港区" },
          { "firstName": "T", "name": "铁山区" },
          { "firstName": "X", "name": "西塞山区" },
          { "firstName": "X", "name": "下陆区" },
          { "firstName": "Y", "name": "阳新县" }
        ]
      },
      {
        "firstName": "H",
        "name": "黄冈市",
        "areaList": [
          { "firstName": "H", "name": "黄州区" },
          { "firstName": "H", "name": "红安县" },
          { "firstName": "H", "name": "黄梅县" },
          { "firstName": "L", "name": "罗田县" },
          { "firstName": "M", "name": "麻城市" },
          { "firstName": "Q", "name": "蕲春县" },
          { "firstName": "T", "name": "团风县" },
          { "firstName": "W", "name": "武穴市" },
          { "firstName": "X", "name": "浠水县" },
          { "firstName": "Y", "name": "英山县" }
        ]
      },
      {
        "firstName": "J",
        "name": "荆门市",
        "areaList": [
          { "firstName": "D", "name": "东宝区" },
          { "firstName": "D", "name": "掇刀区" },
          { "firstName": "J", "name": "京山县" },
          { "firstName": "S", "name": "沙洋县" },
          { "firstName": "Z", "name": "钟祥市" }
        ]
      },
      {
        "firstName": "J",
        "name": "荆州市",
        "areaList": [
          { "firstName": "G", "name": "公安县" },
          { "firstName": "H", "name": "洪湖市" },
          { "firstName": "J", "name": "荆州区" },
          { "firstName": "J", "name": "监利县" },
          { "firstName": "J", "name": "江陵县" },
          { "firstName": "S", "name": "沙市区" },
          { "firstName": "S", "name": "石首市" },
          { "firstName": "S", "name": "松滋市" }
        ]
      },
      {
        "firstName": "S",
        "name": "十堰市",
        "areaList": [
          { "firstName": "D", "name": "丹江口市" },
          { "firstName": "F", "name": "房县" },
          { "firstName": "M", "name": "茅箭区" },
          { "firstName": "Y", "name": "郧县" },
          { "firstName": "Y", "name": "郧西县" },
          { "firstName": "Z", "name": "张湾区" },
          { "firstName": "Z", "name": "竹山县" },
          { "firstName": "Z", "name": "竹溪县" }
        ]
      },
      {
        "firstName": "S",
        "name": "随州市",
        "areaList": [{ "firstName": "G", "name": "广水市" }, { "firstName": "Z", "name": "曾都区" }]
      },
      {
        "firstName": "S",
        "name": "省直辖行政单位",
        "areaList": [
          { "firstName": "Q", "name": "潜江市" },
          { "firstName": "S", "name": "神农架林区" },
          { "firstName": "T", "name": "天门市" },
          { "firstName": "X", "name": "仙桃市" }
        ]
      },
      {
        "firstName": "W",
        "name": "武汉市",
        "areaList": [
          { "firstName": "C", "name": "蔡甸区" },
          { "firstName": "D", "name": "东西湖区" },
          { "firstName": "H", "name": "汉阳区" },
          { "firstName": "H", "name": "洪山区" },
          { "firstName": "H", "name": "汉南区" },
          { "firstName": "H", "name": "黄陂区" },
          { "firstName": "J", "name": "江岸区" },
          { "firstName": "J", "name": "江汉区" },
          { "firstName": "J", "name": "江夏区" },
          { "firstName": "Q", "name": "乔口区" },
          { "firstName": "Q", "name": "青山区" },
          { "firstName": "W", "name": "武昌区" },
          { "firstName": "X", "name": "新洲区" }
        ]
      },
      {
        "firstName": "X",
        "name": "襄樊市",
        "areaList": [
          { "firstName": "B", "name": "保康县" },
          { "firstName": "F", "name": "樊城区" },
          { "firstName": "G", "name": "谷城县" },
          { "firstName": "L", "name": "老河口市" },
          { "firstName": "N", "name": "南漳县" },
          { "firstName": "X", "name": "襄城区" },
          { "firstName": "X", "name": "襄阳区" },
          { "firstName": "Y", "name": "宜城市" },
          { "firstName": "Z", "name": "枣阳市" }
        ]
      },
      {
        "firstName": "X",
        "name": "孝感市",
        "areaList": [
          { "firstName": "A", "name": "安陆市" },
          { "firstName": "D", "name": "大悟县" },
          { "firstName": "H", "name": "汉川市" },
          { "firstName": "X", "name": "孝南区" },
          { "firstName": "X", "name": "孝昌县" },
          { "firstName": "Y", "name": "云梦县" },
          { "firstName": "Y", "name": "应城市" }
        ]
      },
      {
        "firstName": "X",
        "name": "咸宁市",
        "areaList": [
          { "firstName": "C", "name": "崇阳县" },
          { "firstName": "C", "name": "赤壁市" },
          { "firstName": "J", "name": "嘉鱼县" },
          { "firstName": "T", "name": "通城县" },
          { "firstName": "T", "name": "通山县" },
          { "firstName": "X", "name": "咸安区" }
        ]
      },
      {
        "firstName": "Y",
        "name": "宜昌市",
        "areaList": [
          { "firstName": "C", "name": "长阳土家族自治县" },
          { "firstName": "D", "name": "点军区" },
          { "firstName": "D", "name": "当阳市" },
          { "firstName": "T", "name": "猇亭区" },
          { "firstName": "W", "name": "伍家岗区" },
          { "firstName": "W", "name": "五峰土家族自治县" },
          { "firstName": "X", "name": "西陵区" },
          { "firstName": "X", "name": "兴山县" },
          { "firstName": "Y", "name": "夷陵区" },
          { "firstName": "Y", "name": "远安县" },
          { "firstName": "Y", "name": "宜都市" },
          { "firstName": "Z", "name": "秭归县" },
          { "firstName": "Z", "name": "枝江市" }
        ]
      }
    ]
  },
  {
    "firstName": "H",
    "name": "湖南省",
    "cityList": [
      {
        "firstName": "C",
        "name": "长沙市",
        "areaList": [
          { "firstName": "C", "name": "长沙县" },
          { "firstName": "F", "name": "芙蓉区" },
          { "firstName": "K", "name": "开福区" },
          { "firstName": "L", "name": "浏阳市" },
          { "firstName": "N", "name": "宁乡县" },
          { "firstName": "T", "name": "天心区" },
          { "firstName": "W", "name": "望城县" },
          { "firstName": "Y", "name": "岳麓区" },
          { "firstName": "Y", "name": "雨花区" }
        ]
      },
      {
        "firstName": "C",
        "name": "常德市",
        "areaList": [
          { "firstName": "A", "name": "安乡县" },
          { "firstName": "D", "name": "鼎城区" },
          { "firstName": "H", "name": "汉寿县" },
          { "firstName": "J", "name": "津市市" },
          { "firstName": "L", "name": "澧县" },
          { "firstName": "L", "name": "临澧县" },
          { "firstName": "S", "name": "石门县" },
          { "firstName": "T", "name": "桃源县" },
          { "firstName": "W", "name": "武陵区" }
        ]
      },
      {
        "firstName": "C",
        "name": "郴州市",
        "areaList": [
          { "firstName": "A", "name": "安仁县" },
          { "firstName": "B", "name": "北湖区" },
          { "firstName": "G", "name": "桂阳县" },
          { "firstName": "G", "name": "桂东县" },
          { "firstName": "J", "name": "嘉禾县" },
          { "firstName": "L", "name": "临武县" },
          { "firstName": "R", "name": "汝城县" },
          { "firstName": "S", "name": "苏仙区" },
          { "firstName": "Y", "name": "宜章县" },
          { "firstName": "Y", "name": "永兴县" },
          { "firstName": "Z", "name": "资兴市" }
        ]
      },
      {
        "firstName": "H",
        "name": "衡阳市",
        "areaList": [
          { "firstName": "C", "name": "常宁市" },
          { "firstName": "H", "name": "衡阳县" },
          { "firstName": "H", "name": "衡南县" },
          { "firstName": "H", "name": "衡山县" },
          { "firstName": "H", "name": "衡东县" },
          { "firstName": "L", "name": "耒阳市" },
          { "firstName": "N", "name": "南岳区" },
          { "firstName": "Q", "name": "祁东县" },
          { "firstName": "S", "name": "石鼓区" },
          { "firstName": "Y", "name": "雁峰区" },
          { "firstName": "Z", "name": "珠晖区" },
          { "firstName": "Z", "name": "蒸湘区" }
        ]
      },
      {
        "firstName": "H",
        "name": "怀化市",
        "areaList": [
          { "firstName": "C", "name": "辰溪县" },
          { "firstName": "H", "name": "鹤城区" },
          { "firstName": "H", "name": "会同县" },
          { "firstName": "H", "name": "洪江市" },
          { "firstName": "J", "name": "靖州苗族侗族自治县" },
          { "firstName": "M", "name": "麻阳苗族自治县" },
          { "firstName": "T", "name": "通道侗族自治县" },
          { "firstName": "X", "name": "溆浦县" },
          { "firstName": "X", "name": "新晃侗族自治县" },
          { "firstName": "Y", "name": "沅陵县" },
          { "firstName": "Z", "name": "中方县" },
          { "firstName": "Z", "name": "芷江侗族自治县" }
        ]
      },
      {
        "firstName": "L",
        "name": "娄底市",
        "areaList": [
          { "firstName": "L", "name": "娄星区" },
          { "firstName": "L", "name": "冷水江市" },
          { "firstName": "L", "name": "涟源市" },
          { "firstName": "S", "name": "双峰县" },
          { "firstName": "X", "name": "新化县" }
        ]
      },
      {
        "firstName": "S",
        "name": "邵阳市",
        "areaList": [
          { "firstName": "B", "name": "北塔区" },
          { "firstName": "C", "name": "城步苗族自治县" },
          { "firstName": "D", "name": "大祥区" },
          { "firstName": "D", "name": "洞口县" },
          { "firstName": "L", "name": "隆回县" },
          { "firstName": "S", "name": "双清区" },
          { "firstName": "S", "name": "邵东县" },
          { "firstName": "S", "name": "邵阳县" },
          { "firstName": "S", "name": "绥宁县" },
          { "firstName": "W", "name": "武冈市" },
          { "firstName": "X", "name": "新邵县" },
          { "firstName": "X", "name": "新宁县" }
        ]
      },
      {
        "firstName": "X",
        "name": "湘潭市",
        "areaList": [
          { "firstName": "S", "name": "韶山市" },
          { "firstName": "X", "name": "湘潭县" },
          { "firstName": "X", "name": "湘乡市" },
          { "firstName": "Y", "name": "雨湖区" },
          { "firstName": "Y", "name": "岳塘区" }
        ]
      },
      {
        "firstName": "X",
        "name": "湘西土家族苗族自治州",
        "areaList": [
          { "firstName": "B", "name": "保靖县" },
          { "firstName": "F", "name": "凤凰县" },
          { "firstName": "G", "name": "古丈县" },
          { "firstName": "H", "name": "花垣县" },
          { "firstName": "J", "name": "吉首市" },
          { "firstName": "L", "name": "泸溪县" },
          { "firstName": "L", "name": "龙山县" },
          { "firstName": "Y", "name": "永顺县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "岳阳市",
        "areaList": [
          { "firstName": "H", "name": "华容县" },
          { "firstName": "J", "name": "君山区" },
          { "firstName": "L", "name": "临湘市" },
          { "firstName": "M", "name": "汨罗市" },
          { "firstName": "P", "name": "平江县" },
          { "firstName": "X", "name": "湘阴县" },
          { "firstName": "Y", "name": "岳阳楼区" },
          { "firstName": "Y", "name": "云溪区" },
          { "firstName": "Y", "name": "岳阳县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "益阳市",
        "areaList": [
          { "firstName": "A", "name": "安化县" },
          { "firstName": "H", "name": "赫山区" },
          { "firstName": "N", "name": "南县" },
          { "firstName": "T", "name": "桃江县" },
          { "firstName": "Y", "name": "沅江市" },
          { "firstName": "Z", "name": "资阳区" }
        ]
      },
      {
        "firstName": "Y",
        "name": "永州市",
        "areaList": [
          { "firstName": "D", "name": "东安县" },
          { "firstName": "D", "name": "道　县" },
          { "firstName": "J", "name": "江永县" },
          { "firstName": "J", "name": "江华瑶族自治县" },
          { "firstName": "L", "name": "冷水滩区" },
          { "firstName": "L", "name": "蓝山县" },
          { "firstName": "N", "name": "宁远县" },
          { "firstName": "Q", "name": "祁阳县" },
          { "firstName": "S", "name": "双牌县" },
          { "firstName": "X", "name": "新田县" },
          { "firstName": "Z", "name": "芝山区" }
        ]
      },
      {
        "firstName": "Z",
        "name": "株洲市",
        "areaList": [
          { "firstName": "C", "name": "茶陵县" },
          { "firstName": "H", "name": "荷塘区" },
          { "firstName": "L", "name": "芦淞区" },
          { "firstName": "L", "name": "醴陵市" },
          { "firstName": "S", "name": "石峰区" },
          { "firstName": "T", "name": "天元区" },
          { "firstName": "Y", "name": "攸县" },
          { "firstName": "Y", "name": "炎陵县" },
          { "firstName": "Z", "name": "株洲县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "张家界市",
        "areaList": [
          { "firstName": "C", "name": "慈利县" },
          { "firstName": "S", "name": "桑植县" },
          { "firstName": "W", "name": "武陵源区" },
          { "firstName": "Y", "name": "永定区" }
        ]
      }
    ]
  },
  {
    "firstName": "H",
    "name": "河北省",
    "cityList": [
      {
        "firstName": "B",
        "name": "保定市",
        "areaList": [
          { "firstName": "A", "name": "安新县" },
          { "firstName": "A", "name": "安国市" },
          { "firstName": "B", "name": "北市区" },
          { "firstName": "B", "name": "博野县" },
          { "firstName": "D", "name": "定兴县" },
          { "firstName": "D", "name": "定州市" },
          { "firstName": "F", "name": "阜平县" },
          { "firstName": "G", "name": "高阳县" },
          { "firstName": "G", "name": "高碑店市" },
          { "firstName": "L", "name": "涞水县" },
          { "firstName": "L", "name": "涞源县" },
          { "firstName": "L", "name": "蠡县" },
          { "firstName": "M", "name": "满城县" },
          { "firstName": "N", "name": "南市区" },
          { "firstName": "Q", "name": "清苑县" },
          { "firstName": "Q", "name": "曲阳县" },
          { "firstName": "R", "name": "容城县" },
          { "firstName": "S", "name": "顺平县" },
          { "firstName": "T", "name": "唐县" },
          { "firstName": "W", "name": "望都县" },
          { "firstName": "X", "name": "新市区" },
          { "firstName": "X", "name": "徐水县" },
          { "firstName": "X", "name": "雄县" },
          { "firstName": "Y", "name": "易县" },
          { "firstName": "Z", "name": "涿州市" }
        ]
      },
      {
        "firstName": "C",
        "name": "承德市",
        "areaList": [
          { "firstName": "C", "name": "承德县" },
          { "firstName": "F", "name": "丰宁满族自治县" },
          { "firstName": "K", "name": "宽城满族自治县" },
          { "firstName": "L", "name": "滦平县" },
          { "firstName": "L", "name": "隆化县" },
          { "firstName": "P", "name": "平泉县" },
          { "firstName": "S", "name": "双桥区" },
          { "firstName": "S", "name": "双滦区" },
          { "firstName": "W", "name": "围场满族蒙古族自治县" },
          { "firstName": "X", "name": "兴隆县" },
          { "firstName": "Y", "name": "鹰手营子矿区" }
        ]
      },
      {
        "firstName": "C",
        "name": "沧州市",
        "areaList": [
          { "firstName": "B", "name": "泊头市" },
          { "firstName": "C", "name": "沧县" },
          { "firstName": "D", "name": "东光县" },
          { "firstName": "H", "name": "海兴县" },
          { "firstName": "H", "name": "黄骅市" },
          { "firstName": "H", "name": "河间市" },
          { "firstName": "M", "name": "孟村回族自治县" },
          { "firstName": "N", "name": "南皮县" },
          { "firstName": "Q", "name": "青县" },
          { "firstName": "R", "name": "任丘市" },
          { "firstName": "S", "name": "肃宁县" },
          { "firstName": "W", "name": "吴桥县" },
          { "firstName": "X", "name": "新华区" },
          { "firstName": "X", "name": "献县" },
          { "firstName": "Y", "name": "运河区" },
          { "firstName": "Y", "name": "盐山县" }
        ]
      },
      {
        "firstName": "H",
        "name": "邯郸市",
        "areaList": [
          { "firstName": "C", "name": "丛台区" },
          { "firstName": "C", "name": "成安县" },
          { "firstName": "C", "name": "磁县" },
          { "firstName": "D", "name": "大名县" },
          { "firstName": "F", "name": "复兴区" },
          { "firstName": "F", "name": "峰峰矿区" },
          { "firstName": "F", "name": "肥乡县" },
          { "firstName": "G", "name": "广平县" },
          { "firstName": "G", "name": "馆陶县" },
          { "firstName": "H", "name": "邯山区" },
          { "firstName": "H", "name": "邯郸县" },
          { "firstName": "J", "name": "鸡泽县" },
          { "firstName": "L", "name": "临漳县" },
          { "firstName": "Q", "name": "邱　县" },
          { "firstName": "Q", "name": "曲周县" },
          { "firstName": "S", "name": "涉县" },
          { "firstName": "W", "name": "魏　县" },
          { "firstName": "W", "name": "武安市" },
          { "firstName": "Y", "name": "永年县" }
        ]
      },
      {
        "firstName": "H",
        "name": "衡水市",
        "areaList": [
          { "firstName": "A", "name": "安平县" },
          { "firstName": "F", "name": "阜城县" },
          { "firstName": "G", "name": "故城县" },
          { "firstName": "J", "name": "景县" },
          { "firstName": "J", "name": "冀州市" },
          { "firstName": "R", "name": "饶阳县" },
          { "firstName": "S", "name": "深州市" },
          { "firstName": "T", "name": "桃城区" },
          { "firstName": "W", "name": "武邑县" },
          { "firstName": "W", "name": "武强县" },
          { "firstName": "Z", "name": "枣强县" }
        ]
      },
      {
        "firstName": "L",
        "name": "廊坊市",
        "areaList": [
          { "firstName": "A", "name": "安次区" },
          { "firstName": "B", "name": "霸州市" },
          { "firstName": "D", "name": "大城县" },
          { "firstName": "D", "name": "大厂回族自治县" },
          { "firstName": "G", "name": "广阳区" },
          { "firstName": "G", "name": "固安县" },
          { "firstName": "S", "name": "三河市" },
          { "firstName": "W", "name": "文安县" },
          { "firstName": "X", "name": "香河县" },
          { "firstName": "Y", "name": "永清县" }
        ]
      },
      {
        "firstName": "Q",
        "name": "秦皇岛市",
        "areaList": [
          { "firstName": "B", "name": "北戴河区" },
          { "firstName": "C", "name": "昌黎县" },
          { "firstName": "F", "name": "抚宁县" },
          { "firstName": "H", "name": "海港区" },
          { "firstName": "L", "name": "卢龙县" },
          { "firstName": "Q", "name": "青龙满族自治县" },
          { "firstName": "S", "name": "山海关区" }
        ]
      },
      {
        "firstName": "S",
        "name": "石家庄市",
        "areaList": [
          { "firstName": "C", "name": "长安区" },
          { "firstName": "G", "name": "高邑县" },
          { "firstName": "G", "name": "藁城市" },
          { "firstName": "J", "name": "井陉矿区" },
          { "firstName": "J", "name": "井陉县" },
          { "firstName": "J", "name": "晋州市" },
          { "firstName": "L", "name": "栾城县" },
          { "firstName": "L", "name": "灵寿县" },
          { "firstName": "L", "name": "鹿泉市" },
          { "firstName": "P", "name": "平山县" },
          { "firstName": "Q", "name": "桥东区" },
          { "firstName": "Q", "name": "桥西区" },
          { "firstName": "S", "name": "深泽县" },
          { "firstName": "W", "name": "无极县" },
          { "firstName": "X", "name": "新华区" },
          { "firstName": "X", "name": "行唐县" },
          { "firstName": "X", "name": "辛集市" },
          { "firstName": "X", "name": "新乐市" },
          { "firstName": "Y", "name": "裕华区" },
          { "firstName": "Y", "name": "元氏县" },
          { "firstName": "Z", "name": "正定县" },
          { "firstName": "Z", "name": "赞皇县" },
          { "firstName": "Z", "name": "赵县" }
        ]
      },
      {
        "firstName": "T",
        "name": "唐山市",
        "areaList": [
          { "firstName": "F", "name": "丰南区" },
          { "firstName": "F", "name": "丰润区" },
          { "firstName": "G", "name": "古冶区" },
          { "firstName": "K", "name": "开平区" },
          { "firstName": "L", "name": "路南区" },
          { "firstName": "L", "name": "路北区" },
          { "firstName": "L", "name": "滦县" },
          { "firstName": "L", "name": "滦南县" },
          { "firstName": "L", "name": "乐亭县" },
          { "firstName": "Q", "name": "迁西县" },
          { "firstName": "Q", "name": "迁安市" },
          { "firstName": "T", "name": "唐海县" },
          { "firstName": "Y", "name": "玉田县" },
          { "firstName": "Z", "name": "遵化市" }
        ]
      },
      {
        "firstName": "X",
        "name": "邢台市",
        "areaList": [
          { "firstName": "B", "name": "柏乡县" },
          { "firstName": "G", "name": "广宗县" },
          { "firstName": "J", "name": "巨鹿县" },
          { "firstName": "L", "name": "临城县" },
          { "firstName": "L", "name": "隆尧县" },
          { "firstName": "L", "name": "临西县" },
          { "firstName": "N", "name": "内丘县" },
          { "firstName": "N", "name": "南和县" },
          { "firstName": "N", "name": "宁晋县" },
          { "firstName": "N", "name": "南宫市" },
          { "firstName": "P", "name": "平乡县" },
          { "firstName": "Q", "name": "桥东区" },
          { "firstName": "Q", "name": "桥西区" },
          { "firstName": "Q", "name": "清河县" },
          { "firstName": "R", "name": "任县" },
          { "firstName": "S", "name": "沙河市" },
          { "firstName": "W", "name": "威县" },
          { "firstName": "X", "name": "邢台县" },
          { "firstName": "X", "name": "新河县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "张家口市",
        "areaList": [
          { "firstName": "C", "name": "赤城县" },
          { "firstName": "C", "name": "崇礼县" },
          { "firstName": "G", "name": "沽源县" },
          { "firstName": "H", "name": "怀安县" },
          { "firstName": "H", "name": "怀来县" },
          { "firstName": "K", "name": "康保县" },
          { "firstName": "Q", "name": "桥东区" },
          { "firstName": "Q", "name": "桥西区" },
          { "firstName": "S", "name": "尚义县" },
          { "firstName": "W", "name": "蔚县" },
          { "firstName": "W", "name": "万全县" },
          { "firstName": "X", "name": "宣化区" },
          { "firstName": "X", "name": "下花园区" },
          { "firstName": "X", "name": "宣化县" },
          { "firstName": "Y", "name": "阳原县" },
          { "firstName": "Z", "name": "张北县" },
          { "firstName": "Z", "name": "涿鹿县" }
        ]
      }
    ]
  },
  {
    "firstName": "H",
    "name": "黑龙江省",
    "cityList": [
      {
        "firstName": "D",
        "name": "大庆市",
        "areaList": [
          { "firstName": "D", "name": "大同区" },
          { "firstName": "D", "name": "杜尔伯特蒙古族自治县" },
          { "firstName": "H", "name": "红岗区" },
          { "firstName": "L", "name": "龙凤区" },
          { "firstName": "L", "name": "林甸县" },
          { "firstName": "R", "name": "让胡路区" },
          { "firstName": "S", "name": "萨尔图区" },
          { "firstName": "Z", "name": "肇州县" },
          { "firstName": "Z", "name": "肇源县" }
        ]
      },
      {
        "firstName": "D",
        "name": "大兴安岭地区",
        "areaList": [
          { "firstName": "H", "name": "呼玛县" },
          { "firstName": "M", "name": "漠河县" },
          { "firstName": "T", "name": "塔河县" }
        ]
      },
      {
        "firstName": "H",
        "name": "哈尔滨市",
        "areaList": [
          { "firstName": "A", "name": "阿城市" },
          { "firstName": "B", "name": "宾县" },
          { "firstName": "B", "name": "巴彦县" },
          { "firstName": "D", "name": "道里区" },
          { "firstName": "D", "name": "道外区" },
          { "firstName": "D", "name": "动力区" },
          { "firstName": "F", "name": "方正县" },
          { "firstName": "H", "name": "呼兰区" },
          { "firstName": "M", "name": "木兰县" },
          { "firstName": "N", "name": "南岗区" },
          { "firstName": "P", "name": "平房区" },
          { "firstName": "S", "name": "松北区" },
          { "firstName": "S", "name": "双城市" },
          { "firstName": "S", "name": "尚志市" },
          { "firstName": "T", "name": "通河县" },
          { "firstName": "W", "name": "五常市" },
          { "firstName": "X", "name": "香坊区" },
          { "firstName": "Y", "name": "依兰县" },
          { "firstName": "Y", "name": "延寿县" }
        ]
      },
      {
        "firstName": "H",
        "name": "鹤岗市",
        "areaList": [
          { "firstName": "D", "name": "东山区" },
          { "firstName": "G", "name": "工农区" },
          { "firstName": "L", "name": "萝北县" },
          { "firstName": "N", "name": "南山区" },
          { "firstName": "S", "name": "绥滨县" },
          { "firstName": "X", "name": "向阳区" },
          { "firstName": "X", "name": "兴安区" },
          { "firstName": "X", "name": "兴山区" }
        ]
      },
      {
        "firstName": "H",
        "name": "黑河市",
        "areaList": [
          { "firstName": "A", "name": "爱辉区" },
          { "firstName": "B", "name": "北安市" },
          { "firstName": "N", "name": "嫩江县" },
          { "firstName": "S", "name": "孙吴县" },
          { "firstName": "W", "name": "五大连池市" },
          { "firstName": "X", "name": "逊克县" }
        ]
      },
      {
        "firstName": "J",
        "name": "鸡西市",
        "areaList": [
          { "firstName": "C", "name": "城子河区" },
          { "firstName": "D", "name": "滴道区" },
          { "firstName": "H", "name": "恒山区" },
          { "firstName": "H", "name": "虎林市" },
          { "firstName": "J", "name": "鸡冠区" },
          { "firstName": "J", "name": "鸡东县" },
          { "firstName": "L", "name": "梨树区" },
          { "firstName": "M", "name": "麻山区" },
          { "firstName": "M", "name": "密山市" }
        ]
      },
      {
        "firstName": "J",
        "name": "佳木斯市",
        "areaList": [
          { "firstName": "D", "name": "东风区" },
          { "firstName": "F", "name": "抚远县" },
          { "firstName": "F", "name": "富锦市" },
          { "firstName": "H", "name": "桦南县" },
          { "firstName": "H", "name": "桦川县" },
          { "firstName": "J", "name": "郊　区" },
          { "firstName": "Q", "name": "前进区" },
          { "firstName": "T", "name": "汤原县" },
          { "firstName": "T", "name": "同江市" },
          { "firstName": "X", "name": "向阳区" },
          { "firstName": "Y", "name": "永红区" }
        ]
      },
      {
        "firstName": "M",
        "name": "牡丹江市",
        "areaList": [
          { "firstName": "A", "name": "爱民区" },
          { "firstName": "D", "name": "东安区" },
          { "firstName": "D", "name": "东宁县" },
          { "firstName": "H", "name": "海林市" },
          { "firstName": "L", "name": "林口县" },
          { "firstName": "M", "name": "穆棱市" },
          { "firstName": "N", "name": "宁安市" },
          { "firstName": "S", "name": "绥芬河市" },
          { "firstName": "X", "name": "西安区" },
          { "firstName": "Y", "name": "阳明区" }
        ]
      },
      {
        "firstName": "Q",
        "name": "齐齐哈尔市",
        "areaList": [
          { "firstName": "A", "name": "昂昂溪区" },
          { "firstName": "B", "name": "拜泉县" },
          { "firstName": "F", "name": "富拉尔基区" },
          { "firstName": "F", "name": "富裕县" },
          { "firstName": "G", "name": "甘南县" },
          { "firstName": "J", "name": "建华区" },
          { "firstName": "K", "name": "克山县" },
          { "firstName": "K", "name": "克东县" },
          { "firstName": "L", "name": "龙沙区" },
          { "firstName": "L", "name": "龙江县" },
          { "firstName": "M", "name": "梅里斯达斡尔族区" },
          { "firstName": "N", "name": "碾子山区" },
          { "firstName": "N", "name": "讷河市" },
          { "firstName": "T", "name": "铁锋区" },
          { "firstName": "T", "name": "泰来县" },
          { "firstName": "Y", "name": "依安县" }
        ]
      },
      {
        "firstName": "Q",
        "name": "七台河市",
        "areaList": [
          { "firstName": "B", "name": "勃利县" },
          { "firstName": "Q", "name": "茄子河区" },
          { "firstName": "T", "name": "桃山区" },
          { "firstName": "X", "name": "新兴区" }
        ]
      },
      {
        "firstName": "S",
        "name": "双鸭山市",
        "areaList": [
          { "firstName": "B", "name": "宝山区" },
          { "firstName": "B", "name": "宝清县" },
          { "firstName": "J", "name": "尖山区" },
          { "firstName": "J", "name": "集贤县" },
          { "firstName": "L", "name": "岭东区" },
          { "firstName": "R", "name": "饶河县" },
          { "firstName": "S", "name": "四方台区" },
          { "firstName": "Y", "name": "友谊县" }
        ]
      },
      {
        "firstName": "S",
        "name": "绥化市",
        "areaList": [
          { "firstName": "A", "name": "安达市" },
          { "firstName": "B", "name": "北林区" },
          { "firstName": "H", "name": "海伦市" },
          { "firstName": "L", "name": "兰西县" },
          { "firstName": "M", "name": "明水县" },
          { "firstName": "Q", "name": "青冈县" },
          { "firstName": "Q", "name": "庆安县" },
          { "firstName": "S", "name": "绥棱县" },
          { "firstName": "W", "name": "望奎县" },
          { "firstName": "Z", "name": "肇东市" }
        ]
      },
      {
        "firstName": "Y",
        "name": "伊春市",
        "areaList": [
          { "firstName": "C", "name": "翠峦区" },
          { "firstName": "D", "name": "带岭区" },
          { "firstName": "H", "name": "红星区" },
          { "firstName": "J", "name": "金山屯区" },
          { "firstName": "J", "name": "嘉荫县" },
          { "firstName": "M", "name": "美溪区" },
          { "firstName": "N", "name": "南岔区" },
          { "firstName": "S", "name": "上甘岭区" },
          { "firstName": "T", "name": "汤旺河区" },
          { "firstName": "T", "name": "铁力市" },
          { "firstName": "W", "name": "五营区" },
          { "firstName": "W", "name": "乌马河区" },
          { "firstName": "W", "name": "乌伊岭区" },
          { "firstName": "X", "name": "西林区" },
          { "firstName": "X", "name": "新青区" },
          { "firstName": "Y", "name": "伊春区" },
          { "firstName": "Y", "name": "友好区" }
        ]
      }
    ]
  },
  {
    "firstName": "H",
    "name": "海南省",
    "cityList": [
      {
        "firstName": "H",
        "name": "海口市",
        "areaList": [
          { "firstName": "L", "name": "龙华区" },
          { "firstName": "M", "name": "美兰区" },
          { "firstName": "Q", "name": "琼山区" },
          { "firstName": "X", "name": "秀英区" }
        ]
      },
      { "firstName": "S", "name": "三亚市", "areaList": [{ "firstName": "S", "name": "市辖区" }] },
      {
        "firstName": "S",
        "name": "省直辖县级行政单位",
        "areaList": [
          { "firstName": "B", "name": "白沙黎族自治县" },
          { "firstName": "B", "name": "保亭黎族苗族自治县" },
          { "firstName": "C", "name": "澄迈县" },
          { "firstName": "C", "name": "昌江黎族自治县" },
          { "firstName": "D", "name": "儋州市" },
          { "firstName": "D", "name": "东方市" },
          { "firstName": "D", "name": "定安县" },
          { "firstName": "L", "name": "临高县" },
          { "firstName": "L", "name": "乐东黎族自治县" },
          { "firstName": "L", "name": "陵水黎族自治县" },
          { "firstName": "N", "name": "南沙群岛" },
          { "firstName": "Q", "name": "琼海市" },
          { "firstName": "Q", "name": "琼中黎族苗族自治县" },
          { "firstName": "T", "name": "屯昌县" },
          { "firstName": "W", "name": "五指山市" },
          { "firstName": "W", "name": "文昌市" },
          { "firstName": "W", "name": "万宁市" },
          { "firstName": "X", "name": "西沙群岛" },
          { "firstName": "Z", "name": "中沙群岛的岛礁及其海域" }
        ]
      }
    ]
  },
  {
    "firstName": "J",
    "name": "江苏省",
    "cityList": [
      {
        "firstName": "C",
        "name": "常州市",
        "areaList": [
          { "firstName": "J", "name": "金坛市" },
          { "firstName": "L", "name": "溧阳市" },
          { "firstName": "Q", "name": "戚墅堰区" },
          { "firstName": "T", "name": "天宁区" },
          { "firstName": "W", "name": "武进区" },
          { "firstName": "X", "name": "新北区" },
          { "firstName": "Z", "name": "钟楼区" }
        ]
      },
      {
        "firstName": "H",
        "name": "淮安市",
        "areaList": [
          { "firstName": "C", "name": "楚州区" },
          { "firstName": "H", "name": "淮阴区" },
          { "firstName": "H", "name": "洪泽县" },
          { "firstName": "J", "name": "金湖县" },
          { "firstName": "L", "name": "涟水县" },
          { "firstName": "Q", "name": "清河区" },
          { "firstName": "Q", "name": "清浦区" },
          { "firstName": "X", "name": "盱眙县" }
        ]
      },
      {
        "firstName": "L",
        "name": "连云港市",
        "areaList": [
          { "firstName": "D", "name": "东海县" },
          { "firstName": "G", "name": "赣榆县" },
          { "firstName": "G", "name": "灌云县" },
          { "firstName": "G", "name": "灌南县" },
          { "firstName": "H", "name": "海州区" },
          { "firstName": "L", "name": "连云区" },
          { "firstName": "X", "name": "新浦区" }
        ]
      },
      {
        "firstName": "N",
        "name": "南京市",
        "areaList": [
          { "firstName": "B", "name": "白下区" },
          { "firstName": "G", "name": "鼓楼区" },
          { "firstName": "G", "name": "高淳县" },
          { "firstName": "J", "name": "建邺区" },
          { "firstName": "J", "name": "江宁区" },
          { "firstName": "L", "name": "六合区" },
          { "firstName": "L", "name": "溧水县" },
          { "firstName": "P", "name": "浦口区" },
          { "firstName": "Q", "name": "秦淮区" },
          { "firstName": "Q", "name": "栖霞区" },
          { "firstName": "X", "name": "玄武区" },
          { "firstName": "X", "name": "下关区" },
          { "firstName": "Y", "name": "雨花台区" }
        ]
      },
      {
        "firstName": "N",
        "name": "南通市",
        "areaList": [
          { "firstName": "C", "name": "崇川区" },
          { "firstName": "G", "name": "港闸区" },
          { "firstName": "H", "name": "海安县" },
          { "firstName": "H", "name": "海门市" },
          { "firstName": "Q", "name": "启东市" },
          { "firstName": "R", "name": "如东县" },
          { "firstName": "R", "name": "如皋市" },
          { "firstName": "T", "name": "通州市" }
        ]
      },
      {
        "firstName": "S",
        "name": "苏州市",
        "areaList": [
          { "firstName": "C", "name": "沧浪区" },
          { "firstName": "C", "name": "常熟市" },
          { "firstName": "H", "name": "虎丘区" },
          { "firstName": "J", "name": "金阊区" },
          { "firstName": "K", "name": "昆山市" },
          { "firstName": "P", "name": "平江区" },
          { "firstName": "T", "name": "太仓市" },
          { "firstName": "W", "name": "吴中区" },
          { "firstName": "W", "name": "吴江市" },
          { "firstName": "X", "name": "相城区" },
          { "firstName": "Z", "name": "张家港市" }
        ]
      },
      {
        "firstName": "S",
        "name": "宿迁市",
        "areaList": [
          { "firstName": "S", "name": "宿城区" },
          { "firstName": "S", "name": "宿豫区" },
          { "firstName": "S", "name": "沭阳县" },
          { "firstName": "S", "name": "泗阳县" },
          { "firstName": "S", "name": "泗洪县" }
        ]
      },
      {
        "firstName": "T",
        "name": "泰州市",
        "areaList": [
          { "firstName": "G", "name": "高港区" },
          { "firstName": "H", "name": "海陵区" },
          { "firstName": "J", "name": "靖江市" },
          { "firstName": "J", "name": "姜堰市" },
          { "firstName": "T", "name": "泰兴市" },
          { "firstName": "X", "name": "兴化市" }
        ]
      },
      {
        "firstName": "W",
        "name": "无锡市",
        "areaList": [
          { "firstName": "B", "name": "北塘区" },
          { "firstName": "B", "name": "滨湖区" },
          { "firstName": "C", "name": "崇安区" },
          { "firstName": "H", "name": "惠山区" },
          { "firstName": "J", "name": "江阴市" },
          { "firstName": "N", "name": "南长区" },
          { "firstName": "X", "name": "锡山区" },
          { "firstName": "Y", "name": "宜兴市" }
        ]
      },
      {
        "firstName": "X",
        "name": "徐州市",
        "areaList": [
          { "firstName": "F", "name": "丰县" },
          { "firstName": "G", "name": "鼓楼区" },
          { "firstName": "J", "name": "九里区" },
          { "firstName": "J", "name": "贾汪区" },
          { "firstName": "P", "name": "沛县" },
          { "firstName": "P", "name": "邳州市" },
          { "firstName": "Q", "name": "泉山区" },
          { "firstName": "S", "name": "睢宁县" },
          { "firstName": "T", "name": "铜山县" },
          { "firstName": "X", "name": "新沂市" },
          { "firstName": "Y", "name": "云龙区" }
        ]
      },
      {
        "firstName": "Y",
        "name": "盐城市",
        "areaList": [
          { "firstName": "B", "name": "滨海县" },
          { "firstName": "D", "name": "东台市" },
          { "firstName": "D", "name": "大丰市" },
          { "firstName": "F", "name": "阜宁县" },
          { "firstName": "J", "name": "建湖县" },
          { "firstName": "S", "name": "射阳县" },
          { "firstName": "T", "name": "亭湖区" },
          { "firstName": "X", "name": "响水县" },
          { "firstName": "Y", "name": "盐都区" }
        ]
      },
      {
        "firstName": "Y",
        "name": "扬州市",
        "areaList": [
          { "firstName": "B", "name": "宝应县" },
          { "firstName": "G", "name": "广陵区" },
          { "firstName": "G", "name": "高邮市" },
          { "firstName": "H", "name": "邗江区" },
          { "firstName": "J", "name": "郊区" },
          { "firstName": "J", "name": "江都市" },
          { "firstName": "Y", "name": "仪征市" }
        ]
      },
      {
        "firstName": "Z",
        "name": "镇江市",
        "areaList": [
          { "firstName": "D", "name": "丹徒区" },
          { "firstName": "D", "name": "丹阳市" },
          { "firstName": "J", "name": "京口区" },
          { "firstName": "J", "name": "句容市" },
          { "firstName": "R", "name": "润州区" },
          { "firstName": "Y", "name": "扬中市" }
        ]
      }
    ]
  },
  {
    "firstName": "J",
    "name": "江西省",
    "cityList": [
      {
        "firstName": "F",
        "name": "抚州市",
        "areaList": [
          { "firstName": "C", "name": "崇仁县" },
          { "firstName": "D", "name": "东乡县" },
          { "firstName": "G", "name": "广昌县" },
          { "firstName": "J", "name": "金溪县" },
          { "firstName": "L", "name": "临川区" },
          { "firstName": "L", "name": "黎川县" },
          { "firstName": "L", "name": "乐安县" },
          { "firstName": "N", "name": "南城县" },
          { "firstName": "N", "name": "南丰县" },
          { "firstName": "Y", "name": "宜黄县" },
          { "firstName": "Z", "name": "资溪县" }
        ]
      },
      {
        "firstName": "G",
        "name": "赣州市",
        "areaList": [
          { "firstName": "A", "name": "安远县" },
          { "firstName": "C", "name": "崇义县" },
          { "firstName": "D", "name": "大余县" },
          { "firstName": "D", "name": "定南县" },
          { "firstName": "G", "name": "赣　县" },
          { "firstName": "H", "name": "会昌县" },
          { "firstName": "L", "name": "龙南县" },
          { "firstName": "N", "name": "宁都县" },
          { "firstName": "N", "name": "南康市" },
          { "firstName": "Q", "name": "全南县" },
          { "firstName": "R", "name": "瑞金市" },
          { "firstName": "S", "name": "上犹县" },
          { "firstName": "S", "name": "石城县" },
          { "firstName": "X", "name": "信丰县" },
          { "firstName": "X", "name": "兴国县" },
          { "firstName": "X", "name": "寻乌县" },
          { "firstName": "Y", "name": "于都县" },
          { "firstName": "Z", "name": "章贡区" }
        ]
      },
      {
        "firstName": "J",
        "name": "景德镇市",
        "areaList": [
          { "firstName": "C", "name": "昌江区" },
          { "firstName": "F", "name": "浮梁县" },
          { "firstName": "L", "name": "乐平市" },
          { "firstName": "Z", "name": "珠山区" }
        ]
      },
      {
        "firstName": "J",
        "name": "九江市",
        "areaList": [
          { "firstName": "D", "name": "德安县" },
          { "firstName": "D", "name": "都昌县" },
          { "firstName": "H", "name": "湖口县" },
          { "firstName": "J", "name": "九江县" },
          { "firstName": "L", "name": "庐山区" },
          { "firstName": "P", "name": "彭泽县" },
          { "firstName": "R", "name": "瑞昌市" },
          { "firstName": "W", "name": "武宁县" },
          { "firstName": "X", "name": "浔阳区" },
          { "firstName": "X", "name": "修水县" },
          { "firstName": "X", "name": "星子县" },
          { "firstName": "Y", "name": "永修县" }
        ]
      },
      {
        "firstName": "J",
        "name": "吉安市",
        "areaList": [
          { "firstName": "A", "name": "安福县" },
          { "firstName": "J", "name": "吉州区" },
          { "firstName": "J", "name": "吉安县" },
          { "firstName": "J", "name": "吉水县" },
          { "firstName": "J", "name": "井冈山市" },
          { "firstName": "Q", "name": "青原区" },
          { "firstName": "S", "name": "遂川县" },
          { "firstName": "T", "name": "泰和县" },
          { "firstName": "W", "name": "万安县" },
          { "firstName": "X", "name": "峡江县" },
          { "firstName": "X", "name": "新干县" },
          { "firstName": "Y", "name": "永丰县" },
          { "firstName": "Y", "name": "永新县" }
        ]
      },
      {
        "firstName": "N",
        "name": "南昌市",
        "areaList": [
          { "firstName": "A", "name": "安义县" },
          { "firstName": "D", "name": "东湖区" },
          { "firstName": "J", "name": "进贤县" },
          { "firstName": "N", "name": "南昌县" },
          { "firstName": "Q", "name": "青云谱区" },
          { "firstName": "Q", "name": "青山湖区" },
          { "firstName": "W", "name": "湾里区" },
          { "firstName": "X", "name": "西湖区" },
          { "firstName": "X", "name": "新建县" }
        ]
      },
      {
        "firstName": "P",
        "name": "萍乡市",
        "areaList": [
          { "firstName": "A", "name": "安源区" },
          { "firstName": "L", "name": "莲花县" },
          { "firstName": "L", "name": "芦溪县" },
          { "firstName": "S", "name": "上栗县" },
          { "firstName": "X", "name": "湘东区" }
        ]
      },
      {
        "firstName": "S",
        "name": "上饶市",
        "areaList": [
          { "firstName": "D", "name": "德兴市" },
          { "firstName": "G", "name": "广丰县" },
          { "firstName": "H", "name": "横峰县" },
          { "firstName": "M", "name": "婺源县" },
          { "firstName": "P", "name": "鄱阳县" },
          { "firstName": "Q", "name": "铅山县" },
          { "firstName": "S", "name": "上饶县" },
          { "firstName": "W", "name": "万年县" },
          { "firstName": "X", "name": "信州区" },
          { "firstName": "Y", "name": "玉山县" },
          { "firstName": "Y", "name": "弋阳县" },
          { "firstName": "Y", "name": "余干县" }
        ]
      },
      {
        "firstName": "X",
        "name": "新余市",
        "areaList": [{ "firstName": "F", "name": "分宜县" }, { "firstName": "Y", "name": "渝水区" }]
      },
      {
        "firstName": "Y",
        "name": "鹰潭市",
        "areaList": [
          { "firstName": "G", "name": "贵溪市" },
          { "firstName": "Y", "name": "月湖区" },
          { "firstName": "Y", "name": "余江县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "宜春市",
        "areaList": [
          { "firstName": "F", "name": "奉新县" },
          { "firstName": "F", "name": "丰城市" },
          { "firstName": "G", "name": "高安市" },
          { "firstName": "J", "name": "靖安县" },
          { "firstName": "S", "name": "上高县" },
          { "firstName": "T", "name": "铜鼓县" },
          { "firstName": "W", "name": "万载县" },
          { "firstName": "Y", "name": "袁州区" },
          { "firstName": "Y", "name": "宜丰县" },
          { "firstName": "Z", "name": "樟树市" }
        ]
      }
    ]
  },
  {
    "firstName": "J",
    "name": "吉林省",
    "cityList": [
      {
        "firstName": "B",
        "name": "白山市",
        "areaList": [
          { "firstName": "B", "name": "八道江区" },
          { "firstName": "C", "name": "长白朝鲜族自治县" },
          { "firstName": "F", "name": "抚松县" },
          { "firstName": "J", "name": "靖宇县" },
          { "firstName": "J", "name": "江源县" },
          { "firstName": "L", "name": "临江市" }
        ]
      },
      {
        "firstName": "B",
        "name": "白城市",
        "areaList": [
          { "firstName": "D", "name": "洮北区" },
          { "firstName": "D", "name": "洮南市" },
          { "firstName": "D", "name": "大安市" },
          { "firstName": "T", "name": "通榆县" },
          { "firstName": "Z", "name": "镇赉县" }
        ]
      },
      {
        "firstName": "C",
        "name": "长春市",
        "areaList": [
          { "firstName": "C", "name": "朝阳区" },
          { "firstName": "D", "name": "德惠市" },
          { "firstName": "E", "name": "二道区" },
          { "firstName": "J", "name": "九台市" },
          { "firstName": "K", "name": "宽城区" },
          { "firstName": "L", "name": "绿园区" },
          { "firstName": "N", "name": "南关区" },
          { "firstName": "N", "name": "农安县" },
          { "firstName": "S", "name": "双阳区" },
          { "firstName": "Y", "name": "榆树市" }
        ]
      },
      {
        "firstName": "J",
        "name": "吉林市",
        "areaList": [
          { "firstName": "C", "name": "昌邑区" },
          { "firstName": "C", "name": "船营区" },
          { "firstName": "F", "name": "丰满区" },
          { "firstName": "H", "name": "桦甸市" },
          { "firstName": "J", "name": "蛟河市" },
          { "firstName": "L", "name": "龙潭区" },
          { "firstName": "P", "name": "磐石市" },
          { "firstName": "S", "name": "舒兰市" },
          { "firstName": "Y", "name": "永吉县" }
        ]
      },
      {
        "firstName": "L",
        "name": "辽源市",
        "areaList": [
          { "firstName": "D", "name": "东丰县" },
          { "firstName": "D", "name": "东辽县" },
          { "firstName": "L", "name": "龙山区" },
          { "firstName": "X", "name": "西安区" }
        ]
      },
      {
        "firstName": "S",
        "name": "四平市",
        "areaList": [
          { "firstName": "G", "name": "公主岭市" },
          { "firstName": "L", "name": "梨树县" },
          { "firstName": "S", "name": "双辽市" },
          { "firstName": "T", "name": "铁西区" },
          { "firstName": "T", "name": "铁东区" },
          { "firstName": "Y", "name": "伊通满族自治县" }
        ]
      },
      {
        "firstName": "S",
        "name": "松原市",
        "areaList": [
          { "firstName": "C", "name": "长岭县" },
          { "firstName": "F", "name": "扶余县" },
          { "firstName": "N", "name": "宁江区" },
          { "firstName": "Q", "name": "前郭尔罗斯蒙古族自治县" },
          { "firstName": "Q", "name": "乾安县" }
        ]
      },
      {
        "firstName": "T",
        "name": "通化市",
        "areaList": [
          { "firstName": "D", "name": "东昌区" },
          { "firstName": "E", "name": "二道江区" },
          { "firstName": "H", "name": "辉南县" },
          { "firstName": "J", "name": "集安市" },
          { "firstName": "L", "name": "柳河县" },
          { "firstName": "M", "name": "梅河口市" },
          { "firstName": "T", "name": "通化县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "延边朝鲜族自治州",
        "areaList": [
          { "firstName": "A", "name": "安图县" },
          { "firstName": "D", "name": "敦化市" },
          { "firstName": "H", "name": "珲春市" },
          { "firstName": "H", "name": "和龙市" },
          { "firstName": "L", "name": "龙井市" },
          { "firstName": "T", "name": "图们市" },
          { "firstName": "W", "name": "汪清县" },
          { "firstName": "Y", "name": "延吉市" }
        ]
      }
    ]
  },
  {
    "firstName": "L",
    "name": "辽宁省",
    "cityList": [
      {
        "firstName": "A",
        "name": "鞍山市",
        "areaList": [
          { "firstName": "H", "name": "海城市" },
          { "firstName": "L", "name": "立山区" },
          { "firstName": "Q", "name": "千山区" },
          { "firstName": "T", "name": "铁东区" },
          { "firstName": "T", "name": "铁西区" },
          { "firstName": "T", "name": "台安县" },
          { "firstName": "X", "name": "岫岩满族自治县" }
        ]
      },
      {
        "firstName": "B",
        "name": "本溪市",
        "areaList": [
          { "firstName": "B", "name": "本溪满族自治县" },
          { "firstName": "H", "name": "桓仁满族自治县" },
          { "firstName": "M", "name": "明山区" },
          { "firstName": "N", "name": "南芬区" },
          { "firstName": "P", "name": "平山区" },
          { "firstName": "X", "name": "溪湖区" }
        ]
      },
      {
        "firstName": "C",
        "name": "朝阳市",
        "areaList": [
          { "firstName": "B", "name": "北票市" },
          { "firstName": "C", "name": "朝阳县" },
          { "firstName": "J", "name": "建平县" },
          { "firstName": "K", "name": "喀喇沁左翼蒙古族自治县" },
          { "firstName": "L", "name": "龙城区" },
          { "firstName": "L", "name": "凌源市" },
          { "firstName": "S", "name": "双塔区" }
        ]
      },
      {
        "firstName": "D",
        "name": "大连市",
        "areaList": [
          { "firstName": "C", "name": "长海县" },
          { "firstName": "G", "name": "甘井子区" },
          { "firstName": "J", "name": "金州区" },
          { "firstName": "L", "name": "旅顺口区" },
          { "firstName": "P", "name": "普兰店市" },
          { "firstName": "S", "name": "沙河口区" },
          { "firstName": "W", "name": "瓦房店市" },
          { "firstName": "X", "name": "西岗区" },
          { "firstName": "Z", "name": "中山区" },
          { "firstName": "Z", "name": "庄河市" }
        ]
      },
      {
        "firstName": "D",
        "name": "丹东市",
        "areaList": [
          { "firstName": "D", "name": "东港市" },
          { "firstName": "F", "name": "凤城市" },
          { "firstName": "K", "name": "宽甸满族自治县" },
          { "firstName": "Y", "name": "元宝区" },
          { "firstName": "Z", "name": "振兴区" },
          { "firstName": "Z", "name": "振安区" }
        ]
      },
      {
        "firstName": "F",
        "name": "抚顺市",
        "areaList": [
          { "firstName": "D", "name": "东洲区" },
          { "firstName": "F", "name": "抚顺县" },
          { "firstName": "Q", "name": "清原满族自治县" },
          { "firstName": "S", "name": "顺城区" },
          { "firstName": "W", "name": "望花区" },
          { "firstName": "X", "name": "新抚区" },
          { "firstName": "X", "name": "新宾满族自治县" }
        ]
      },
      {
        "firstName": "F",
        "name": "阜新市",
        "areaList": [
          { "firstName": "F", "name": "阜新蒙古族自治县" },
          { "firstName": "H", "name": "海州区" },
          { "firstName": "Q", "name": "清河门区" },
          { "firstName": "T", "name": "太平区" },
          { "firstName": "X", "name": "新邱区" },
          { "firstName": "X", "name": "细河区" },
          { "firstName": "Z", "name": "彰武县" }
        ]
      },
      {
        "firstName": "H",
        "name": "葫芦岛市",
        "areaList": [
          { "firstName": "J", "name": "建昌县" },
          { "firstName": "L", "name": "连山区" },
          { "firstName": "L", "name": "龙港区" },
          { "firstName": "N", "name": "南票区" },
          { "firstName": "S", "name": "绥中县" },
          { "firstName": "X", "name": "兴城市" }
        ]
      },
      {
        "firstName": "J",
        "name": "锦州市",
        "areaList": [
          { "firstName": "B", "name": "北宁市" },
          { "firstName": "G", "name": "古塔区" },
          { "firstName": "H", "name": "黑山县" },
          { "firstName": "L", "name": "凌河区" },
          { "firstName": "L", "name": "凌海市" },
          { "firstName": "T", "name": "太和区" },
          { "firstName": "Y", "name": "义县" }
        ]
      },
      {
        "firstName": "L",
        "name": "辽阳市",
        "areaList": [
          { "firstName": "B", "name": "白塔区" },
          { "firstName": "D", "name": "灯塔市" },
          { "firstName": "G", "name": "弓长岭区" },
          { "firstName": "H", "name": "宏伟区" },
          { "firstName": "L", "name": "辽阳县" },
          { "firstName": "T", "name": "太子河区" },
          { "firstName": "W", "name": "文圣区" }
        ]
      },
      {
        "firstName": "P",
        "name": "盘锦市",
        "areaList": [
          { "firstName": "D", "name": "大洼县" },
          { "firstName": "P", "name": "盘山县" },
          { "firstName": "S", "name": "双台子区" },
          { "firstName": "X", "name": "兴隆台区" }
        ]
      },
      {
        "firstName": "S",
        "name": "沈阳市",
        "areaList": [
          { "firstName": "D", "name": "大东区" },
          { "firstName": "D", "name": "东陵区" },
          { "firstName": "F", "name": "法库县" },
          { "firstName": "H", "name": "和平区" },
          { "firstName": "H", "name": "皇姑区" },
          { "firstName": "K", "name": "康平县" },
          { "firstName": "L", "name": "辽中县" },
          { "firstName": "S", "name": "沈河区" },
          { "firstName": "S", "name": "苏家屯区" },
          { "firstName": "T", "name": "铁西区" },
          { "firstName": "X", "name": "新城子区" },
          { "firstName": "X", "name": "新民市" },
          { "firstName": "Y", "name": "于洪区" }
        ]
      },
      {
        "firstName": "T",
        "name": "铁岭市",
        "areaList": [
          { "firstName": "C", "name": "昌图县" },
          { "firstName": "D", "name": "调兵山市" },
          { "firstName": "K", "name": "开原市" },
          { "firstName": "Q", "name": "清河区" },
          { "firstName": "T", "name": "铁岭县" },
          { "firstName": "X", "name": "西丰县" },
          { "firstName": "Y", "name": "银州区" }
        ]
      },
      {
        "firstName": "Y",
        "name": "营口市",
        "areaList": [
          { "firstName": "B", "name": "鲅鱼圈区" },
          { "firstName": "D", "name": "大石桥市" },
          { "firstName": "G", "name": "盖州市" },
          { "firstName": "L", "name": "老边区" },
          { "firstName": "X", "name": "西市区" },
          { "firstName": "Z", "name": "站前区" }
        ]
      }
    ]
  },
  {
    "firstName": "N",
    "name": "宁夏回族自治区",
    "cityList": [
      {
        "firstName": "G",
        "name": "固原市",
        "areaList": [
          { "firstName": "H", "name": "海原县" },
          { "firstName": "J", "name": "泾源县" },
          { "firstName": "L", "name": "隆德县" },
          { "firstName": "P", "name": "彭阳县" },
          { "firstName": "X", "name": "西吉县" },
          { "firstName": "Y", "name": "原州区" }
        ]
      },
      {
        "firstName": "S",
        "name": "石嘴山市",
        "areaList": [
          { "firstName": "D", "name": "大武口区" },
          { "firstName": "H", "name": "惠农区" },
          { "firstName": "P", "name": "平罗县" }
        ]
      },
      {
        "firstName": "W",
        "name": "吴忠市",
        "areaList": [
          { "firstName": "L", "name": "利通区" },
          { "firstName": "Q", "name": "青铜峡市" },
          { "firstName": "T", "name": "同心县" },
          { "firstName": "Y", "name": "盐池县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "银川市",
        "areaList": [
          { "firstName": "H", "name": "贺兰县" },
          { "firstName": "J", "name": "金凤区" },
          { "firstName": "L", "name": "灵武市" },
          { "firstName": "X", "name": "兴庆区" },
          { "firstName": "X", "name": "西夏区" },
          { "firstName": "Y", "name": "永宁县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "中卫市",
        "areaList": [{ "firstName": "S", "name": "沙坡头区" }, { "firstName": "Z", "name": "中宁县" }]
      }
    ]
  },
  {
    "firstName": "N",
    "name": "内蒙古自治区",
    "cityList": [
      {
        "firstName": "A",
        "name": "阿拉善盟",
        "areaList": [
          { "firstName": "A", "name": "阿拉善左旗" },
          { "firstName": "A", "name": "阿拉善右旗" },
          { "firstName": "E", "name": "额济纳旗" }
        ]
      },
      {
        "firstName": "B",
        "name": "包头市",
        "areaList": [
          { "firstName": "B", "name": "白云矿区" },
          { "firstName": "D", "name": "东河区" },
          { "firstName": "D", "name": "达尔罕茂明安联合旗" },
          { "firstName": "G", "name": "固阳县" },
          { "firstName": "J", "name": "九原区" },
          { "firstName": "K", "name": "昆都仑区" },
          { "firstName": "Q", "name": "青山区" },
          { "firstName": "S", "name": "石拐区" },
          { "firstName": "T", "name": "土默特右旗" }
        ]
      },
      {
        "firstName": "B",
        "name": "巴彦淖尔市",
        "areaList": [
          { "firstName": "D", "name": "磴口县" },
          { "firstName": "H", "name": "杭锦后旗" },
          { "firstName": "L", "name": "临河区" },
          { "firstName": "W", "name": "五原县" },
          { "firstName": "W", "name": "乌拉特前旗" },
          { "firstName": "W", "name": "乌拉特中旗" },
          { "firstName": "W", "name": "乌拉特后旗" }
        ]
      },
      {
        "firstName": "C",
        "name": "赤峰市",
        "areaList": [
          { "firstName": "A", "name": "阿鲁科尔沁旗" },
          { "firstName": "A", "name": "敖汉旗" },
          { "firstName": "B", "name": "巴林左旗" },
          { "firstName": "B", "name": "巴林右旗" },
          { "firstName": "H", "name": "红山区" },
          { "firstName": "K", "name": "克什克腾旗" },
          { "firstName": "K", "name": "喀喇沁旗" },
          { "firstName": "L", "name": "林西县" },
          { "firstName": "N", "name": "宁城县" },
          { "firstName": "S", "name": "松山区" },
          { "firstName": "W", "name": "翁牛特旗" },
          { "firstName": "Y", "name": "元宝山区" }
        ]
      },
      {
        "firstName": "E",
        "name": "鄂尔多斯市",
        "areaList": [
          { "firstName": "D", "name": "东胜区" },
          { "firstName": "D", "name": "达拉特旗" },
          { "firstName": "E", "name": "鄂托克前旗" },
          { "firstName": "E", "name": "鄂托克旗" },
          { "firstName": "H", "name": "杭锦旗" },
          { "firstName": "W", "name": "乌审旗" },
          { "firstName": "Y", "name": "伊金霍洛旗" },
          { "firstName": "Z", "name": "准格尔旗" }
        ]
      },
      {
        "firstName": "H",
        "name": "呼和浩特市",
        "areaList": [
          { "firstName": "H", "name": "回民区" },
          { "firstName": "H", "name": "和林格尔县" },
          { "firstName": "Q", "name": "清水河县" },
          { "firstName": "S", "name": "赛罕区" },
          { "firstName": "T", "name": "土默特左旗" },
          { "firstName": "T", "name": "托克托县" },
          { "firstName": "W", "name": "武川县" },
          { "firstName": "X", "name": "新城区" },
          { "firstName": "Y", "name": "玉泉区" }
        ]
      },
      {
        "firstName": "H",
        "name": "呼伦贝尔市",
        "areaList": [
          { "firstName": "A", "name": "阿荣旗" },
          { "firstName": "C", "name": "陈巴尔虎旗" },
          { "firstName": "E", "name": "鄂伦春自治旗" },
          { "firstName": "E", "name": "鄂温克族自治旗" },
          { "firstName": "E", "name": "额尔古纳市" },
          { "firstName": "G", "name": "根河市" },
          { "firstName": "H", "name": "海拉尔区" },
          { "firstName": "M", "name": "莫力达瓦达斡尔族自治旗" },
          { "firstName": "M", "name": "满洲里市" },
          { "firstName": "X", "name": "新巴尔虎左旗" },
          { "firstName": "X", "name": "新巴尔虎右旗" },
          { "firstName": "Y", "name": "牙克石市" },
          { "firstName": "Z", "name": "扎兰屯市" }
        ]
      },
      {
        "firstName": "T",
        "name": "通辽市",
        "areaList": [
          { "firstName": "H", "name": "霍林郭勒市" },
          { "firstName": "K", "name": "科尔沁区" },
          { "firstName": "K", "name": "科尔沁左翼中旗" },
          { "firstName": "K", "name": "科尔沁左翼后旗" },
          { "firstName": "K", "name": "开鲁县" },
          { "firstName": "K", "name": "库伦旗" },
          { "firstName": "N", "name": "奈曼旗" },
          { "firstName": "Z", "name": "扎鲁特旗" }
        ]
      },
      {
        "firstName": "W",
        "name": "乌海市",
        "areaList": [
          { "firstName": "H", "name": "海勃湾区" },
          { "firstName": "H", "name": "海南区" },
          { "firstName": "W", "name": "乌达区" }
        ]
      },
      {
        "firstName": "W",
        "name": "乌兰察布市",
        "areaList": [
          { "firstName": "C", "name": "察哈尔右翼前旗" },
          { "firstName": "C", "name": "察哈尔右翼中旗" },
          { "firstName": "C", "name": "察哈尔右翼后旗" },
          { "firstName": "F", "name": "丰镇市" },
          { "firstName": "H", "name": "化德县" },
          { "firstName": "J", "name": "集宁区" },
          { "firstName": "L", "name": "凉城县" },
          { "firstName": "S", "name": "商都县" },
          { "firstName": "S", "name": "四子王旗" },
          { "firstName": "X", "name": "兴和县" },
          { "firstName": "Z", "name": "卓资县" }
        ]
      },
      {
        "firstName": "X",
        "name": "兴安盟",
        "areaList": [
          { "firstName": "A", "name": "阿尔山市" },
          { "firstName": "K", "name": "科尔沁右翼前旗" },
          { "firstName": "K", "name": "科尔沁右翼中旗" },
          { "firstName": "T", "name": "突泉县" },
          { "firstName": "W", "name": "乌兰浩特市" },
          { "firstName": "Z", "name": "扎赉特旗" }
        ]
      },
      {
        "firstName": "X",
        "name": "锡林郭勒盟",
        "areaList": [
          { "firstName": "A", "name": "阿巴嘎旗" },
          { "firstName": "D", "name": "东乌珠穆沁旗" },
          { "firstName": "D", "name": "多伦县" },
          { "firstName": "E", "name": "二连浩特市" },
          { "firstName": "S", "name": "苏尼特左旗" },
          { "firstName": "S", "name": "苏尼特右旗" },
          { "firstName": "T", "name": "太仆寺旗" },
          { "firstName": "X", "name": "锡林浩特市" },
          { "firstName": "X", "name": "西乌珠穆沁旗" },
          { "firstName": "X", "name": "镶黄旗" },
          { "firstName": "Z", "name": "正镶白旗" },
          { "firstName": "Z", "name": "正蓝旗" }
        ]
      }
    ]
  },
  {
    "firstName": "Q",
    "name": "青海省",
    "cityList": [
      {
        "firstName": "G",
        "name": "果洛藏族自治州",
        "areaList": [
          { "firstName": "B", "name": "班玛县" },
          { "firstName": "D", "name": "达日县" },
          { "firstName": "G", "name": "甘德县" },
          { "firstName": "J", "name": "久治县" },
          { "firstName": "M", "name": "玛沁县" },
          { "firstName": "M", "name": "玛多县" }
        ]
      },
      {
        "firstName": "H",
        "name": "海东地区",
        "areaList": [
          { "firstName": "H", "name": "互助土族自治县" },
          { "firstName": "H", "name": "化隆回族自治县" },
          { "firstName": "L", "name": "乐都县" },
          { "firstName": "M", "name": "民和回族土族自治县" },
          { "firstName": "P", "name": "平安县" },
          { "firstName": "X", "name": "循化撒拉族自治县" }
        ]
      },
      {
        "firstName": "H",
        "name": "海北藏族自治州",
        "areaList": [
          { "firstName": "G", "name": "刚察县" },
          { "firstName": "H", "name": "海晏县" },
          { "firstName": "M", "name": "门源回族自治县" },
          { "firstName": "Q", "name": "祁连县" }
        ]
      },
      {
        "firstName": "H",
        "name": "黄南藏族自治州",
        "areaList": [
          { "firstName": "H", "name": "河南蒙古族自治县" },
          { "firstName": "J", "name": "尖扎县" },
          { "firstName": "T", "name": "同仁县" },
          { "firstName": "Z", "name": "泽库县" }
        ]
      },
      {
        "firstName": "H",
        "name": "海南藏族自治州",
        "areaList": [
          { "firstName": "G", "name": "共和县" },
          { "firstName": "G", "name": "贵德县" },
          { "firstName": "G", "name": "贵南县" },
          { "firstName": "T", "name": "同德县" },
          { "firstName": "X", "name": "兴海县" }
        ]
      },
      {
        "firstName": "H",
        "name": "海西蒙古族藏族自治州",
        "areaList": [
          { "firstName": "D", "name": "德令哈市" },
          { "firstName": "D", "name": "都兰县" },
          { "firstName": "G", "name": "格尔木市" },
          { "firstName": "T", "name": "天峻县" },
          { "firstName": "W", "name": "乌兰县" }
        ]
      },
      {
        "firstName": "X",
        "name": "西宁市",
        "areaList": [
          { "firstName": "C", "name": "城东区" },
          { "firstName": "C", "name": "城中区" },
          { "firstName": "C", "name": "城西区" },
          { "firstName": "C", "name": "城北区" },
          { "firstName": "D", "name": "大通回族土族自治县" },
          { "firstName": "H", "name": "湟中县" },
          { "firstName": "H", "name": "湟源县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "玉树藏族自治州",
        "areaList": [
          { "firstName": "C", "name": "称多县" },
          { "firstName": "N", "name": "囊谦县" },
          { "firstName": "Q", "name": "曲麻莱县" },
          { "firstName": "Y", "name": "玉树县" },
          { "firstName": "Z", "name": "杂多县" },
          { "firstName": "Z", "name": "治多县" }
        ]
      }
    ]
  },
  {
    "firstName": "S",
    "name": "上海",
    "areaList": [
      { "firstName": "B", "name": "宝山区" },
      { "firstName": "C", "name": "长宁区" },
      { "firstName": "C", "name": "崇明县" },
      { "firstName": "F", "name": "奉贤区" },
      { "firstName": "H", "name": "黄浦区" },
      { "firstName": "H", "name": "虹口区" },
      { "firstName": "J", "name": "静安区" },
      { "firstName": "J", "name": "嘉定区" },
      { "firstName": "J", "name": "金山区" },
      { "firstName": "L", "name": "卢湾区" },
      { "firstName": "M", "name": "闵行区" },
      { "firstName": "N", "name": "南汇区" },
      { "firstName": "P", "name": "普陀区" },
      { "firstName": "P", "name": "浦东新区" },
      { "firstName": "Q", "name": "青浦区" },
      { "firstName": "S", "name": "松江区" },
      { "firstName": "X", "name": "徐汇区" },
      { "firstName": "Y", "name": "杨浦区" },
      { "firstName": "Z", "name": "闸北区" }
    ]
  },
  {
    "firstName": "S",
    "name": "四川省",
    "cityList": [
      {
        "firstName": "A",
        "name": "阿坝藏族羌族自治州",
        "areaList": [
          { "firstName": "A", "name": "阿坝县" },
          { "firstName": "H", "name": "黑水县" },
          { "firstName": "H", "name": "红原县" },
          { "firstName": "J", "name": "九寨沟县" },
          { "firstName": "J", "name": "金川县" },
          { "firstName": "L", "name": "理　县" },
          { "firstName": "M", "name": "茂　县" },
          { "firstName": "M", "name": "马尔康县" },
          { "firstName": "R", "name": "壤塘县" },
          { "firstName": "R", "name": "若尔盖县" },
          { "firstName": "S", "name": "松潘县" },
          { "firstName": "W", "name": "汶川县" },
          { "firstName": "X", "name": "小金县" }
        ]
      },
      {
        "firstName": "B",
        "name": "巴中市",
        "areaList": [
          { "firstName": "B", "name": "巴州区" },
          { "firstName": "N", "name": "南江县" },
          { "firstName": "P", "name": "平昌县" },
          { "firstName": "T", "name": "通江县" }
        ]
      },
      {
        "firstName": "C",
        "name": "成都市",
        "areaList": [
          { "firstName": "C", "name": "成华区" },
          { "firstName": "C", "name": "崇州市" },
          { "firstName": "D", "name": "大邑县" },
          { "firstName": "D", "name": "都江堰市" },
          { "firstName": "J", "name": "锦江区" },
          { "firstName": "J", "name": "金牛区" },
          { "firstName": "J", "name": "金堂县" },
          { "firstName": "L", "name": "龙泉驿区" },
          { "firstName": "P", "name": "郫县" },
          { "firstName": "P", "name": "蒲江县" },
          { "firstName": "P", "name": "彭州市" },
          { "firstName": "Q", "name": "青羊区" },
          { "firstName": "Q", "name": "青白江区" },
          { "firstName": "Q", "name": "邛崃市" },
          { "firstName": "S", "name": "双流县" },
          { "firstName": "W", "name": "武侯区" },
          { "firstName": "W", "name": "温江县" },
          { "firstName": "X", "name": "新都区" },
          { "firstName": "X", "name": "新津县" }
        ]
      },
      {
        "firstName": "D",
        "name": "德阳市",
        "areaList": [
          { "firstName": "G", "name": "广汉市" },
          { "firstName": "J", "name": "旌阳区" },
          { "firstName": "L", "name": "罗江县" },
          { "firstName": "M", "name": "绵竹市" },
          { "firstName": "S", "name": "什邡市" },
          { "firstName": "Z", "name": "中江县" }
        ]
      },
      {
        "firstName": "D",
        "name": "达州市",
        "areaList": [
          { "firstName": "D", "name": "达县" },
          { "firstName": "D", "name": "大竹县" },
          { "firstName": "K", "name": "开江县" },
          { "firstName": "Q", "name": "渠县" },
          { "firstName": "T", "name": "通川区" },
          { "firstName": "W", "name": "万源市" },
          { "firstName": "X", "name": "宣汉县" }
        ]
      },
      {
        "firstName": "G",
        "name": "广元市",
        "areaList": [
          { "firstName": "C", "name": "朝天区" },
          { "firstName": "C", "name": "苍溪县" },
          { "firstName": "J", "name": "剑阁县" },
          { "firstName": "Q", "name": "青川县" },
          { "firstName": "S", "name": "市中区" },
          { "firstName": "W", "name": "旺苍县" },
          { "firstName": "Y", "name": "元坝区" }
        ]
      },
      {
        "firstName": "G",
        "name": "广安市",
        "areaList": [
          { "firstName": "G", "name": "广安区" },
          { "firstName": "H", "name": "华莹市" },
          { "firstName": "L", "name": "邻水县" },
          { "firstName": "W", "name": "武胜县" },
          { "firstName": "Y", "name": "岳池县" }
        ]
      },
      {
        "firstName": "G",
        "name": "甘孜藏族自治州",
        "areaList": [
          { "firstName": "B", "name": "白玉县" },
          { "firstName": "B", "name": "巴塘县" },
          { "firstName": "D", "name": "丹巴县" },
          { "firstName": "D", "name": "道孚县" },
          { "firstName": "D", "name": "德格县" },
          { "firstName": "D", "name": "稻城县" },
          { "firstName": "D", "name": "得荣县" },
          { "firstName": "G", "name": "甘孜县" },
          { "firstName": "J", "name": "九龙县" },
          { "firstName": "K", "name": "康定县" },
          { "firstName": "L", "name": "泸定县" },
          { "firstName": "L", "name": "炉霍县" },
          { "firstName": "L", "name": "理塘县" },
          { "firstName": "S", "name": "石渠县" },
          { "firstName": "S", "name": "色达县" },
          { "firstName": "X", "name": "新龙县" },
          { "firstName": "X", "name": "乡城县" },
          { "firstName": "Y", "name": "雅江县" }
        ]
      },
      {
        "firstName": "L",
        "name": "泸州市",
        "areaList": [
          { "firstName": "G", "name": "古蔺县" },
          { "firstName": "H", "name": "合江县" },
          { "firstName": "J", "name": "江阳区" },
          { "firstName": "L", "name": "龙马潭区" },
          { "firstName": "L", "name": "泸县" },
          { "firstName": "N", "name": "纳溪区" },
          { "firstName": "X", "name": "叙永县" }
        ]
      },
      {
        "firstName": "L",
        "name": "乐山市",
        "areaList": [
          { "firstName": "E", "name": "峨边彝族自治县" },
          { "firstName": "E", "name": "峨眉山市" },
          { "firstName": "J", "name": "金口河区" },
          { "firstName": "J", "name": "犍为县" },
          { "firstName": "J", "name": "井研县" },
          { "firstName": "J", "name": "夹江县" },
          { "firstName": "M", "name": "沐川县" },
          { "firstName": "M", "name": "马边彝族自治县" },
          { "firstName": "S", "name": "市中区" },
          { "firstName": "S", "name": "沙湾区" },
          { "firstName": "W", "name": "五通桥区" }
        ]
      },
      {
        "firstName": "L",
        "name": "凉山彝族自治州",
        "areaList": [
          { "firstName": "B", "name": "布拖县" },
          { "firstName": "D", "name": "德昌县" },
          { "firstName": "G", "name": "甘洛县" },
          { "firstName": "H", "name": "会理县" },
          { "firstName": "H", "name": "会东县" },
          { "firstName": "J", "name": "金阳县" },
          { "firstName": "L", "name": "雷波县" },
          { "firstName": "M", "name": "木里藏族自治县" },
          { "firstName": "M", "name": "冕宁县" },
          { "firstName": "M", "name": "美姑县" },
          { "firstName": "N", "name": "宁南县" },
          { "firstName": "P", "name": "普格县" },
          { "firstName": "X", "name": "西昌市" },
          { "firstName": "X", "name": "喜德县" },
          { "firstName": "Y", "name": "盐源县" },
          { "firstName": "Y", "name": "越西县" },
          { "firstName": "Z", "name": "昭觉县" }
        ]
      },
      {
        "firstName": "M",
        "name": "绵阳市",
        "areaList": [
          { "firstName": "A", "name": "安县" },
          { "firstName": "B", "name": "北川羌族自治县" },
          { "firstName": "F", "name": "涪城区" },
          { "firstName": "J", "name": "江油市" },
          { "firstName": "P", "name": "平武县" },
          { "firstName": "S", "name": "三台县" },
          { "firstName": "Y", "name": "游仙区" },
          { "firstName": "Y", "name": "盐亭县" },
          { "firstName": "Z", "name": "梓潼县" }
        ]
      },
      {
        "firstName": "M",
        "name": "眉山市",
        "areaList": [
          { "firstName": "D", "name": "东坡区" },
          { "firstName": "D", "name": "丹棱县" },
          { "firstName": "H", "name": "洪雅县" },
          { "firstName": "P", "name": "彭山县" },
          { "firstName": "Q", "name": "青神县" },
          { "firstName": "R", "name": "仁寿县" }
        ]
      },
      {
        "firstName": "N",
        "name": "内江市",
        "areaList": [
          { "firstName": "D", "name": "东兴区" },
          { "firstName": "L", "name": "隆昌县" },
          { "firstName": "S", "name": "市中区" },
          { "firstName": "W", "name": "威远县" },
          { "firstName": "Z", "name": "资中县" }
        ]
      },
      {
        "firstName": "N",
        "name": "南充市",
        "areaList": [
          { "firstName": "G", "name": "高坪区" },
          { "firstName": "J", "name": "嘉陵区" },
          { "firstName": "L", "name": "阆中市" },
          { "firstName": "N", "name": "南部县" },
          { "firstName": "P", "name": "蓬安县" },
          { "firstName": "S", "name": "顺庆区" },
          { "firstName": "X", "name": "西充县" },
          { "firstName": "Y", "name": "营山县" },
          { "firstName": "Y", "name": "仪陇县" }
        ]
      },
      {
        "firstName": "P",
        "name": "攀枝花市",
        "areaList": [
          { "firstName": "D", "name": "东区" },
          { "firstName": "M", "name": "米易县" },
          { "firstName": "R", "name": "仁和区" },
          { "firstName": "X", "name": "西区" },
          { "firstName": "Y", "name": "盐边县" }
        ]
      },
      {
        "firstName": "S",
        "name": "遂宁市",
        "areaList": [
          { "firstName": "A", "name": "安居区" },
          { "firstName": "C", "name": "船山区" },
          { "firstName": "D", "name": "大英县" },
          { "firstName": "P", "name": "蓬溪县" },
          { "firstName": "S", "name": "射洪县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "宜宾市",
        "areaList": [
          { "firstName": "C", "name": "翠屏区" },
          { "firstName": "C", "name": "长宁县" },
          { "firstName": "G", "name": "高县" },
          { "firstName": "G", "name": "珙县" },
          { "firstName": "J", "name": "江安县" },
          { "firstName": "J", "name": "筠连县" },
          { "firstName": "N", "name": "南溪县" },
          { "firstName": "P", "name": "屏山县" },
          { "firstName": "X", "name": "兴文县" },
          { "firstName": "Y", "name": "宜宾县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "雅安市",
        "areaList": [
          { "firstName": "B", "name": "宝兴县" },
          { "firstName": "H", "name": "汉源县" },
          { "firstName": "L", "name": "芦山县" },
          { "firstName": "M", "name": "名山县" },
          { "firstName": "S", "name": "石棉县" },
          { "firstName": "T", "name": "天全县" },
          { "firstName": "X", "name": "荥经县" },
          { "firstName": "Y", "name": "雨城区" }
        ]
      },
      {
        "firstName": "Z",
        "name": "自贡市",
        "areaList": [
          { "firstName": "D", "name": "大安区" },
          { "firstName": "F", "name": "富顺县" },
          { "firstName": "G", "name": "贡井区" },
          { "firstName": "R", "name": "荣县" },
          { "firstName": "Y", "name": "沿滩区" },
          { "firstName": "Z", "name": "自流井区" }
        ]
      },
      {
        "firstName": "Z",
        "name": "资阳市",
        "areaList": [
          { "firstName": "A", "name": "安岳县" },
          { "firstName": "J", "name": "简阳市" },
          { "firstName": "L", "name": "乐至县" },
          { "firstName": "Y", "name": "雁江区" }
        ]
      }
    ]
  },
  {
    "firstName": "S",
    "name": "陕西省",
    "cityList": [
      {
        "firstName": "A",
        "name": "安康市",
        "areaList": [
          { "firstName": "B", "name": "白河县" },
          { "firstName": "H", "name": "汉滨区" },
          { "firstName": "H", "name": "汉阴县" },
          { "firstName": "L", "name": "岚皋县" },
          { "firstName": "N", "name": "宁陕县" },
          { "firstName": "P", "name": "平利县" },
          { "firstName": "S", "name": "石泉县" },
          { "firstName": "X", "name": "旬阳县" },
          { "firstName": "Z", "name": "紫阳县" },
          { "firstName": "Z", "name": "镇坪县" }
        ]
      },
      {
        "firstName": "B",
        "name": "宝鸡市",
        "areaList": [
          { "firstName": "C", "name": "陈仓区" },
          { "firstName": "F", "name": "凤翔县" },
          { "firstName": "F", "name": "扶风县" },
          { "firstName": "F", "name": "凤县" },
          { "firstName": "J", "name": "金台区" },
          { "firstName": "L", "name": "陇　县" },
          { "firstName": "L", "name": "麟游县" },
          { "firstName": "M", "name": "眉县" },
          { "firstName": "Q", "name": "岐山县" },
          { "firstName": "Q", "name": "千阳县" },
          { "firstName": "T", "name": "太白县" },
          { "firstName": "W", "name": "渭滨区" }
        ]
      },
      {
        "firstName": "H",
        "name": "汉中市",
        "areaList": [
          { "firstName": "C", "name": "城固县" },
          { "firstName": "F", "name": "佛坪县" },
          { "firstName": "H", "name": "汉台区" },
          { "firstName": "L", "name": "略阳县" },
          { "firstName": "L", "name": "留坝县" },
          { "firstName": "M", "name": "勉县" },
          { "firstName": "N", "name": "南郑县" },
          { "firstName": "N", "name": "宁强县" },
          { "firstName": "X", "name": "西乡县" },
          { "firstName": "Y", "name": "洋县" },
          { "firstName": "Z", "name": "镇巴县" }
        ]
      },
      {
        "firstName": "S",
        "name": "商洛市",
        "areaList": [
          { "firstName": "D", "name": "丹凤县" },
          { "firstName": "L", "name": "洛南县" },
          { "firstName": "S", "name": "商州区" },
          { "firstName": "S", "name": "商南县" },
          { "firstName": "S", "name": "山阳县" },
          { "firstName": "Z", "name": "镇安县" },
          { "firstName": "Z", "name": "柞水县" }
        ]
      },
      {
        "firstName": "T",
        "name": "铜川市",
        "areaList": [
          { "firstName": "W", "name": "王益区" },
          { "firstName": "Y", "name": "印台区" },
          { "firstName": "Y", "name": "耀州区" },
          { "firstName": "Y", "name": "宜君县" }
        ]
      },
      {
        "firstName": "W",
        "name": "渭南市",
        "areaList": [
          { "firstName": "B", "name": "白水县" },
          { "firstName": "C", "name": "澄城县" },
          { "firstName": "D", "name": "大荔县" },
          { "firstName": "F", "name": "富平县" },
          { "firstName": "H", "name": "华县" },
          { "firstName": "H", "name": "合阳县" },
          { "firstName": "H", "name": "韩城市" },
          { "firstName": "H", "name": "华阴市" },
          { "firstName": "L", "name": "临渭区" },
          { "firstName": "P", "name": "蒲城县" },
          { "firstName": "T", "name": "潼关县" }
        ]
      },
      {
        "firstName": "X",
        "name": "西安市",
        "areaList": [
          { "firstName": "B", "name": "碑林区" },
          { "firstName": "B", "name": "灞桥区" },
          { "firstName": "C", "name": "长安区" },
          { "firstName": "G", "name": "高陵县" },
          { "firstName": "H", "name": "户　县" },
          { "firstName": "L", "name": "莲湖区" },
          { "firstName": "L", "name": "临潼区" },
          { "firstName": "L", "name": "蓝田县" },
          { "firstName": "W", "name": "未央区" },
          { "firstName": "X", "name": "新城区" },
          { "firstName": "Y", "name": "雁塔区" },
          { "firstName": "Y", "name": "阎良区" },
          { "firstName": "Z", "name": "周至县" }
        ]
      },
      {
        "firstName": "X",
        "name": "咸阳市",
        "areaList": [
          { "firstName": "B", "name": "彬　县" },
          { "firstName": "C", "name": "长武县" },
          { "firstName": "C", "name": "淳化县" },
          { "firstName": "J", "name": "泾阳县" },
          { "firstName": "L", "name": "礼泉县" },
          { "firstName": "Q", "name": "秦都区" },
          { "firstName": "Q", "name": "乾县" },
          { "firstName": "S", "name": "三原县" },
          { "firstName": "W", "name": "渭城区" },
          { "firstName": "W", "name": "武功县" },
          { "firstName": "X", "name": "旬邑县" },
          { "firstName": "X", "name": "兴平市" },
          { "firstName": "Y", "name": "杨凌区" },
          { "firstName": "Y", "name": "永寿县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "延安市",
        "areaList": [
          { "firstName": "A", "name": "安塞县" },
          { "firstName": "B", "name": "宝塔区" },
          { "firstName": "F", "name": "富县" },
          { "firstName": "G", "name": "甘泉县" },
          { "firstName": "H", "name": "黄龙县" },
          { "firstName": "H", "name": "黄陵县" },
          { "firstName": "L", "name": "洛川县" },
          { "firstName": "W", "name": "吴旗县" },
          { "firstName": "Y", "name": "延长县" },
          { "firstName": "Y", "name": "延川县" },
          { "firstName": "Y", "name": "宜川县" },
          { "firstName": "Z", "name": "子长县" },
          { "firstName": "Z", "name": "志丹县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "榆林市",
        "areaList": [
          { "firstName": "D", "name": "定边县" },
          { "firstName": "F", "name": "府谷县" },
          { "firstName": "H", "name": "横山县" },
          { "firstName": "J", "name": "靖边县" },
          { "firstName": "J", "name": "佳县" },
          { "firstName": "M", "name": "米脂县" },
          { "firstName": "Q", "name": "清涧县" },
          { "firstName": "S", "name": "神木县" },
          { "firstName": "S", "name": "绥德县" },
          { "firstName": "W", "name": "吴堡县" },
          { "firstName": "Y", "name": "榆阳区" },
          { "firstName": "Z", "name": "子洲县" }
        ]
      }
    ]
  },
  {
    "firstName": "S",
    "name": "山西省",
    "cityList": [
      {
        "firstName": "C",
        "name": "长治市",
        "areaList": [
          { "firstName": "C", "name": "城区" },
          { "firstName": "C", "name": "长治县" },
          { "firstName": "C", "name": "长子县" },
          { "firstName": "H", "name": "壶关县" },
          { "firstName": "J", "name": "郊区" },
          { "firstName": "L", "name": "黎城县" },
          { "firstName": "L", "name": "潞城市" },
          { "firstName": "P", "name": "平顺县" },
          { "firstName": "Q", "name": "沁县" },
          { "firstName": "Q", "name": "沁源县" },
          { "firstName": "T", "name": "屯留县" },
          { "firstName": "W", "name": "武乡县" },
          { "firstName": "X", "name": "襄垣县" }
        ]
      },
      {
        "firstName": "D",
        "name": "大同市",
        "areaList": [
          { "firstName": "C", "name": "城区" },
          { "firstName": "D", "name": "大同县" },
          { "firstName": "G", "name": "广灵县" },
          { "firstName": "H", "name": "浑源县" },
          { "firstName": "K", "name": "矿区" },
          { "firstName": "L", "name": "灵丘县" },
          { "firstName": "N", "name": "南郊区" },
          { "firstName": "T", "name": "天镇县" },
          { "firstName": "X", "name": "新荣区" },
          { "firstName": "Y", "name": "阳高县" },
          { "firstName": "Z", "name": "左云县" }
        ]
      },
      {
        "firstName": "J",
        "name": "晋城市",
        "areaList": [
          { "firstName": "C", "name": "城　区" },
          { "firstName": "G", "name": "高平市" },
          { "firstName": "L", "name": "陵川县" },
          { "firstName": "Q", "name": "沁水县" },
          { "firstName": "Y", "name": "阳城县" },
          { "firstName": "Z", "name": "泽州县" }
        ]
      },
      {
        "firstName": "J",
        "name": "晋中市",
        "areaList": [
          { "firstName": "H", "name": "和顺县" },
          { "firstName": "J", "name": "介休市" },
          { "firstName": "L", "name": "灵石县" },
          { "firstName": "P", "name": "平遥县" },
          { "firstName": "Q", "name": "祁　县" },
          { "firstName": "S", "name": "寿阳县" },
          { "firstName": "T", "name": "太谷县" },
          { "firstName": "X", "name": "昔阳县" },
          { "firstName": "Y", "name": "榆次区" },
          { "firstName": "Y", "name": "榆社县" },
          { "firstName": "Z", "name": "左权县" }
        ]
      },
      {
        "firstName": "L",
        "name": "临汾市",
        "areaList": [
          { "firstName": "A", "name": "安泽县" },
          { "firstName": "D", "name": "大宁县" },
          { "firstName": "F", "name": "浮山县" },
          { "firstName": "F", "name": "汾西县" },
          { "firstName": "G", "name": "古县" },
          { "firstName": "H", "name": "洪洞县" },
          { "firstName": "H", "name": "侯马市" },
          { "firstName": "H", "name": "霍州市" },
          { "firstName": "J", "name": "吉县" },
          { "firstName": "P", "name": "蒲县" },
          { "firstName": "Q", "name": "曲沃县" },
          { "firstName": "X", "name": "襄汾县" },
          { "firstName": "X", "name": "乡宁县" },
          { "firstName": "X", "name": "隰县" },
          { "firstName": "Y", "name": "尧都区" },
          { "firstName": "Y", "name": "翼城县" },
          { "firstName": "Y", "name": "永和县" }
        ]
      },
      {
        "firstName": "L",
        "name": "吕梁市",
        "areaList": [
          { "firstName": "F", "name": "方山县" },
          { "firstName": "F", "name": "汾阳市" },
          { "firstName": "J", "name": "交城县" },
          { "firstName": "J", "name": "交口县" },
          { "firstName": "L", "name": "离石区" },
          { "firstName": "L", "name": "临县" },
          { "firstName": "L", "name": "柳林县" },
          { "firstName": "L", "name": "岚县" },
          { "firstName": "S", "name": "石楼县" },
          { "firstName": "W", "name": "文水县" },
          { "firstName": "X", "name": "兴县" },
          { "firstName": "X", "name": "孝义市" },
          { "firstName": "Z", "name": "中阳县" }
        ]
      },
      {
        "firstName": "S",
        "name": "朔州市",
        "areaList": [
          { "firstName": "H", "name": "怀仁县" },
          { "firstName": "P", "name": "平鲁区" },
          { "firstName": "S", "name": "朔城区" },
          { "firstName": "S", "name": "山阴县" },
          { "firstName": "Y", "name": "应县" },
          { "firstName": "Y", "name": "右玉县" }
        ]
      },
      {
        "firstName": "T",
        "name": "太原市",
        "areaList": [
          { "firstName": "G", "name": "古交市" },
          { "firstName": "J", "name": "尖草坪区" },
          { "firstName": "J", "name": "晋源区" },
          { "firstName": "L", "name": "娄烦县" },
          { "firstName": "Q", "name": "清徐县" },
          { "firstName": "W", "name": "万柏林区" },
          { "firstName": "X", "name": "小店区" },
          { "firstName": "X", "name": "杏花岭区" },
          { "firstName": "Y", "name": "迎泽区" },
          { "firstName": "Y", "name": "阳曲县" }
        ]
      },
      {
        "firstName": "X",
        "name": "忻州市",
        "areaList": [
          { "firstName": "B", "name": "保德县" },
          { "firstName": "D", "name": "定襄县" },
          { "firstName": "D", "name": "代县" },
          { "firstName": "F", "name": "繁峙县" },
          { "firstName": "H", "name": "河曲县" },
          { "firstName": "J", "name": "静乐县" },
          { "firstName": "K", "name": "岢岚县" },
          { "firstName": "N", "name": "宁武县" },
          { "firstName": "P", "name": "偏关县" },
          { "firstName": "S", "name": "神池县" },
          { "firstName": "W", "name": "五台县" },
          { "firstName": "W", "name": "五寨县" },
          { "firstName": "X", "name": "忻府区" },
          { "firstName": "Y", "name": "原平市" }
        ]
      },
      {
        "firstName": "Y",
        "name": "阳泉市",
        "areaList": [
          { "firstName": "C", "name": "城区" },
          { "firstName": "J", "name": "郊　区" },
          { "firstName": "K", "name": "矿区" },
          { "firstName": "P", "name": "平定县" },
          { "firstName": "Y", "name": "盂　县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "运城市",
        "areaList": [
          { "firstName": "H", "name": "河津市" },
          { "firstName": "J", "name": "稷山县" },
          { "firstName": "J", "name": "绛县" },
          { "firstName": "L", "name": "临猗县" },
          { "firstName": "P", "name": "平陆县" },
          { "firstName": "R", "name": "芮城县" },
          { "firstName": "W", "name": "万荣县" },
          { "firstName": "W", "name": "闻喜县" },
          { "firstName": "X", "name": "新绛县" },
          { "firstName": "X", "name": "夏县" },
          { "firstName": "Y", "name": "盐湖区" },
          { "firstName": "Y", "name": "垣曲县" },
          { "firstName": "Y", "name": "永济市" }
        ]
      }
    ]
  },
  {
    "firstName": "S",
    "name": "山东省",
    "cityList": [
      {
        "firstName": "B",
        "name": "滨州市",
        "areaList": [
          { "firstName": "B", "name": "滨城区" },
          { "firstName": "B", "name": "博兴县" },
          { "firstName": "H", "name": "惠民县" },
          { "firstName": "W", "name": "无棣县" },
          { "firstName": "Y", "name": "阳信县" },
          { "firstName": "Z", "name": "沾化县" },
          { "firstName": "Z", "name": "邹平县" }
        ]
      },
      {
        "firstName": "D",
        "name": "东营市",
        "areaList": [
          { "firstName": "D", "name": "东营区" },
          { "firstName": "G", "name": "广饶县" },
          { "firstName": "H", "name": "河口区" },
          { "firstName": "K", "name": "垦利县" },
          { "firstName": "L", "name": "利津县" }
        ]
      },
      {
        "firstName": "D",
        "name": "德州市",
        "areaList": [
          { "firstName": "D", "name": "德城区" },
          { "firstName": "L", "name": "陵　县" },
          { "firstName": "L", "name": "临邑县" },
          { "firstName": "L", "name": "乐陵市" },
          { "firstName": "N", "name": "宁津县" },
          { "firstName": "P", "name": "平原县" },
          { "firstName": "Q", "name": "庆云县" },
          { "firstName": "Q", "name": "齐河县" },
          { "firstName": "W", "name": "武城县" },
          { "firstName": "X", "name": "夏津县" },
          { "firstName": "Y", "name": "禹城市" }
        ]
      },
      {
        "firstName": "H",
        "name": "荷泽市",
        "areaList": [
          { "firstName": "C", "name": "曹县" },
          { "firstName": "C", "name": "成武县" },
          { "firstName": "D", "name": "单县" },
          { "firstName": "D", "name": "定陶县" },
          { "firstName": "D", "name": "东明县" },
          { "firstName": "J", "name": "巨野县" },
          { "firstName": "J", "name": "鄄城县" },
          { "firstName": "M", "name": "牡丹区" },
          { "firstName": "Y", "name": "郓城县" }
        ]
      },
      {
        "firstName": "J",
        "name": "济南市",
        "areaList": [
          { "firstName": "C", "name": "长清区" },
          { "firstName": "H", "name": "槐荫区" },
          { "firstName": "J", "name": "济阳县" },
          { "firstName": "L", "name": "历下区" },
          { "firstName": "L", "name": "历城区" },
          { "firstName": "P", "name": "平阴县" },
          { "firstName": "S", "name": "市中区" },
          { "firstName": "S", "name": "商河县" },
          { "firstName": "T", "name": "天桥区" },
          { "firstName": "Z", "name": "章丘市" }
        ]
      },
      {
        "firstName": "J",
        "name": "济宁市",
        "areaList": [
          { "firstName": "J", "name": "金乡县" },
          { "firstName": "J", "name": "嘉祥县" },
          { "firstName": "L", "name": "梁山县" },
          { "firstName": "Q", "name": "曲阜市" },
          { "firstName": "R", "name": "任城区" },
          { "firstName": "S", "name": "市中区" },
          { "firstName": "S", "name": "泗水县" },
          { "firstName": "W", "name": "微山县" },
          { "firstName": "W", "name": "汶上县" },
          { "firstName": "Y", "name": "鱼台县" },
          { "firstName": "Y", "name": "兖州市" },
          { "firstName": "Z", "name": "邹城市" }
        ]
      },
      {
        "firstName": "L",
        "name": "莱芜市",
        "areaList": [{ "firstName": "G", "name": "钢城区" }, { "firstName": "L", "name": "莱城区" }]
      },
      {
        "firstName": "L",
        "name": "临沂市",
        "areaList": [
          { "firstName": "C", "name": "苍山县" },
          { "firstName": "F", "name": "费县" },
          { "firstName": "H", "name": "河东区" },
          { "firstName": "J", "name": "莒南县" },
          { "firstName": "L", "name": "兰山区" },
          { "firstName": "L", "name": "罗庄区" },
          { "firstName": "L", "name": "临沭县" },
          { "firstName": "M", "name": "蒙阴县" },
          { "firstName": "P", "name": "平邑县" },
          { "firstName": "T", "name": "郯城县" },
          { "firstName": "Y", "name": "沂南县" },
          { "firstName": "Y", "name": "沂水县" }
        ]
      },
      {
        "firstName": "L",
        "name": "聊城市",
        "areaList": [
          { "firstName": "C", "name": "茌平县" },
          { "firstName": "D", "name": "东昌府区" },
          { "firstName": "D", "name": "东阿县" },
          { "firstName": "G", "name": "冠县" },
          { "firstName": "G", "name": "高唐县" },
          { "firstName": "L", "name": "临清市" },
          { "firstName": "X", "name": "莘县" },
          { "firstName": "Y", "name": "阳谷县" }
        ]
      },
      {
        "firstName": "Q",
        "name": "青岛市",
        "areaList": [
          { "firstName": "C", "name": "城阳区" },
          { "firstName": "H", "name": "黄岛区" },
          { "firstName": "J", "name": "胶州市" },
          { "firstName": "J", "name": "即墨市" },
          { "firstName": "J", "name": "胶南市" },
          { "firstName": "L", "name": "崂山区" },
          { "firstName": "L", "name": "李沧区" },
          { "firstName": "L", "name": "莱西市" },
          { "firstName": "P", "name": "平度市" },
          { "firstName": "S", "name": "市南区" },
          { "firstName": "S", "name": "市北区" },
          { "firstName": "S", "name": "四方区" }
        ]
      },
      {
        "firstName": "R",
        "name": "日照市",
        "areaList": [
          { "firstName": "D", "name": "东港区" },
          { "firstName": "J", "name": "莒县" },
          { "firstName": "L", "name": "岚山区" },
          { "firstName": "W", "name": "五莲县" }
        ]
      },
      {
        "firstName": "T",
        "name": "泰安市",
        "areaList": [
          { "firstName": "D", "name": "岱岳区" },
          { "firstName": "D", "name": "东平县" },
          { "firstName": "F", "name": "肥城市" },
          { "firstName": "N", "name": "宁阳县" },
          { "firstName": "T", "name": "泰山区" },
          { "firstName": "X", "name": "新泰市" }
        ]
      },
      {
        "firstName": "W",
        "name": "潍坊市",
        "areaList": [
          { "firstName": "A", "name": "安丘市" },
          { "firstName": "C", "name": "昌乐县" },
          { "firstName": "C", "name": "昌邑市" },
          { "firstName": "F", "name": "坊子区" },
          { "firstName": "G", "name": "高密市" },
          { "firstName": "H", "name": "寒亭区" },
          { "firstName": "K", "name": "奎文区" },
          { "firstName": "L", "name": "临朐县" },
          { "firstName": "Q", "name": "青州市" },
          { "firstName": "S", "name": "寿光市" },
          { "firstName": "W", "name": "潍城区" },
          { "firstName": "Z", "name": "诸城市" }
        ]
      },
      {
        "firstName": "W",
        "name": "威海市",
        "areaList": [
          { "firstName": "H", "name": "环翠区" },
          { "firstName": "R", "name": "荣成市" },
          { "firstName": "R", "name": "乳山市" },
          { "firstName": "W", "name": "文登市" }
        ]
      },
      {
        "firstName": "Y",
        "name": "烟台市",
        "areaList": [
          { "firstName": "C", "name": "长岛县" },
          { "firstName": "F", "name": "福山区" },
          { "firstName": "H", "name": "海阳市" },
          { "firstName": "L", "name": "莱山区" },
          { "firstName": "L", "name": "龙口市" },
          { "firstName": "L", "name": "莱阳市" },
          { "firstName": "L", "name": "莱州市" },
          { "firstName": "M", "name": "牟平区" },
          { "firstName": "P", "name": "蓬莱市" },
          { "firstName": "Q", "name": "栖霞市" },
          { "firstName": "Z", "name": "芝罘区" },
          { "firstName": "Z", "name": "招远市" }
        ]
      },
      {
        "firstName": "Z",
        "name": "淄博市",
        "areaList": [
          { "firstName": "B", "name": "博山区" },
          { "firstName": "G", "name": "高青县" },
          { "firstName": "H", "name": "桓台县" },
          { "firstName": "L", "name": "临淄区" },
          { "firstName": "Y", "name": "沂源县" },
          { "firstName": "Z", "name": "淄川区" },
          { "firstName": "Z", "name": "张店区" },
          { "firstName": "Z", "name": "周村区" }
        ]
      },
      {
        "firstName": "Z",
        "name": "枣庄市",
        "areaList": [
          { "firstName": "S", "name": "市中区" },
          { "firstName": "S", "name": "山亭区" },
          { "firstName": "T", "name": "台儿庄区" },
          { "firstName": "T", "name": "滕州市" },
          { "firstName": "X", "name": "薛城区" },
          { "firstName": "Y", "name": "峄城区" }
        ]
      }
    ]
  },
  {
    "firstName": "T",
    "name": "天津",
    "areaList": [
      { "firstName": "B", "name": "北辰区" },
      { "firstName": "B", "name": "宝坻区" },
      { "firstName": "D", "name": "大港区" },
      { "firstName": "D", "name": "东丽区" },
      { "firstName": "H", "name": "和平区" },
      { "firstName": "H", "name": "河东区" },
      { "firstName": "H", "name": "河西区" },
      { "firstName": "H", "name": "河北区" },
      { "firstName": "H", "name": "红桥区" },
      { "firstName": "H", "name": "汉沽区" },
      { "firstName": "J", "name": "津南区" },
      { "firstName": "J", "name": "静海县" },
      { "firstName": "J", "name": "蓟　县" },
      { "firstName": "N", "name": "南开区" },
      { "firstName": "N", "name": "宁河县" },
      { "firstName": "T", "name": "塘沽区" },
      { "firstName": "W", "name": "武清区" },
      { "firstName": "X", "name": "西青区" }
    ]
  },
  {
    "firstName": "X",
    "name": "西藏自治区",
    "cityList": [
      {
        "firstName": "A",
        "name": "阿里地区",
        "areaList": [
          { "firstName": "C", "name": "措勤县" },
          { "firstName": "G", "name": "噶尔县" },
          { "firstName": "G", "name": "革吉县" },
          { "firstName": "G", "name": "改则县" },
          { "firstName": "P", "name": "普兰县" },
          { "firstName": "R", "name": "日土县" },
          { "firstName": "Z", "name": "札达县" }
        ]
      },
      {
        "firstName": "C",
        "name": "昌都地区",
        "areaList": [
          { "firstName": "B", "name": "八宿县" },
          { "firstName": "B", "name": "边坝县" },
          { "firstName": "C", "name": "昌都县" },
          { "firstName": "C", "name": "察雅县" },
          { "firstName": "D", "name": "丁青县" },
          { "firstName": "G", "name": "贡觉县" },
          { "firstName": "J", "name": "江达县" },
          { "firstName": "L", "name": "类乌齐县" },
          { "firstName": "L", "name": "洛隆县" },
          { "firstName": "M", "name": "芒康县" },
          { "firstName": "Z", "name": "左贡县" }
        ]
      },
      {
        "firstName": "L",
        "name": "拉萨市",
        "areaList": [
          { "firstName": "C", "name": "城关区" },
          { "firstName": "D", "name": "当雄县" },
          { "firstName": "D", "name": "堆龙德庆县" },
          { "firstName": "D", "name": "达孜县" },
          { "firstName": "L", "name": "林周县" },
          { "firstName": "M", "name": "墨竹工卡县" },
          { "firstName": "N", "name": "尼木县" },
          { "firstName": "Q", "name": "曲水县" }
        ]
      },
      {
        "firstName": "L",
        "name": "林芝地区",
        "areaList": [
          { "firstName": "B", "name": "波密县" },
          { "firstName": "C", "name": "察隅县" },
          { "firstName": "G", "name": "工布江达县" },
          { "firstName": "L", "name": "林芝县" },
          { "firstName": "L", "name": "朗　县" },
          { "firstName": "M", "name": "米林县" },
          { "firstName": "M", "name": "墨脱县" }
        ]
      },
      {
        "firstName": "N",
        "name": "那曲地区",
        "areaList": [
          { "firstName": "A", "name": "安多县" },
          { "firstName": "B", "name": "比如县" },
          { "firstName": "B", "name": "班戈县" },
          { "firstName": "B", "name": "巴青县" },
          { "firstName": "J", "name": "嘉黎县" },
          { "firstName": "N", "name": "那曲县" },
          { "firstName": "N", "name": "聂荣县" },
          { "firstName": "N", "name": "尼玛县" },
          { "firstName": "S", "name": "申扎县" },
          { "firstName": "S", "name": "索　县" }
        ]
      },
      {
        "firstName": "R",
        "name": "日喀则地区",
        "areaList": [
          { "firstName": "A", "name": "昂仁县" },
          { "firstName": "B", "name": "白朗县" },
          { "firstName": "D", "name": "定日县" },
          { "firstName": "D", "name": "定结县" },
          { "firstName": "G", "name": "岗巴县" },
          { "firstName": "J", "name": "江孜县" },
          { "firstName": "J", "name": "吉隆县" },
          { "firstName": "K", "name": "康马县" },
          { "firstName": "L", "name": "拉孜县" },
          { "firstName": "N", "name": "南木林县" },
          { "firstName": "N", "name": "聂拉木县" },
          { "firstName": "R", "name": "日喀则市" },
          { "firstName": "R", "name": "仁布县" },
          { "firstName": "S", "name": "萨迦县" },
          { "firstName": "S", "name": "萨嘎县" },
          { "firstName": "X", "name": "谢通门县" },
          { "firstName": "Y", "name": "亚东县" },
          { "firstName": "Z", "name": "仲巴县" }
        ]
      },
      {
        "firstName": "S",
        "name": "山南地区",
        "areaList": [
          { "firstName": "C", "name": "措美县" },
          { "firstName": "C", "name": "错那县" },
          { "firstName": "G", "name": "贡嘎县" },
          { "firstName": "J", "name": "加查县" },
          { "firstName": "L", "name": "洛扎县" },
          { "firstName": "L", "name": "隆子县" },
          { "firstName": "L", "name": "浪卡子县" },
          { "firstName": "N", "name": "乃东县" },
          { "firstName": "Q", "name": "琼结县" },
          { "firstName": "Q", "name": "曲松县" },
          { "firstName": "S", "name": "桑日县" },
          { "firstName": "Z", "name": "扎囊县" }
        ]
      }
    ]
  },
  {
    "firstName": "X",
    "name": "新疆维吾尔自治区",
    "cityList": [
      {
        "firstName": "A",
        "name": "阿克苏地区",
        "areaList": [
          { "firstName": "A", "name": "阿克苏市" },
          { "firstName": "A", "name": "阿瓦提县" },
          { "firstName": "B", "name": "拜城县" },
          { "firstName": "K", "name": "库车县" },
          { "firstName": "K", "name": "柯坪县" },
          { "firstName": "S", "name": "沙雅县" },
          { "firstName": "W", "name": "温宿县" },
          { "firstName": "W", "name": "乌什县" },
          { "firstName": "X", "name": "新和县" }
        ]
      },
      {
        "firstName": "A",
        "name": "阿勒泰地区",
        "areaList": [
          { "firstName": "A", "name": "阿勒泰市" },
          { "firstName": "B", "name": "布尔津县" },
          { "firstName": "F", "name": "富蕴县" },
          { "firstName": "F", "name": "福海县" },
          { "firstName": "H", "name": "哈巴河县" },
          { "firstName": "J", "name": "吉木乃县" },
          { "firstName": "Q", "name": "青河县" }
        ]
      },
      {
        "firstName": "B",
        "name": "博尔塔拉蒙古自治州",
        "areaList": [
          { "firstName": "B", "name": "博乐市" },
          { "firstName": "J", "name": "精河县" },
          { "firstName": "W", "name": "温泉县" }
        ]
      },
      {
        "firstName": "B",
        "name": "巴音郭楞蒙古自治州",
        "areaList": [
          { "firstName": "B", "name": "博湖县" },
          { "firstName": "H", "name": "和静县" },
          { "firstName": "H", "name": "和硕县" },
          { "firstName": "K", "name": "库尔勒市" },
          { "firstName": "L", "name": "轮台县" },
          { "firstName": "Q", "name": "且末县" },
          { "firstName": "R", "name": "若羌县" },
          { "firstName": "W", "name": "尉犁县" },
          { "firstName": "Y", "name": "焉耆回族自治县" }
        ]
      },
      {
        "firstName": "C",
        "name": "昌吉回族自治州",
        "areaList": [
          { "firstName": "C", "name": "昌吉市" },
          { "firstName": "F", "name": "阜康市" },
          { "firstName": "H", "name": "呼图壁县" },
          { "firstName": "J", "name": "吉木萨尔县" },
          { "firstName": "M", "name": "米泉市" },
          { "firstName": "M", "name": "玛纳斯县" },
          { "firstName": "M", "name": "木垒哈萨克自治县" },
          { "firstName": "Q", "name": "奇台县" }
        ]
      },
      {
        "firstName": "H",
        "name": "哈密地区",
        "areaList": [
          { "firstName": "B", "name": "巴里坤哈萨克自治县" },
          { "firstName": "H", "name": "哈密市" },
          { "firstName": "Y", "name": "伊吾县" }
        ]
      },
      {
        "firstName": "H",
        "name": "和田地区",
        "areaList": [
          { "firstName": "C", "name": "策勒县" },
          { "firstName": "H", "name": "和田市" },
          { "firstName": "H", "name": "和田县" },
          { "firstName": "L", "name": "洛浦县" },
          { "firstName": "M", "name": "墨玉县" },
          { "firstName": "M", "name": "民丰县" },
          { "firstName": "P", "name": "皮山县" },
          { "firstName": "Y", "name": "于田县" }
        ]
      },
      {
        "firstName": "K",
        "name": "克拉玛依市",
        "areaList": [
          { "firstName": "B", "name": "白碱滩区" },
          { "firstName": "D", "name": "独山子区" },
          { "firstName": "K", "name": "克拉玛依区" },
          { "firstName": "W", "name": "乌尔禾区" }
        ]
      },
      {
        "firstName": "K",
        "name": "克孜勒苏柯尔克孜自治州",
        "areaList": [
          { "firstName": "A", "name": "阿图什市" },
          { "firstName": "A", "name": "阿克陶县" },
          { "firstName": "A", "name": "阿合奇县" },
          { "firstName": "W", "name": "乌恰县" }
        ]
      },
      {
        "firstName": "K",
        "name": "喀什地区",
        "areaList": [
          { "firstName": "B", "name": "巴楚县" },
          { "firstName": "J", "name": "伽师县" },
          { "firstName": "K", "name": "喀什市" },
          { "firstName": "M", "name": "麦盖提县" },
          { "firstName": "S", "name": "疏附县" },
          { "firstName": "S", "name": "疏勒县" },
          { "firstName": "S", "name": "莎车县" },
          { "firstName": "T", "name": "塔什库尔干塔吉克自治县" },
          { "firstName": "Y", "name": "英吉沙县" },
          { "firstName": "Y", "name": "叶城县" },
          { "firstName": "Y", "name": "岳普湖县" },
          { "firstName": "Z", "name": "泽普县" }
        ]
      },
      {
        "firstName": "S",
        "name": "省直辖行政单位",
        "areaList": [
          { "firstName": "A", "name": "阿拉尔市" },
          { "firstName": "S", "name": "石河子市" },
          { "firstName": "T", "name": "图木舒克市" },
          { "firstName": "W", "name": "五家渠市" }
        ]
      },
      {
        "firstName": "T",
        "name": "吐鲁番地区",
        "areaList": [
          { "firstName": "S", "name": "鄯善县" },
          { "firstName": "T", "name": "吐鲁番市" },
          { "firstName": "T", "name": "托克逊县" }
        ]
      },
      {
        "firstName": "T",
        "name": "塔城地区",
        "areaList": [
          { "firstName": "E", "name": "额敏县" },
          { "firstName": "H", "name": "和布克赛尔蒙古自治县" },
          { "firstName": "S", "name": "沙湾县" },
          { "firstName": "T", "name": "塔城市" },
          { "firstName": "T", "name": "托里县" },
          { "firstName": "W", "name": "乌苏市" },
          { "firstName": "Y", "name": "裕民县" }
        ]
      },
      {
        "firstName": "W",
        "name": "乌鲁木齐市",
        "areaList": [
          { "firstName": "D", "name": "达坂城区" },
          { "firstName": "D", "name": "东山区" },
          { "firstName": "S", "name": "沙依巴克区" },
          { "firstName": "S", "name": "水磨沟区" },
          { "firstName": "T", "name": "天山区" },
          { "firstName": "T", "name": "头屯河区" },
          { "firstName": "W", "name": "乌鲁木齐县" },
          { "firstName": "X", "name": "新市区" }
        ]
      },
      {
        "firstName": "Y",
        "name": "伊犁哈萨克自治州",
        "areaList": [
          { "firstName": "C", "name": "察布查尔锡伯自治县" },
          { "firstName": "G", "name": "巩留县" },
          { "firstName": "H", "name": "霍城县" },
          { "firstName": "K", "name": "奎屯市" },
          { "firstName": "N", "name": "尼勒克县" },
          { "firstName": "T", "name": "特克斯县" },
          { "firstName": "X", "name": "新源县" },
          { "firstName": "Y", "name": "伊宁市" },
          { "firstName": "Y", "name": "伊宁县" },
          { "firstName": "Z", "name": "昭苏县" }
        ]
      }
    ]
  },
  {
    "firstName": "Y",
    "name": "云南省",
    "cityList": [
      {
        "firstName": "B",
        "name": "保山市",
        "areaList": [
          { "firstName": "C", "name": "昌宁县" },
          { "firstName": "L", "name": "隆阳区" },
          { "firstName": "L", "name": "龙陵县" },
          { "firstName": "S", "name": "施甸县" },
          { "firstName": "T", "name": "腾冲县" }
        ]
      },
      {
        "firstName": "C",
        "name": "楚雄彝族自治州",
        "areaList": [
          { "firstName": "C", "name": "楚雄市" },
          { "firstName": "D", "name": "大姚县" },
          { "firstName": "L", "name": "禄丰县" },
          { "firstName": "M", "name": "牟定县" },
          { "firstName": "N", "name": "南华县" },
          { "firstName": "S", "name": "双柏县" },
          { "firstName": "W", "name": "武定县" },
          { "firstName": "Y", "name": "姚安县" },
          { "firstName": "Y", "name": "永仁县" },
          { "firstName": "Y", "name": "元谋县" }
        ]
      },
      {
        "firstName": "D",
        "name": "大理白族自治州",
        "areaList": [
          { "firstName": "B", "name": "宾川县" },
          { "firstName": "D", "name": "大理市" },
          { "firstName": "E", "name": "洱源县" },
          { "firstName": "H", "name": "鹤庆县" },
          { "firstName": "J", "name": "剑川县" },
          { "firstName": "M", "name": "弥渡县" },
          { "firstName": "N", "name": "南涧彝族自治县" },
          { "firstName": "W", "name": "巍山彝族回族自治县" },
          { "firstName": "X", "name": "祥云县" },
          { "firstName": "Y", "name": "漾濞彝族自治县" },
          { "firstName": "Y", "name": "永平县" },
          { "firstName": "Y", "name": "云龙县" }
        ]
      },
      {
        "firstName": "D",
        "name": "德宏傣族景颇族自治州",
        "areaList": [
          { "firstName": "L", "name": "潞西市" },
          { "firstName": "L", "name": "梁河县" },
          { "firstName": "L", "name": "陇川县" },
          { "firstName": "R", "name": "瑞丽市" },
          { "firstName": "Y", "name": "盈江县" }
        ]
      },
      {
        "firstName": "D",
        "name": "迪庆藏族自治州",
        "areaList": [
          { "firstName": "D", "name": "德钦县" },
          { "firstName": "W", "name": "维西傈僳族自治县" },
          { "firstName": "X", "name": "香格里拉县" }
        ]
      },
      {
        "firstName": "H",
        "name": "红河哈尼族彝族自治州",
        "areaList": [
          { "firstName": "G", "name": "个旧市" },
          { "firstName": "H", "name": "红河县" },
          { "firstName": "H", "name": "河口瑶族自治县" },
          { "firstName": "J", "name": "建水县" },
          { "firstName": "J", "name": "金平苗族瑶族傣族自治县" },
          { "firstName": "K", "name": "开远市" },
          { "firstName": "L", "name": "泸西县" },
          { "firstName": "L", "name": "绿春县" },
          { "firstName": "M", "name": "蒙自县" },
          { "firstName": "M", "name": "弥勒县" },
          { "firstName": "P", "name": "屏边苗族自治县" },
          { "firstName": "S", "name": "石屏县" },
          { "firstName": "Y", "name": "元阳县" }
        ]
      },
      {
        "firstName": "K",
        "name": "昆明市",
        "areaList": [
          { "firstName": "A", "name": "安宁市" },
          { "firstName": "C", "name": "呈贡县" },
          { "firstName": "D", "name": "东川区" },
          { "firstName": "F", "name": "富民县" },
          { "firstName": "G", "name": "官渡区" },
          { "firstName": "J", "name": "晋宁县" },
          { "firstName": "L", "name": "禄劝彝族苗族自治县" },
          { "firstName": "P", "name": "盘龙区" },
          { "firstName": "S", "name": "石林彝族自治县" },
          { "firstName": "S", "name": "嵩明县" },
          { "firstName": "W", "name": "五华区" },
          { "firstName": "X", "name": "西山区" },
          { "firstName": "X", "name": "寻甸回族彝族自治县" },
          { "firstName": "Y", "name": "宜良县" }
        ]
      },
      {
        "firstName": "L",
        "name": "丽江市",
        "areaList": [
          { "firstName": "G", "name": "古城区" },
          { "firstName": "H", "name": "华坪县" },
          { "firstName": "N", "name": "宁蒗彝族自治县" },
          { "firstName": "Y", "name": "玉龙纳西族自治县" },
          { "firstName": "Y", "name": "永胜县" }
        ]
      },
      {
        "firstName": "L",
        "name": "临沧市",
        "areaList": [
          { "firstName": "C", "name": "沧源佤族自治县" },
          { "firstName": "F", "name": "凤庆县" },
          { "firstName": "G", "name": "耿马傣族佤族自治县" },
          { "firstName": "L", "name": "临翔区" },
          { "firstName": "S", "name": "双江拉祜族佤族布朗族傣族自治县" },
          { "firstName": "Y", "name": "云　县" },
          { "firstName": "Y", "name": "永德县" },
          { "firstName": "Z", "name": "镇康县" }
        ]
      },
      {
        "firstName": "N",
        "name": "怒江傈僳族自治州",
        "areaList": [
          { "firstName": "F", "name": "福贡县" },
          { "firstName": "G", "name": "贡山独龙族怒族自治县" },
          { "firstName": "L", "name": "泸水县" },
          { "firstName": "L", "name": "兰坪白族普米族自治县" }
        ]
      },
      {
        "firstName": "Q",
        "name": "曲靖市",
        "areaList": [
          { "firstName": "F", "name": "富源县" },
          { "firstName": "H", "name": "会泽县" },
          { "firstName": "L", "name": "陆良县" },
          { "firstName": "L", "name": "罗平县" },
          { "firstName": "M", "name": "马龙县" },
          { "firstName": "Q", "name": "麒麟区" },
          { "firstName": "S", "name": "师宗县" },
          { "firstName": "X", "name": "宣威市" },
          { "firstName": "Z", "name": "沾益县" }
        ]
      },
      {
        "firstName": "S",
        "name": "思茅市",
        "areaList": [
          { "firstName": "C", "name": "翠云区" },
          { "firstName": "J", "name": "景东彝族自治县" },
          { "firstName": "J", "name": "景谷傣族彝族自治县" },
          { "firstName": "J", "name": "江城哈尼族彝族自治县" },
          { "firstName": "L", "name": "澜沧拉祜族自治县" },
          { "firstName": "M", "name": "墨江哈尼族自治县" },
          { "firstName": "M", "name": "孟连傣族拉祜族佤族自治县" },
          { "firstName": "P", "name": "普洱哈尼族彝族自治县" },
          { "firstName": "X", "name": "西盟佤族自治县" },
          { "firstName": "Z", "name": "镇沅彝族哈尼族拉祜族自治县" }
        ]
      },
      {
        "firstName": "W",
        "name": "文山壮族苗族自治州",
        "areaList": [
          { "firstName": "F", "name": "富宁县" },
          { "firstName": "G", "name": "广南县" },
          { "firstName": "M", "name": "麻栗坡县" },
          { "firstName": "M", "name": "马关县" },
          { "firstName": "Q", "name": "丘北县" },
          { "firstName": "W", "name": "文山县" },
          { "firstName": "X", "name": "西畴县" },
          { "firstName": "Y", "name": "砚山县" }
        ]
      },
      {
        "firstName": "X",
        "name": "西双版纳傣族自治州",
        "areaList": [
          { "firstName": "J", "name": "景洪市" },
          { "firstName": "M", "name": "勐海县" },
          { "firstName": "M", "name": "勐腊县" }
        ]
      },
      {
        "firstName": "Y",
        "name": "玉溪市",
        "areaList": [
          { "firstName": "C", "name": "澄江县" },
          { "firstName": "E", "name": "峨山彝族自治县" },
          { "firstName": "H", "name": "红塔区" },
          { "firstName": "H", "name": "华宁县" },
          { "firstName": "J", "name": "江川县" },
          { "firstName": "T", "name": "通海县" },
          { "firstName": "X", "name": "新平彝族傣族自治县" },
          { "firstName": "Y", "name": "易门县" },
          { "firstName": "Y", "name": "元江哈尼族彝族傣族自治县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "昭通市",
        "areaList": [
          { "firstName": "D", "name": "大关县" },
          { "firstName": "L", "name": "鲁甸县" },
          { "firstName": "Q", "name": "巧家县" },
          { "firstName": "S", "name": "绥江县" },
          { "firstName": "S", "name": "水富县" },
          { "firstName": "W", "name": "威信县" },
          { "firstName": "Y", "name": "盐津县" },
          { "firstName": "Y", "name": "永善县" },
          { "firstName": "Y", "name": "彝良县" },
          { "firstName": "Z", "name": "昭阳区" },
          { "firstName": "Z", "name": "镇雄县" }
        ]
      }
    ]
  },
  {
    "firstName": "Z",
    "name": "重庆",
    "areaList": [
      { "firstName": "B", "name": "北碚区" },
      { "firstName": "B", "name": "巴南区" },
      { "firstName": "B", "name": "璧山县" },
      { "firstName": "C", "name": "长寿区" },
      { "firstName": "C", "name": "城口县" },
      { "firstName": "D", "name": "大渡口区" },
      { "firstName": "D", "name": "大足县" },
      { "firstName": "D", "name": "垫江县" },
      { "firstName": "F", "name": "涪陵区" },
      { "firstName": "F", "name": "丰都县" },
      { "firstName": "F", "name": "奉节县" },
      { "firstName": "H", "name": "合川市" },
      { "firstName": "J", "name": "江北区" },
      { "firstName": "J", "name": "九龙坡区" },
      { "firstName": "J", "name": "江津市" },
      { "firstName": "K", "name": "开县" },
      { "firstName": "L", "name": "梁平县" },
      { "firstName": "N", "name": "南岸区" },
      { "firstName": "N", "name": "南川市" },
      { "firstName": "P", "name": "彭水苗族土家族自治县" },
      { "firstName": "Q", "name": "黔江区" },
      { "firstName": "Q", "name": "綦江县" },
      { "firstName": "R", "name": "荣昌县" },
      { "firstName": "S", "name": "沙坪坝区" },
      { "firstName": "S", "name": "双桥区" },
      { "firstName": "S", "name": "石柱土家族自治县" },
      { "firstName": "T", "name": "潼南县" },
      { "firstName": "T", "name": "铜梁县" },
      { "firstName": "W", "name": "万州区" },
      { "firstName": "W", "name": "万盛区" },
      { "firstName": "W", "name": "武隆县" },
      { "firstName": "W", "name": "巫山县" },
      { "firstName": "W", "name": "巫溪县" },
      { "firstName": "X", "name": "秀山土家族苗族自治县" },
      { "firstName": "Y", "name": "渝中区" },
      { "firstName": "Y", "name": "渝北区" },
      { "firstName": "Y", "name": "云阳县" },
      { "firstName": "Y", "name": "酉阳土家族苗族自治县" },
      { "firstName": "Y", "name": "永川市" },
      { "firstName": "Z", "name": "忠县" }
    ]
  },
  {
    "firstName": "Z",
    "name": "浙江省",
    "cityList": [
      {
        "firstName": "H",
        "name": "杭州市",
        "areaList": [
          { "firstName": "B", "name": "滨江区" },
          { "firstName": "C", "name": "淳安县" },
          { "firstName": "F", "name": "富阳市" },
          { "firstName": "G", "name": "拱墅区" },
          { "firstName": "J", "name": "江干区" },
          { "firstName": "J", "name": "建德市" },
          { "firstName": "L", "name": "临安市" },
          { "firstName": "S", "name": "上城区" },
          { "firstName": "T", "name": "桐庐县" },
          { "firstName": "X", "name": "下城区" },
          { "firstName": "X", "name": "西湖区" },
          { "firstName": "X", "name": "萧山区" },
          { "firstName": "Y", "name": "余杭区" }
        ]
      },
      {
        "firstName": "H",
        "name": "湖州市",
        "areaList": [
          { "firstName": "A", "name": "安吉县" },
          { "firstName": "C", "name": "长兴县" },
          { "firstName": "D", "name": "德清县" },
          { "firstName": "N", "name": "南浔区" },
          { "firstName": "W", "name": "吴兴区" }
        ]
      },
      {
        "firstName": "J",
        "name": "嘉兴市",
        "areaList": [
          { "firstName": "H", "name": "海盐县" },
          { "firstName": "H", "name": "海宁市" },
          { "firstName": "J", "name": "嘉善县" },
          { "firstName": "P", "name": "平湖市" },
          { "firstName": "T", "name": "桐乡市" },
          { "firstName": "X", "name": "秀城区" },
          { "firstName": "X", "name": "秀洲区" }
        ]
      },
      {
        "firstName": "J",
        "name": "金华市",
        "areaList": [
          { "firstName": "D", "name": "东阳市" },
          { "firstName": "J", "name": "金东区" },
          { "firstName": "L", "name": "兰溪市" },
          { "firstName": "M", "name": "婺城区" },
          { "firstName": "P", "name": "浦江县" },
          { "firstName": "P", "name": "磐安县" },
          { "firstName": "W", "name": "武义县" },
          { "firstName": "Y", "name": "义乌市" },
          { "firstName": "Y", "name": "永康市" }
        ]
      },
      {
        "firstName": "L",
        "name": "丽水市",
        "areaList": [
          { "firstName": "J", "name": "缙云县" },
          { "firstName": "J", "name": "景宁畲族自治县" },
          { "firstName": "L", "name": "莲都区" },
          { "firstName": "L", "name": "龙泉市" },
          { "firstName": "Q", "name": "青田县" },
          { "firstName": "Q", "name": "庆元县" },
          { "firstName": "S", "name": "遂昌县" },
          { "firstName": "S", "name": "松阳县" },
          { "firstName": "Y", "name": "云和县" }
        ]
      },
      {
        "firstName": "N",
        "name": "宁波市",
        "areaList": [
          { "firstName": "B", "name": "北仑区" },
          { "firstName": "C", "name": "慈溪市" },
          { "firstName": "F", "name": "奉化市" },
          { "firstName": "H", "name": "海曙区" },
          { "firstName": "J", "name": "江东区" },
          { "firstName": "J", "name": "江北区" },
          { "firstName": "N", "name": "宁海县" },
          { "firstName": "X", "name": "象山县" },
          { "firstName": "Y", "name": "鄞州区" },
          { "firstName": "Y", "name": "余姚市" },
          { "firstName": "Z", "name": "镇海区" }
        ]
      },
      {
        "firstName": "Q",
        "name": "衢州市",
        "areaList": [
          { "firstName": "C", "name": "常山县" },
          { "firstName": "J", "name": "江山市" },
          { "firstName": "K", "name": "柯城区" },
          { "firstName": "K", "name": "开化县" },
          { "firstName": "L", "name": "龙游县" },
          { "firstName": "Q", "name": "衢江区" }
        ]
      },
      {
        "firstName": "S",
        "name": "绍兴市",
        "areaList": [
          { "firstName": "C", "name": "嵊州市" },
          { "firstName": "S", "name": "绍兴县" },
          { "firstName": "S", "name": "上虞市" },
          { "firstName": "X", "name": "新昌县" },
          { "firstName": "Y", "name": "越城区" },
          { "firstName": "Z", "name": "诸暨市" }
        ]
      },
      {
        "firstName": "T",
        "name": "台州市",
        "areaList": [
          { "firstName": "H", "name": "黄岩区" },
          { "firstName": "J", "name": "椒江区" },
          { "firstName": "L", "name": "路桥区" },
          { "firstName": "L", "name": "临海市" },
          { "firstName": "S", "name": "三门县" },
          { "firstName": "T", "name": "天台县" },
          { "firstName": "W", "name": "温岭市" },
          { "firstName": "X", "name": "仙居县" },
          { "firstName": "Y", "name": "玉环县" }
        ]
      },
      {
        "firstName": "W",
        "name": "温州市",
        "areaList": [
          { "firstName": "C", "name": "苍南县" },
          { "firstName": "D", "name": "洞头县" },
          { "firstName": "L", "name": "鹿城区" },
          { "firstName": "L", "name": "龙湾区" },
          { "firstName": "L", "name": "乐清市" },
          { "firstName": "O", "name": "瓯海区" },
          { "firstName": "P", "name": "平阳县" },
          { "firstName": "R", "name": "瑞安市" },
          { "firstName": "T", "name": "泰顺县" },
          { "firstName": "W", "name": "文成县" },
          { "firstName": "Y", "name": "永嘉县" }
        ]
      },
      {
        "firstName": "Z",
        "name": "舟山市",
        "areaList": [
          { "firstName": "C", "name": "嵊泗县" },
          { "firstName": "D", "name": "定海区" },
          { "firstName": "D", "name": "岱山县" },
          { "firstName": "P", "name": "普陀区" }
        ]
      }
    ]
  }
];
			var p_index=-1;
			var c_index=-1;
			function show_province(){
				var html="";
				for(var i in cities){
					if(i>=1){
						if(cities[i].firstName!=cities[i-1].firstName){
							html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 30);">'
							+cities[i].firstName+'</div><div class="flex_center" style="margin-left: calc(var(--bili) * 20);" data-value="'
							+cities[i].name+'" onclick="chose_province(this)" data-index="'+i+'">'
							+cities[i].name+'</div></div>';
						}else{
							html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 70);" data-value="'
							+cities[i].name+'" onclick="chose_province(this)" data-index="'+i+'">'
							+cities[i].name+'</div></div>';
						}
					}else{
						html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 30);">'
						+cities[i].firstName+'</div><div class="flex_center" style="margin-left: calc(var(--bili) * 20);" data-value="'
						+cities[i].name+'" onclick="chose_province(this)" data-index="'+i+'">'
						+cities[i].name+'</div></div>';
					}
				}
				$("#cover_in").html(html);
				$("#main_body").addClass("body_fixed");
				$("#cover").css("display","");
				$(".cart_bottom").css("display","none");
			}
			function chose_province(item){
				$("#province").val($(item).attr("data-value"));
				p_index=parseInt($(item).attr("data-index"));
				$("#main_body").removeClass("body_fixed");
				$("#cover").css("display","none");
				$(".cart_bottom").css("display","");
			}
			function show_city(){
				if(p_index==-1){
					alert("请选择省份！");
				}else{
					var cityList=cities[p_index].cityList;
					$("#chose_title").text("选择城市");
					var html="";
					for(var i in cityList){
						if(i>=1){
							if(cities[i].firstName!=cities[i-1].firstName){
								html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 30);">'
								+cityList[i].firstName+'</div><div class="flex_center" style="margin-left: calc(var(--bili) * 20);" data-value="'
								+cityList[i].name+'" onclick="chose_city(this)" data-index="'+i+'">'
								+cityList[i].name+'</div></div>';
							}else{
								html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 70);" data-value="'
								+cityList[i].name+'" onclick="chose_city(this)" data-index="'+i+'">'
								+cityList[i].name+'</div></div>';
							}
						}else{
							html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 30);">'
							+cityList[i].firstName+'</div><div class="flex_center" style="margin-left: calc(var(--bili) * 20);" data-value="'
							+cityList[i].name+'" onclick="chose_city(this)" data-index="'+i+'">'
							+cityList[i].name+'</div></div>';
						}
					}
					$("#cover_in").html(html);
					$("#main_body").addClass("body_fixed");
					$("#cover").css("display","");
					$(".cart_bottom").css("display","none");
				}
			}
			function chose_city(item){
				$("#city").val($(item).attr("data-value"));
				c_index=parseInt($(item).attr("data-index"));
				$("#main_body").removeClass("body_fixed");
				$("#cover").css("display","none");
				$(".cart_bottom").css("display","");
			}
			function show_area(){
				if(c_index==-1){
					alert("请选择城市！");
				}else{
					var areaList=cities[p_index].cityList[c_index].areaList;
					$("#chose_title").text("选择区县");
					var html="";
					for(var i in areaList){
						if(i>=1){
							if(cities[i].firstName!=cities[i-1].firstName){
								html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 30);">'
								+areaList[i].firstName+'</div><div class="flex_center" style="margin-left: calc(var(--bili) * 20);" data-value="'
								+areaList[i].name+'" onclick="chose_area(this)" data-index="'+i+'">'
								+areaList[i].name+'</div></div>';
							}else{
								html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 70);" data-value="'
								+areaList[i].name+'" onclick="chose_area(this)" data-index="'+i+'">'
								+areaList[i].name+'</div></div>';
							}
						}else{
							html=html+'<div class="flex_row cover_tab"><div class="flex_center" style="margin-left: calc(var(--bili) * 30);">'
							+areaList[i].firstName+'</div><div class="flex_center" style="margin-left: calc(var(--bili) * 20);" data-value="'
							+areaList[i].name+'" onclick="chose_area(this)" data-index="'+i+'">'
							+areaList[i].name+'</div></div>';
						}
					}
					$("#cover_in").html(html);
					$("#main_body").addClass("body_fixed");
					$("#cover").css("display","");
					$(".cart_bottom").css("display","none");
				}
			}
			function chose_area(item){
				$("#area").val($(item).attr("data-value"));
				$("#main_body").removeClass("body_fixed");
				$("#cover").css("display","none");
				$(".cart_bottom").css("display","");
			}
		</script>
	</head>
	<body>
		<div id="cover" style="display:none;">
			<div class="flex_column cover_body">
				<div class="flex_center" style="width:calc(var(--bili) * 730);height:calc(var(--bili) * 100);">
					<div id="chose_title" style="font-size: calc(var(--bili) * 32);font-weight: bold;">
						选择省份
					</div>
					<div >
						<img src="../img/5家居家私/取消.png" class="cancel" onclick="cancel()">
					</div>
				</div>
				<div id="cover_in" class="">
					<div class="flex_row cover_tab">
						<div class="flex_center" style="margin-left: calc(var(--bili) * 30);">
							A
						</div>
						<div class="flex_center" style="margin-left: calc(var(--bili) * 20);">
							安徽
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div id="main_body" >
			<div class="flex_row" style="height: calc(var(--bili) * 90);align-items: center;background-color: white;">
				<img src="../img/0通用/logo@2x.png" class="logo">
				<a href="#"><img src="../img/0通用/我的(1)@2x.png" class="home_icon" style="margin-left:calc(var(--bili) * 259) ;"></a>
				<a href="#"><img src="../img/0通用/购物车(1)@2x.png" class="home_icon" style="margin-left:calc(var(--bili) * 45)"></a>
				<a href="#"><img src="../img/0通用/客服(1)@2x.png" class="home_icon" style="margin-left:calc(var(--bili) * 45)"></a>
			</div>
			<div class="flex_center evaluate_tab">
				<div class="flex_center return_icon">
					<img src="../img/13晒点/return.png" >
				</div>
				<div style="font-weight: bold;">
					添加收货地址
				</div>
				
			</div>
			<div class="message_blank">
				<div class="message_tab flex_center">
					<div class="message_contain" style="font-weight: bold;">
						收货人信息
					</div>
				</div>
				<div class="message_tab flex_center">
					<div class="message_contain flex_row" >
						<div class="flex_row" style="width: calc(var(--bili) * 130);">
							收货人名
						</div>
						<div class="flex_center">
							<input type="text" class="message_input" placeholder="请输入收货人姓名" name="" id="" value="" />
						</div>
					</div>
				</div>
				<div class="message_tab flex_center">
					<div class="message_contain flex_row" >
						<div class="flex_row" style="width: calc(var(--bili) * 130);">
							手机号码
						</div>
						<div class="flex_center">
							<input type="text" class="message_input" placeholder="请输入收货人手机号码" name="" id="" value="" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="message_blank" style="margin-top: calc(var(--bili) * 30);">
				<div class="message_tab flex_center">
					<div class="message_contain" style="font-weight: bold;">
						收货地址
					</div>
				</div>
				<div class="message_tab flex_center">
					<div class="message_contain flex_row" >
						<div class="flex_row" style="width: calc(var(--bili) * 1300);">
							省份
						</div>
						<div class="flex_center">
							<input type="text" class="message_input" placeholder="请选择省份" name="" id="province" value="" onfocus="show_province()" />
						</div>
					</div>
				</div>
				<div class="message_tab flex_center">
					<div class="message_contain flex_row" >
						<div class="flex_row" style="width: calc(var(--bili) * 130);">
							城市
						</div>
						<div class="flex_center">
							<input type="text" class="message_input" placeholder="请选择城市" name="" id="city" value="" onfocus="show_city()"/>
						</div>
					</div>
				</div>
				<div class="message_tab flex_center">
					<div class="message_contain flex_row" >
						<div class="flex_row" style="width: calc(var(--bili) * 130);">
							区县
						</div>
						<div class="flex_center">
							<input type="text" class="message_input" placeholder="请选择区县" name="" id="area" value="" onclick="show_area()"/>
						</div>
					</div>
				</div>
				<div class="message_tab flex_center">
					<div class="message_contain flex_row" >
						<div class="flex_row" style="width: calc(var(--bili) * 130);">
							详细地址
						</div>
						<div class="flex_center">
							<input type="text" class="message_input" placeholder="请填写街道、门牌号、小区等" name="" id="" value="" />
						</div>
					</div>
				</div>
			</div>
			<div class="flex_row">
				<div class="flex_row" style="margin: calc(var(--bili) * 50) calc(var(--bili) * 30);">
					<div class="flex_center">
						<img src="../img/14购物车/矩形25@2x.png" class="confirm">
					</div>
					<div class="flex_center" style="margin-left: calc(var(--bili) * 30);">
						设置为默认收货地址 
					</div>
				</div>
			</div>
			<div class="flex_center" style="width:calc(var(--bili) * 750);height:calc(var(--bili) * 120);">
				
			</div>
			<div class="flex_center cart_bottom" >
				添加新的收货地址
			</div>
		</div>
	</body>
</html>
