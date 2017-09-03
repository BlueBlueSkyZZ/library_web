<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员列表</title>
    
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
		table.dataintable {
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
		
		input {
		border-top-width: 0px;
		border-right-width: 0px;
		border-left-width: 0px;
		border-bottom: #787878 1px solid;
		background-color: #ffffff;
		width: 60%;
	}
	</style>
  </head>
  
  <body>
  <div>
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

			<li  class="active"><a href="#"><span class="glyphicon glyphicon-list-alt"></span> 管理员列表</a></li>
			<li role="presentation" class="divider"></li>
			<li><a href="about.action"><span class="glyphicon glyphicon-hand-right"></span> About us</a></li>
		</ul>
		
	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">管理员列表</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">管理员列表</h2>
			</div>
		</div><!--/.row-->
		


		<div class="row col-sm-4">
			<div class="panel panel-blue panel-widget" id="add">
				<div class="row no-padding">
					<a href="javascript:void(0)">
						<div class="col-sm-4 widget-left">
							<em class="glyphicon glyphicon-plus glyphicon-l"></em>
						</div>
					</a>
					<div class="col-sm-8 widget-right">
						<div class="large">添加</div>
						<div class="text-muted">点击添加管理员</div>
					</div>
				</div>
			</div>
		</div>



		<table class="dataintable">
			
			<!-- <tr>
				<th colspan="8">
					管理员列表			
				</th>
			</tr> -->
		
			<tr>
				<th>序号</th>
				<th>账户</th>
				<th>姓名</th>
				<th>级别</th>
				<th>添加管理权限</th>
				<th>数据管理权限</th>
				<th>扫描权限</th>
				<th>操作</th>
			</tr>
			
			
			
		</table>

		<!--弹窗-->
		<div class="modal" id="mymodal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">添加管理员信息</h4>
					</div>
					<div class="modal-body" >
						<span style="margin-top:50px;">
							<label>账户：</label><input placeholder="请输入数字" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/ id="newAccount"><br>
						</span>
						<span style="margin-top:10px;">
							<label>密码：</label><input type="text" id="newPassword" /><br>	
						</span>
						<span style="margin-top:10px;">
							<label>姓名：</label><input type="text" id="newName" /><br>	
						</span>
						<span style="margin-top:10px;">
							<label>地址：</label><input type="text" id="newAddress" /><br>	
						</span>
						<span style="margin-top:10px;">
							<label>电话：</label><input type="text" id="newTel" /><br>	
						</span>
						<span style="margin-top:10px;">
							<label>级别：</label>
							<span class="dropdown">
								<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
									<span class="level" id="newLevel">初级管理员</span>
									<span class="caret"></span>
								</button>

								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li class="level">
										<a href="javascript:void(0)">
											<span class="level">初级管理员</span>
										</a>
									</li>
									
									<li class="level">
										<a href="javascript:void(0)">
											<span class="level">中级管理员</span>
										</a>
									</li>
									
									<li class="level">
										<a href="javascript:void(0)">
											<span class="level">高级管理员</span>
										</a>
									</li>
								</ul>
							</span>
						</span>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveButton">保存</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

		<div class="modal" id="mymodal2">
			<div id="myAlert" class="alert alert-warning">
				<!-- <a href="#" class="close" data-dismiss="alert">&times;</a> -->
				<strong>警告！</strong>只有高级管理员才有此权限
			</div>
		</div>

		<div class="modal" id="mymodal3">
			<div id="myAlert" class="alert alert-danger">
				<!-- <a href="#" class="close" data-dismiss="alert">&times;</a> -->
				<strong>警告！</strong>网络连接异常
			</div>
		</div>

		<div class="modal" id="mymodal4">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">修改管理员信息</h4>
					</div>
					<div class="modal-body" >
						<span style="margin-top:50px;">
							<label>账户：</label><input placeholder="请输入数字" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/ id="nowAccount"><br>
						</span>
						<span style="margin-top:10px;">
							<label>密码：</label><input type="text" id="nowPassword" /><br>	
						</span>
						<span style="margin-top:10px;">
							<label>姓名：</label><input type="text" id="nowName" /><br>	
						</span>
						<span style="margin-top:10px;">
							<label>地址：</label><input type="text" id="nowAddress" /><br>	
						</span>
						<span style="margin-top:10px;">
							<label>电话：</label><input type="text" id="nowTel" /><br>	
						</span>
						<span style="margin-top:10px;">
							<label>级别：</label>
							<span class="dropdown">
								<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
									<span class="level" id="nowLevel">初级管理员</span>
									<span class="caret"></span>
								</button>

								<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
									<li class="level">
										<a href="javascript:void(0)">
											<span class="level">初级管理员</span>
										</a>
									</li>
									
									<li class="level">
										<a href="javascript:void(0)">
											<span class="level">中级管理员</span>
										</a>
									</li>
									
									<li class="level">
										<a href="javascript:void(0)">
											<span class="level">高级管理员</span>
										</a>
									</li>
								</ul>
							</span>
						</span>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveButton4">修改</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
	</div><!--/.row-->
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
		if ($(window).width() > 768) $('#sidebar-collapse').collapse('show');
	});
	$(window).on('resize', function () {
		if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide');
	});
