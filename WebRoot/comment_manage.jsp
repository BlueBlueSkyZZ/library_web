<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评论管理</title>
    
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
	<link rel="stylesheet" type="text/css" href="css/unslider.css">
	
	<style type="text/css">
		.banner { position: relative; overflow: auto; padding-left: 15%;border:2px solid;border-radius:25px;}
		.banner li { list-style: none; }
		.banner ul li { float: left; }
	
		.prev { padding-left: 8%;float: right;}
		.next {float: left;}
		
		
		#commentBox{
			border:2px solid;
			border-radius:10px;
			box-shadow: 3px 3px 1px #888888;
			height : 75%;
			width : 100%;
			padding-top : 20px;
			padding-left : 50px;
			font-size : 15px;
		}
		
		.myRow{
			margin-top:1%;
		}
		
		#comHistory{
			border:solid #000 1px;
			border-radius:10px;
			margin-top:20px;
			margin-left:20px;
			width:70%;
		}
		
		.comHistory{
			font-size:15px;
		}
		
		.aHis{
			float:right;
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span><span id="USER"></span><span class="caret"></span></a>
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
				<a href="comment_manage.action">
					<span class="glyphicon glyphicon-th"></span> 公众号管理 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse in" id="sub-item-1">
					<li>
						<a class="" href="#">
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
				<li class="active">公众号管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row" style="height:60px;">
			<div class="col-lg-12">
				<h2 class="page-header">评论管理</h2>
			</div>
		</div><!--/.row-->

		<div class="col-xs-12 col-sm-6 col-md-3 col-md-offset-1">
			<button type="button" class="btn btn-primary" id="passComment">通过审核</button>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-2">
			<button type="button" class="btn btn-warning" id="deleteComment">删除评论</button>
		</div>
		
		<div class="col-xs-12 col-sm-6 col-md-2 col-md-offset-1">
			<button type="button" class="btn btn-primary" id="addKeyword">添加关键词</button>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-2">
			<button type="button" class="btn btn-primary" id="auto_judge">自动审批</button>
		</div>		
				
			
		
		
		<div class="myRow col-sm-6">
			
				
			<div class="col-sm-10" id="commentBox">
				<div class="myRow col-sm-12 col-md-12">
					微信昵称：
					<span id="wename">无</span>
				</div>
				<div class="myRow col-sm-12 col-md-12">
					真实姓名：
					<span id="realname">无</span>
				</div>
				<div class="myRow col-sm-12 col-md-12">
					评论时间：
					<span id="time">无</span>
				</div>
				<div class="myRow col-sm-12 col-md-12">
					评论书名：
					<span id="bookname">无</span>
				</div>
				<div class="myRow col-sm-12 col-md-12">
					<span>评论内容：</span>
					<span>
						<p class="form-control" style="width:100%;height:250px;font-size:20px;color:black;" id="comment" >无</p> 
						
					</span>	
				</div>
				
			</div>
		</div><!-- row -->
		
		<div class="myRow col-sm-6">
			
			
			<div class="col-xs-4 col-xs-offset-2" id="comHistory">
				<div class="col-xs-12">
					<h3>最近五条</h3>
				</div>
			</div>
		</div><!-- row -->
		
		<!--弹窗-->
		<div class="modal" id="mymodal">
			<div class="modal-dialog modal-sm"><!--modal-lg-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">关键词</h4>
					</div>
					<div class="modal-body" style="text-align:center;">
						<textarea class="form-control" id="keyword"></textarea>
						

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
						<button type="button" class="btn btn-primary" onclick="saveButton()">保存</button>
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
	<script src="js/unslider.js"></script>
	
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
	
	var commentNum = 0;
	
	$(function(){
		$.ajax({    
				type:'post',        
				url:'/library_web/get_comment.action',    
				data:{	
				commentNum : commentNum		
            },   
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	$.each(eval("(" + data+ ")"), function (index, obj) {
				    var bookname = obj.bookname;
            		var comment = obj.comment;
            		var commentid = obj.commentid;
            		var realname = obj.realname;
            		var time = obj.time;
            		var weid = obj.weid;
            		var wename = obj.wename;
         			
         			updateComment(wename, realname, time, bookname, comment, commentid);
            		highlight("comment",keyword);

            		
				});
            },
            error:function(){
            	console.log("请求数据失败");
            	
            }    
        }); 
	});
	
	function updateComment(wename, realname, time, bookname, comment, commentid){
		$("#wename").html(wename);
		$("#realname").html(realname);
		$("#time").html(time);
		$("#bookname").html(bookname);
		$("#comment").html(comment);
		$("#comment").attr("commentid", commentid);
	}
	
	function passComment(){
		//进入下一条
		//commentNum++;
		var commentid = $("#comment").attr("commentid");
		$.ajax({    
				type:'post',        
				url:'/library_web/pass_comment.action',    
				data:{	
				commentNum : commentNum,
				commentid : commentid		
            },   
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	console.log("请求数据成功" +data);
            	$.each(eval("(" + data+ ")"), function (index, obj) {
				    var bookname = obj.bookname;
            		var comment = obj.comment;
            		var commentid = obj.commentid;
            		var realname = obj.realname;
            		var time = obj.time;
            		var weid = obj.weid;
            		var wename = obj.wename;
         			if(bookname == ""){
         				alert("审核完毕，没有更多了");
         				location.reload();
         			}else{
         				updateComment(wename, realname, time, bookname, comment, commentid);
         				highlight("comment",keyword);
         			}
            		
				});
            },
            error:function(){
            	console.log("请求数据失败");
            	
            }    
        }); 
	}
	
	$("#passComment").click(function(){
		passComment();
	});
	</script>

	<script type="text/javascript">
		$("#addKeyword").click(function(){
			console.log(keyword);
			$("#mymodal").modal("toggle");
			//keyword = nowKeyWord;
		});
	
	</script>
	
	<script> 
		var keyword = "";
		//高亮关键词
		function highlight(idVal, keyword) { 
			var textbox = document.getElementById(idVal); 
			if ("" == keyword) return; 
			//获取所有文字内容 
			var temp = textbox.innerHTML; 
			console.log(temp); 
			var htmlReg = new RegExp("\<.*?\>", "i"); 
			var arr = new Array(); 

			//替换HTML标签 
			for (var i = 0; true; i++) { 
				//匹配html标签 
				var tag = htmlReg.exec(temp); 
				if (tag) { 
					arr[i] = tag; 
				} else { 
					break; 
				} 
				temp = temp.replace(tag, "{[(" + i + ")]}"); 
			} 


			// 讲关键词拆分并入数组 
			words = decodeURIComponent(keyword.replace(/\,/g, ' ')).split(/\s+/); 

			//替换关键字 
			for (w = 0; w < words.length; w++) { 
				// 匹配关键词，保留关键词中可以出现的特殊字符 
				var r = new RegExp("(" + words[w].replace(/[(){}.+*?^$|\\\[\]]/g, "\\$&") + ")", "ig"); 
				temp = temp.replace(r, "<b style='color:Red;'>$1</b>"); 
			} 

			//恢复HTML标签 
			for (var i = 0; i < arr.length; i++) { 
				temp = temp.replace("{[(" + i + ")]}", arr[i]); 
			} 
			textbox.innerHTML = temp; 
		} 
		
		
		//$("#keyword").html(keyword);
		keyword = getCookie("keyword");
		document.getElementById("keyword").value = keyword;
		
		function saveButton(){
			keyword = document.getElementById("keyword").value;
			setCookie("keyword", keyword, 7);
			console.log(keyword);
			location.reload();
		}
			
		function getCookie(c_name){
			if (document.cookie.length>0){
				c_start=document.cookie.indexOf(c_name + "=");
				if (c_start!=-1){
					c_start=c_start + c_name.length+1;
					c_end=document.cookie.indexOf(";",c_start);
				if (c_end==-1) 
					c_end=document.cookie.length;
				return unescape(document.cookie.substring(c_start,c_end));//解码
				}
			}
			return "";
		}
		
		function setCookie(c_name, value, expiredays){
			var exdate=new Date();
			exdate.setDate(exdate.getDate() + expiredays);
			document.cookie=c_name+ "=" + escape(value) + ((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
		}

	</script> 
	
	<script>
		$(function(){
			//自动审核
			var keyword = $("#keyword").val();
			$("#auto_judge").click(function(){
				console.log("点击了" + keyword);
				$.ajax({    
					type:'post',        
					url:'/library_web/auto_judge.action',    
					data:{	
						keyword:keyword	
		            },   
		            cache:false,    
		            //dataType:'json',    
		            success:function(data){ 
		            	alert("成功过滤了" + data + "条评论");
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
			//获取已经评论的信息
			$.ajax({    
				type:'post',        
				url:'/library_web/get_history_comment.action',    
				data:{	
				},   
				cache:false,    
				//dataType:'json',    
				success:function(data){ 
					console.log(data);
		            $.each(eval("(" + data+ ")"), function (index, obj) {
		            	addHistoryDom((index+1) + "." + obj.comment, obj.commentid);
		            });
				},
				error:function(){
					console.log("请求数据失败");
				}    
			}); 
			
			function addHistoryDom(comment, commentId){
				var spanCom = $("<span></span>");
				spanCom.addClass("comHistory");
				spanCom.html(comment);
				var hr = $("<hr>");
				//var br = $("<br>");
				var a = $("<a></a>");
				a.html("重新审批");
				a.attr("href", "javascript:void(0)");
				a.addClass("aHis");
				a.attr("commentid", commentId);
				$("#comHistory").append(spanCom);
				//$("#comHistory").append(br);
				$("#comHistory").append(a);
				$("#comHistory").append(hr);
				
			}
			
			$("#comHistory").on("mousedown", ".aHis", function(event){
				
				var commentid = $(this).attr("commentid");
			
				if(event.which == "1"){
					$.ajax({    
						type:'post',        
						url:'/library_web/return_comment.action',    
						data:{	
							commentid : commentid
						},   
						cache:false,    
						//dataType:'json',    
						success:function(data){ 
							location.reload();
				            
						},
						error:function(){
							console.log("请求数据失败");
						}    
					}); 
					console.log($(this).attr("commentid"));
				}
				
			});
		});
	</script>
  </body>
</html>
