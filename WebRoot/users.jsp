<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">

	<style type="text/css">
		.myUser{
			text-align: center;
			margin-top: 2%;
			display: table-cell;
   			vertical-align: middle;
		}

		.myUserImg {
			width:40%;
			height:40%;
			margin:0 auto;
			padding-top:7%;
		}

		.myUserName{
			font-size: 16px;
			color: #808080;
			margin-top: 2%;
		}
		
		.myUserWeId{
			display:none;
		}
		
		.myUserPhone{
			display:none;
		}
		
		.myRealName{
			display:none;
		}

		#userImg{
			width:150px;
			height:150px;
			margin:0 auto;
			margin-bottom: 5%;
			
		}

		.userTable{
			margin:0 auto;
			
		}

		.detail {
			font-size: 16px;
			color: #808080;
		}

		.tag {
			text-align: left;
		}
		
		.borrowBook{
			height:160px;
			width:100px;
			margin-top:15%;
		}
		
		/*table{
			width:100%;
			text-align:center;
		}*/
		
		table.dataintable{
			border: 1px solid #888888;
			border-collapse: collapse;
			font-family: Arial,Helvetica,sans-serif;
			margin-top: 10px;
			width: 100%;
		}
		table.dataintable th {
			background-color: #D5D5D5;/*cccccc*/
			border: 1px solid #888888;
			padding: 5px 15px 5px 5px;
			text-align: center;
			vertical-align: baseline;
		}
		table.dataintable td {
			background-color: #EFEFEF;
			border: 1px solid #AAAAAA;
			padding: 5px 15px 5px 5px;
			text-align: center;
			vertical-align: text-top;
		}
	</style>

  </head>
  
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>超新星智能图书馆</span>后台管理系统</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span><span id="USER"></span> <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="index.action"><span class="glyphicon glyphicon-dashboard"></span> 书籍管理</a></li>
			<li class="active"><a href="users.action"><span class="glyphicon glyphicon-user"></span> 人员管理</a></li>
			
			<li class="parent ">
				<a href="comment_manage.action">
					<span class="glyphicon glyphicon-th"></span> 公众号管理 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li>
						<a class="" href="comment_manage.action">
							<span class="glyphicon glyphicon-share-alt"></span> 评论管理
						</a>
					</li>
					<li>
						<a class="" href="reserve_manage.action">
							<span class="glyphicon glyphicon-share-alt"></span> 预订管理
						</a>
					</li>
					<li>
						<a class="" href="notice_manage.action">
							<span class="glyphicon glyphicon-share-alt"></span> 公告管理
						</a>
					</li>
				</ul>
			</li>

			<li><a href="managers.action"><span class="glyphicon glyphicon-list-alt"></span> 管理员列表</a></li>
			<li role="presentation" class="divider"></li>
			<li><a href="about.action"><span class="glyphicon glyphicon-hand-right"></span> About us</a></li>
		</ul>
		
	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">人员管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">人员管理</h2>
			</div>
		</div><!--/.row-->

		<div class="row col-lg-6">
			<span style="font-size:25px;">
				在店人数
			</span>
		</div>
		<div class="row col-lg-6">
			<span style="font-size:25px;">
				借阅人数
			</span>
		</div>
		
		<div class="row col-sm-12 col-lg-6">
			<div id="people" style="width: 100%;height:50%;margin-left:auto;margin-right:auto;"></div>
		</div>

		<div class="row col-sm-12 col-lg-6">
			<div id="borrowPeople" style="width:90%;height:45%;margin-left:auto;margin-right:auto;"></div>
		</div>
		
		<div class="row col-lg-12">
			<span style="font-size:25px;">
				注册用户
			</span>
		</div>
		
		
		<div class="row" id="userDiv">


		</div>
		
		<!--弹窗-->
		<div class="modal" id="mymodal">
			<div class="modal-dialog modal-sm"><!--modal-lg-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">用户信息</h4>
					</div>
					<div class="modal-body" >
						
						<div id="userImg">
							<img src="http://wx.qlogo.cn/mmopen/6klL4b65U1MPibPtbQ0N4nPwj5u6Q2cicibb1FnXcNTm2yEuWj6icy8wb4OzL4xbXSyA6NSop5g8StTqwaqtmwxYHGeGrVPZNXf6/0" class="img-circle img-responsive">	
						</div>

						<table class="userTable" >
							<tr>
								<td class="tag">微信昵称：</td>
								<td class="detail" id="nickname"></td>
							</tr>
							<tr>
								<td class="tag">身份证号：</td>
								<td class="detail" id="idCard"></td>
							</tr>
							<tr>
								<td class="tag">真实姓名：</td>
								<td class="detail" id="realName"></td>
							</tr>
							<tr>
								<td class="tag">联系方式：</td>
								<td class="detail" id="tel"></td>
							</tr>
						</table>



					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<!-- <button type="button" class="btn btn-primary" id="saveButton">保存</button> -->
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		<!--弹窗-->
		<div class="modal" id="mymodal2">
			<div class="modal-dialog modal-lg"><!--modal-lg-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">借阅信息</h4>
					</div>
					<div class="modal-body" style="text-align:center;" id="borrow">
						
						

					</div>
					<div class="modal-footer">
						<!-- <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-top:10px;">关闭</button> -->
						<!-- <button type="button" class="btn btn-primary" id="saveButton">保存</button> -->
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
	</div>	<!--/.main-->