</script>	

<script type="text/javascript">
	$(function(){
		$("#add").click(function(){
			var level = "高级管理员";

			if(level != "高级管理员"){
				$("#mymodal2").modal("toggle");
			}else{
				$("#mymodal").modal("toggle");	
			}
		});

		$(".level span").click(function(){
			var levelDom = $(this).html();
			//console.log(levelDom);
			$("#dropdownMenu1 .level").html(levelDom);
		});
	});
</script>

<script type="text/javascript">
	$(function(){
		$(".close").click(function(){
			$("#myAlert").alert();
		});
	});
</script>

<script type="text/javascript">
	/*$(function(){
		$("#saveButton").click(function(){
			var account = $("#newAccount").val();
			var name = $("#newName").val();
			var level = $("#dropdownMenu1 .level").html();
			console.log(account + "\n" + name + "\n" + level);
			var aj = $.ajax( {    
				url:'productManager_reverseUpdate',
				data:{    
					account : account,    
					name : name,    
					level : level,    
				},    
				type:'post',    
				cache:false,    
				//dataType:'json',    
				success:function(data) {    
					if(data.msg =="true" ){    
						alert("修改成功！");    
						window.location.reload();    
					}else{    
						console("接收到其他数据" + data);
						//用户已经存在什么的    
					}    
				},    
				error : function() {    
					$("#mymodal3").modal("toggle");
				}    
			});
			
		});
	});*/

</script>

