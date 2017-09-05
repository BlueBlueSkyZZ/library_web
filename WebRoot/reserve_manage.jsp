<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>预订管理</title>
    
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
	
	<style>
		#reserveTable{
			margin-left:2%;
			width:95%;
			
		
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
			<li><a href="users.action"><span class="glyphicon glyphicon-user"></span> 人员管理</a></li>
			
			<li class="parent active">
				<a href="reserve_manage.action">
					<span class="glyphicon glyphicon-th"></span> 公众号管理 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse in" id="sub-item-1">
					<li>
						<a class="" href="comment_manage.action">
							<span class="glyphicon glyphicon-share-alt"></span> 评论管理
						</a>
					</li>
					<li >
						<a class="" href="#">
							<span class="glyphicon glyphicon-share-alt"></span> 预订管理
						</a>
					</li>
					<li class="active">
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
				<li class="active">公众号管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">预订管理</h2>
			</div>
		</div><!--/.row-->
        
     	<div class="row table-responsive">
     		<table class="table table-hover" id="reserveTable">
			  
			  <thead>
			    <tr>
			      <th>序号</th>
			      <th>微信号</th>
			      <th>用户姓名</th>
			      <th>预订书号—书名</th>
			      <th>剩余量</th>
			      <th>预订时间</th>
			    </tr>
			  </thead>
			  
			</table>
     	</div>
		
		
		<!--弹窗-->
		<div class="modal" id="mymodal">
			<div class="modal-dialog modal-sm" style="width:30%;"><!--modal-lg-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">预订信息</h4>
					</div>
					<div class="modal-body" >
						
						<div>
							<img src="http://apis.juhe.cn/goodbook/img/901bb60c71d93d389aa5a1a0e3e329ac.jpg" class="img-thumbnail img-responsive"  id="bookImg">	
						</div>

						<table class="userTable" >
							<tr>
								<td class="tag">微信编号：</td>
								<td class="detail" id="weid"></td>
							</tr>
							<tr>
								<td class="tag">图书编号：</td>
								<td class="detail" id="bookno"></td>
							</tr>
							<tr>
								<td class="tag">图书名称：</td>
								<td class="detail" id="bookname"></td>
							</tr>
							<tr>
								<td class="tag">剩余数量：</td>
								<td class="detail" id="leftnum"></td>
							</tr>
							<tr>
								<td class="tag">预订时间：</td>
								<td class="detail" id="reservetime"></td>
							</tr>
							
						</table>



					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="remindButton">发送提醒</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
			
		
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
		//获取订单号
		$.ajax({    
			type:'post',        
			url:'/library_web/get_order.action',    
			data:{	
			},   
			cache:false,    
			//dataType:'json',    
			success:function(data){ 
				//console.log(data);
				$.each(eval("(" + data+ ")"), function (index, obj) {
					var bookimg = obj.bookimg;
					var bookname = obj.bookname;
					var bookno = obj.bookno;
					var leftnum = obj.leftnum;
					var realname = obj.realname;
					var reservetime = obj.reservetime;
					var weid = obj.weid;
					var wename = obj.wename;
					
					addReserveDom(index+1, weid, wename, bookno, bookname, leftnum, reservetime, bookimg);
				});
			},
			error:function(){
				console.log("请求数据失败");
			}    
		});
		
		//添加节点
		function addReserveDom(index, weid, wename, bookno, bookname, leftnum, reservetime, bookimg){
			var tr = $("<tr></tr>");
			tr.addClass("tr_reserve");
			tr.attr("bookno", bookno);
			tr.attr("bookimg", bookimg);
			var td_index = $("<td></td>");
			td_index.addClass("td_index");
			td_index.html(index);
			var td_weid = $("<td></td>");
			td_weid.addClass("td_weid");
			td_weid.html(weid);
			var td_name = $("<td></td>");
			td_name.addClass("td_name");
			td_name.html(wename);
			var td_bookno_book = $("<td></td>");
			td_bookno_book.addClass("td_bookno_book");
			td_bookno_book.html(bookno + "-" + bookname);
			var td_leftnum = $("<td></td>");
			td_leftnum.addClass("td_leftnum");
			td_leftnum.html(leftnum);
			var td_reservetime = $("<td></td>");
			td_reservetime.addClass("td_reservetime");
			td_reservetime.html(reservetime);
		
			var table = $("#reserveTable");
			table.append(tr);
			tr.append(td_index);
			tr.append(td_weid);
			tr.append(td_name);
			tr.append(td_bookno_book);
			tr.append(td_leftnum);
			tr.append(td_reservetime);
		} 
		var clickCount = 0;
		$("#reserveTable").on("mousedown", ".tr_reserve", function(event){
			
			clickCount++;
			if(event.which == "1"){
				if(clickCount%2 == 0){
					var bookno = $(this).attr("bookno");
					var bookimg = $(this).attr("bookimg");
					var weid = $(this).children(".td_weid").html();
					var bookname = $(this).children(".td_bookno_book").html();
					var leftnum = $(this).children(".td_leftnum").html();
					var reservetime = $(this).children(".td_reservetime").html();
					console.log("双击了");
					updateDom(bookimg, weid, bookno, bookname, leftnum, reservetime);
					$("#mymodal").modal("toggle");
				}
				
			}
		});
		
		function updateDom(bookimg, weid, bookno, bookname, leftnum, reservetime){
			$("#bookImg").attr("src", bookimg);
			$("#weid").html(weid);
			$("#bookno").html(bookno);
			$("#bookname").html(bookname);
			$("#leftnum").html(leftnum);
			$("#reservetime").html(reservetime);
		}
		
		$("#remindButton").click(function(){
			var bookno = $("#bookno").html();
			var weid = $("#weid").html();
			$.ajax({    
				type:'post',        
				url:'/library_web/send_remind.action',    
				data:{	
					bookno : bookno,
					weid : weid
				},   
				cache:false,    
				//dataType:'json',    
				success:function(data){ 
					console.log(data);
					/*$.each(eval("(" + data+ ")"), function (index, obj) {
						var bookimg = obj.bookimg;
						var bookname = obj.bookname;
						var bookno = obj.bookno;
						var leftnum = obj.leftnum;
						var realname = obj.realname;
						var reservetime = obj.reservetime;
						var weid = obj.weid;
						var wename = obj.wename;
						
						addReserveDom(index+1, weid, wename, bookno, bookname, leftnum, reservetime, bookimg);
					});*/
				},
				error:function(){
					console.log("请求数据失败");
				}  
			});
		});  
	});
	</script>
  </body>
</html>