</div>	<!--/.main-->

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>

<script>
		$(function(){
			if(sessionStorage.username == null){
				location.href = "login.action";
			}else{
				var userName = sessionStorage.username;
				$("#USER").html(userName);
			}
			
		});
</script>

<script>
	$('#calendar').datepicker({
	});

	!function ($) {
		$(document).on("click","ul.nav li.parent > a > span.icon", function(){          
			$(this).find('em:first').toggleClass("glyphicon-minus");      
		}); 
		$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
	}(window.jQuery);

	$(window).on('resize', function () {
		if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
	})
	$(window).on('resize', function () {
		if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
	})
</script>	

<script>
	$(function(){
		$.ajax({    
				type:'post',        
				url:'/library_web/get_user_info.action',    
				data:{			
            },   
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	console.log("请求数据成功");
            	$.each(eval("(" + data+ ")"), function (index, obj) {
				    var headimgurl = obj.headimgurl;
            		var idCard = obj.idCard;
            		var nickname = obj.nickname;
            		var openid = obj.openid;
            		var realName = obj.realName;
            		var tel = obj.tel;
         			
            		console.log(nickname);
            		addUserDom(headimgurl, nickname, idCard, realName, tel, openid);
				});
            },
            error:function(){
            	console.log("请求数据失败");
            	
            }    
        }); 
	});
	
	function addUserDom(headimgurl, nickname, idCard, realName, tel, openid){
		//节点属性
		var outDom = $("<div></div>");
		outDom.addClass("col-xs-12 col-sm-6 col-lg-3");
		var myUser = $("<div></div>");
		myUser.addClass("myUser");
		myUser.attr("weid", openid);
		//myUser.attr("click", toggleFun);
		var a = $("<a></a>");
		a.attr("href", "javascript:void(0)");
		var myUserImg = $("<div></div>");
		myUserImg.addClass("myUserImg");
		var img = $("<img />");
		img.addClass("img-circle img-responsive");
		img.attr("src", headimgurl);
		var myUserName = $("<div></div>");
		myUserName.addClass("myUserName");
		myUserName.text(nickname);
		//隐藏属性
		//这里偷懒一下，原weid改为idcard
		var myUserWeId = $("<div></div>");
		myUserWeId.addClass("myUserWeId");
		myUserWeId.text(idCard);
		
		var myUserPhone = $("<div></div>");
		myUserPhone.addClass("myUserPhone");
		myUserPhone.text(tel);
		var myRealName = $("<div></div>");
		myRealName.addClass("myRealName");
		myRealName.text(realName);
	
		//加入网页
		var dom = $("#userDiv");
		dom.append(outDom);
		outDom.append(myUser);
		myUser.append(a);
		a.append(myUserImg);
		a.append(myUserName);
		myUserImg.append(img);
		
		myUser.append(myUserWeId);
		myUser.append(myUserPhone);
		myUser.append(myRealName);
		
	}
	
	//弹窗事件父节点监听事件,解决ajax新增节点事件失效问题
	$(function(){
		$("#userDiv").on("mousedown", ".myUser", function(event){
			if(event.which == "1"){
				$("#userImg").find("img").attr("src", $(this).find("img").attr("src"));
				$("#nickname").html($(this).find(".myUserName").html());
				$("#idCard").html($(this).find(".myUserWeId").html());//偷懒一下。。
				$("#realName").html($(this).find(".myRealName").html());
				$("#tel").html($(this).find(".myUserPhone").html());
				
				
				console.log($(this).find(".myUserName").html());
				
				$("#mymodal").modal("toggle");
			}else if(event.which == "2"){
				
				var weid = $(this).attr("weid");
				console.log(weid);	
				$("#borrow").html("");
				changeBorrowDom(weid);
				$("#mymodal2").modal("toggle");
				
			}
			
		});
	});
		
	function changeBorrowDom(weid){
		$.ajax({    
			type:'post',        
			url:'/library_web/get_all_borrow.action',    
			data:{
				weid : weid					
		    },   
		    cache:false,               
			success:function(data){ 
				console.log("请求数据成功" + data);
				$.each(eval("(" + data+ ")"), function (index, obj) {
 					var bookImg = obj.bookImg;
 					var bookName = obj.bookName;
 					var borrowTime = obj.borrowTime;
 					var returnTime = obj.returnTime;
 					if($.trim(returnTime) == ''){
						returnTime = "<strong style='color:green'>借阅中</strong>";				
 					}
 					addBookDom(bookImg, bookName, borrowTime, returnTime);
 					
				});
				if($.trim($("#borrow").html()) == ''){
					$("#borrow").html("暂无借阅信息");
				}
			},
			error:function(){
				console.log("请求数据失败");
		            	
			}    
		}); 
	}
	
	function addBookDom(bookImg, bookName, borrowTime, returnTime){
		var outside = $("<div></div>");
		outside.addClass("col-xs-12 col-sm-6 col-md-3");
		var borrowBookDom = $("<img />");
		borrowBookDom.attr("src", bookImg);
		borrowBookDom.addClass("borrowBook");
		
		var bookNameDom = $("<div></div>");
		bookNameDom.html(bookName);
		var borrowTimeDom = $("<div></div>");
		borrowTimeDom.html(borrowTime);
		var returnTimeDom = $("<div></div>");
		returnTimeDom.html(returnTime);
		
		var box = $("#borrow");
		box.append(outside);
		outside.append(borrowBookDom);
		outside.append(bookNameDom);
		outside.append(borrowTimeDom);
		outside.append(returnTimeDom);
	}