<script>
	$(function(){
		$.ajax({    
				type:'post',        
				url:'/library_web/get_manager_info.action',    
				data:{			
            },   
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	console.log("请求数据成功");
            	$.each(eval("(" + data+ ")"), function (index, obj) {
				    var id = obj.id;
            		var name = obj.name;
            		var rank = obj.rank;
            		var manage_admin = obj.manage_admin;
            		var manage_data = obj.manage_data;
            		var manage_scan = obj.manage_scan;
            		var tel = obj.tel;
            		var address = obj.address;
            		var account = obj.account;
         			var password = obj.password;
         			
            		console.log(name);
            		addManagerDom(id, account, name, rank, manage_admin, manage_data, manage_scan);
				});
            },
            error:function(){
            	console.log("请求数据失败");
            	
            }    
        }); 
	});


	function addManagerDom(id, account, name, rank, manage_admin, manage_data, manage_scan){
		//生成节点
		var tr = $("<tr></tr>");
		var tdId = $("<td></td>");
		tdId.addClass("tdId");
		tdId.html(id);
		var tdAccount = $("<td></td>");
		tdAccount.addClass("tdAccount");
		tdAccount.html(account);
		var tdName = $("<td></td>");
		tdName.addClass("tdName");
		tdName.html(name);
		var tdRank = $("<td></td>");
		tdRank.addClass("tdRank");
		tdRank.html(rank);
		
		var tdManage_admin = $("<td></td>");
		tdManage_admin.addClass("tdManage_admin");
		var em_admin = $("<em></em>");
		if(manage_admin == "Y"){
			em_admin.addClass("glyphicon glyphicon-ok");
			em_admin.attr("style", "color:green;");
		}else{
			em_admin.addClass("glyphicon glyphicon-remove");
			em_admin.attr("style", "color:red;");
		}
		var tdManage_data = $("<td></td>");
		tdManage_data.addClass("tdManage_data");
		var em_data = $("<em></em>");
		if(manage_data == "Y"){
			em_data.addClass("glyphicon glyphicon-ok");
			em_data.attr("style", "color:green;");
		}else{
			em_data.addClass("glyphicon glyphicon-remove");
			em_data.attr("style", "color:red;");
		}
		var tdManage_scan = $("<td></td>");
		tdManage_scan.addClass("tdManage_scan");
		var em_scan = $("<em></em>");
		if(manage_scan == "Y"){
			em_scan.addClass("glyphicon glyphicon-ok");
			em_scan.attr("style", "color:green;");
		}else{
			em_scan.addClass("glyphicon glyphicon-remove");
			em_scan.attr("style", "color:red;");
		}
		var tdAction = $("<td></td>");
		var aChange = $("<a></a>");
		aChange.attr("href","javascript:void(0);");
		aChange.addClass("aChange");
		aChange.html("修改");
		var aDelete = $("<a></a>");
		aDelete.attr("href","javascript:void(0);");
		aDelete.addClass("aDelete");
		aDelete.html("删除");
		
		
		//加入网页
		tr.append(tdId);
		tr.append(tdAccount);
		tr.append(tdName);
		tr.append(tdRank);
		tr.append(tdManage_admin);
		tdManage_admin.append(em_admin);
		tr.append(tdManage_data);
		tdManage_data.append(em_data);
		tr.append(tdManage_scan);
		tdManage_scan.append(em_scan);
		tr.append(tdAction);
		tdAction.append(aChange);
		tdAction.append("&nbsp;&nbsp;&nbsp;");
		tdAction.append(aDelete);
		
		$(".dataintable").append(tr);
	}
	
	$(function(){
		//修改管理员
		$(".dataintable").on("click", ".aChange", function(){
			var parent = $(this).parent().parent();
			var id = parent.find(".tdId").html();
			console.log(id);
			//console.log($(this).parent().parent().html());
			nowChangeId = id;
			$.ajax({    
				type:'post',        
				url:'/library_web/get_single_manager.action',    
				data:{	
					id : id
            	},   
            	cache:false,    
            	//dataType:'json',    
            	success:function(data){ 
            		console.log("请求数据成功" + data);
	            	$.each(eval("(" + data+ ")"), function (index, obj) {
					    var id = obj.id;
	            		var name = obj.name;
	            		var rank = obj.rank;
	            		var manage_admin = obj.manage_admin;
	            		var manage_data = obj.manage_data;
	            		var manage_scan = obj.manage_scan;
	            		var tel = obj.tel;
	            		var address = obj.address;
	            		var account = obj.account;
	         			var password = obj.password;
	         			
	         			$("#nowAccount").val(account);
	         			$("#nowPassword").val(password);
	         			$("#nowName").val(name);
	         			$("#nowAddress").val(address);
	         			$("#nowTel").val(tel);
	         			$("#nowLevel").html(rank);	
					});
					$("#mymodal4").modal("toggle");
	            },
	            error:function(){
	            	console.log("请求数据失败");
	            	
	            }    
        	}); 
			
		});
		
		//删除
		$(".dataintable").on("click", ".aDelete", function(){
			var parent = $(this).parent().parent();
			var id = parent.find(".tdId").html();
			console.log(id);
			
			nowDeleteId = id;
			$.ajax({    
				type:'post',        
				url:'/library_web/delete_manager.action',    
				data:{	
					id : id
            	},   
            	cache:false,    
            	//dataType:'json',    
            	success:function(data){ 
            		console.log("请求数据成功" + data);
	            	location.reload();
	            },
	            error:function(){
	            	console.log("请求数据失败");
	            	
	            }    
        	}); 
			
		});
	});
	
	
</script>

<script>
	$(function(){
		//新增管理员信息
		$("#saveButton").click(function(){
			var newAccount = $("#newAccount").val();
			var newPassword = $("#newPassword").val();
			var newName = $("#newName").val();
			var newAddress = $("#newAddress").val();
			var newTel = $("#newTel").val();
			var newLevel = $("#newLevel").html();
			
			$.ajax({    
				type:'post',        
				url:'/library_web/add_manager.action',    
				data:{	
				account : newAccount,
				password : newPassword,
				name : newName,
				address : newAddress,
				tel : newTel,
				rank : newLevel	
            },   
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	console.log("响应成功");
            	console.log(data);
            	location.reload();
	         },
	         error:function(){
	         	console.log("请求数据失败");
	         	$("#mymodal3").modal("toggle");
	         }    
	      });
		});
		
		//修改管理员信息
		$("#saveButton4").click(function(){
			var nowAccount = $("#nowAccount").val();
			var nowPassword = $("#nowPassword").val();
			var nowName = $("#nowName").val();
			var nowAddress = $("#nowAddress").val();
			var nowTel = $("#nowTel").val();
			var nowLevel = $("#nowLevel").html();
			//nowChangeId全局变量，表示现在修改的Id
			console.log(nowChangeId);
			$.ajax({    
				type:'post',        
				url:'/library_web/update_manager.action',    
				data:{	
				id : nowChangeId,
				account : nowAccount,
				password : nowPassword,
				name : nowName,
				address : nowAddress,
				tel : nowTel,
				rank : nowLevel	
            },   
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	console.log("响应成功");
            	console.log(data);
            	location.reload();
	         },
	         error:function(){
	         	console.log("请求数据失败");
	         	$("#mymodal3").modal("toggle");
	         }    
	      }); 
			
		});
	});
	
</script>
  </body>
</html>