</script>


<script type="text/javascript" src="https://cdn.bootcss.com/echarts/3.6.2/echarts.js"></script>
<script type="text/javascript">
	var myChart1 = echarts.init(document.getElementById('people'));

	
	// 显示标题，图例和空的坐标轴
	myChart1.setOption({

		title: {
			text: 'People in shop'
		},
		
		tooltip : {
			trigger: 'axis'
		},  
		 
		xAxis: {
			data: []
		},
		yAxis: {},
		series: [{
			type: 'line',
			data:[],
			markPoint: {
				data: [
				{type: 'max', name: '最大值'},
				{type: 'min', name: '最小值'}
				]
			},
			markLine: {
				smooth: true,
				effect: {
					show: true
				},
				distance: 10,
				label: {
					normal: {
						position: 'middle'
					}
				},
				symbol: ['none', 'none'],
				data: []
			}
		}]
	});

	//自适应
	window.onresize = myChart1.resize; 
	// 异步加载数据
	$(function(){
		myChart1.showLoading();
		//定时获取数据
		setInterval(function(){
			console.log("定时触发了");
			var d = new Date();
			var currentTime = d.toLocaleTimeString()
			console.log(currentTime);
			$.ajax({    
				type:'post',        
				url:'/web03/servlet/EnterNumChartServlet',    
				data:{
					num : 12,
					type:"Acc"
            },   //参数，num请求数量，type请求类型acc即时数据
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	console.log("请求数据成功");
            	addAjaxData(data,currentTime);
            	myChart1.hideLoading();//有可能存在问题
            },
            error:function(){
            	console.log("请求数据失败");
            	addSimuData(currentTime);
            	myChart1.hideLoading();//有可能存在问题
            }    
        }); 
		}, 3000);
		
	});

	var timeArr = new Array();
	var timeLength = 6;
	for(var i = 0; i < timeLength; i++){
		timeArr[i] = "00:00:00";
	} 
	function addAjaxData(data,currentTime){
		//动态存储时间
		for(i = timeLength-2; i >= 0; i--){
			timeArr[i+1] = timeArr[i];
		}
		timeArr[0] = currentTime;
		// 填入数据
		myChart1.setOption({
			xAxis: {
				data: [
				timeArr[5], timeArr[4], timeArr[3], timeArr[2], timeArr[1], timeArr[0]
				]
			},
			series: [{
            	// 根据名字对应到相应的系列
            	name: '人数',
            	data: [ 
            	simuPeople[5], simuPeople[4], simuPeople[3], simuPeople[2], simuPeople[1], simuPeople[0]
            	],
            	itemStyle: {
            		normal: {
            			label: {
            				show:true,
            				position: 'bottom',
            				textStyle: {
            					color: '#333'
            				},
            				formatter: function(params) {
            					if(params.value){
            						return params.value; 
            					}else{
            						return '';
            					}
            				}
            			}
            		}
            	}
            }]
        });
	}

	var simuPeople = new Array(50, 51, 51, 49, 49, 50);
	var trend = new Array("-1", "0", "+2", "0", "-1");
	function addSimuData(currentTime){
    	//模拟数据形成
    	var temp = simuPeople[5];
    	for(i = timeLength-2; i >= 0; i--){
    		simuPeople[i+1] = simuPeople[i];
    	}
    	simuPeople[0] = temp;

    	//动态存储时间
    	for(i = timeLength-2; i >= 0; i--){
    		timeArr[i+1] = timeArr[i];
    	}
    	timeArr[0] = currentTime;
    	// 填入数据
    	myChart1.setOption({
    		xAxis: {
    			data:[ 
    			timeArr[5], timeArr[4], timeArr[3], timeArr[2], timeArr[1], timeArr[0]
    			]
    		},
    		series: [{
            	// 根据名字对应到相应的系列
            	name: '人数',
            	data: [ 
            	simuPeople[5], simuPeople[4], simuPeople[3], simuPeople[2], simuPeople[1], simuPeople[0]
            	],
            	itemStyle: {
            		normal: {
            			label: {
            				show:true,
            				position: 'bottom',
            				textStyle: {
            					color: '#333'
            				},
            				formatter: function(params) {
            					if(params.value){
            						return params.value; 
            					}else{
            						return '';
            					}
            				}
            			}
            		}
            	}
            }]
        });
    }

</script>

<script type="text/javascript">
	var myChart2 = echarts.init(document.getElementById('borrowPeople'));
	
	option = {
	    title: {
	        text: 'Borrowed Number'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:[ '借阅人数']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    toolbox: {
	        feature: {
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        data: ['2017/08/30', '2017/08/31', '2017/09/01', '2017/09/02', '2017/09/03', '2017/09/04', '2017/09/05']
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [
	       
	        {
	            name:'借阅人数',
	            type:'line',
	            step: 'middle',
	            data:[7, 5, 15, 12, 8, 6, 7],
	            markPoint: {
					data: [
					{type: 'max', name: '最大值'},
					{type: 'min', name: '最小值'}
					]
				},
	            color : "#87CEEB"
	        }
	    ]
	};
	
	// 显示标题，图例和空的坐标轴
	myChart2.setOption(option);

	//自适应
	window.onresize = myChart2.resize; 
	
	// 异步加载数据
	$(function(){
		myChart2.showLoading();
		//var count = 0;
			$.ajax({    
				type:'post',        
				url:'/library_web/get_borrow_people',    
				data:{
					
            },   
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	console.log("请求数据成功" + data);
            	var date = new Array();
            	var num = new Array();
            	var json = eval("(" + data+ ")");
            	
            	addData(json[0].date, json[0].num);
            	myChart2.hideLoading();//有可能存在问题
            },
            error:function(){
            	console.log("请求数据失败");
            	
            	myChart2.hideLoading();//有可能存在问题
            }    
        }); 
	});
	
	function addData(date, num){
	console.log(date);
	console.log(num);
		myChart2.setOption({
			xAxis: {
		        type: 'category',
		        data: date
		    },
			series: [
		       	{
		            data:num
		        }
		    ]
		});
	}
</script>

  </body>
</html>
