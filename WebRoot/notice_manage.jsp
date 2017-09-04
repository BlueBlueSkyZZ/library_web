<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>公告管理</title>
    
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
		.underlineInput {
			border-top-width: 0px;
			border-right-width: 0px;
			border-left-width: 0px;
			border-bottom: #787878 1px solid;
			background-color: #F1F4F7;
			width: 100%;
		}
		
		.nounderline{
			border-top-width: 0px;
			border-right-width: 0px;
			border-left-width: 0px;
			border-bottom-width: 0px;
			background-color: #F1F4F7;
		}
		
		#noticeImg{
			height:200px;
			width:470px; 
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
				<a href="notice_manage.action">
					<span class="glyphicon glyphicon-th"></span> 公众号管理 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse in" id="sub-item-1">
					<li>
						<a class="" href="comment_manage.action">
							<span class="glyphicon glyphicon-share-alt"></span> 评论管理
						</a>
					</li>
					<li >
						<a class="" href="reserve_manage.action">
							<span class="glyphicon glyphicon-share-alt"></span> 预订管理
						</a>
					</li>
					<li class="active">
						<a class="" href="#">
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
		<div class="row" style="height:15px;">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">公众号管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-3">
				<h2 class="page-header">公告管理</h2>
			</div>
			
		</div><!--/.row-->
        
     	<div class="row">
     		
     		<div class="col-sm-12">
     			<button type="button" class="btn btn-primary" id="announcement" style="margin-left:5%;">
     				<em class="glyphicon glyphicon-send">&nbsp;</em>发布
     			</button>
     		</div>
     	
     		<div class="col-sm-6">
     			<div style="font-size:20px;" class="col-sm-12">
	     			<span>标题：</span>
	     			<input type="text" value="闭馆通知" class="underlineInput" id="title"/>
	     				
	     		</div>
	     		<div class="col-sm-12">
	     			<span>发布时间：</span>
	     			<input type="text" value="2017-07-01" class="underlineInput" id="time"/>
	     				
	     		</div>
	     		<div class="col-sm-12" style="margin-top:5px;">
	     			<span>通知类型：</span>
	     			<span class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle" 
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="selectCate">
							<span id="selectedCate1">图书馆安排</span>
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0)" class="category">图书馆安排</a></li>
							<li><a href="javascript:void(0)" class="category">借书须知</a></li>
							<li><a href="javascript:void(0)" class="category">好书推荐</a></li>
						</ul>
		     		</span>
		     			
		     		<div class="col-sm-12">
		     			<span>公告内容：</span>
		     			<span style="font-size:16px;">
		     				
			     			<textarea rows="10" cols="61" style="background-color: #F1F4F7;" id="content"></textarea>
			     			<!--  <input type="text" value="清明放假" class="nounderline" style="width:500px;height:100px;"/>-->
			     		</span>
		     		</div>
	     		</div>
     		</div>	
     	
     		<div class="col-sm-6" style="margin-top:11%;">
     			<button type="button" class="btn btn-primary" onclick="image.click()" style="margin-left:34%;">替换图片</button>
	     		<div class="col-sm-12">
	     			<img id="noticeImg" src="http://118.89.198.254/library/image/announcement/1.jpg">
					<form action="#" enctype="multipart/form-data" method="post" id="userForm">
						<input type="file" id="image" name="image" style="visibility: hidden; position: absolute;">
					</form>
	     		</div>
     		</div>
     			
     		
     	
		
		<div class="col-lg-12" style="margin-top:10px;margin-left:45%;">	
				<ul class="pagination" style="margin:0 auto;">
					<li class="active"><a href="javascript:void(0);" class="noticeId">1</a></li>
					<li><a href="javascript:void(0);" class="noticeId">2</a></li>
					<li><a href="javascript:void(0);" class="noticeId">3</a></li>			    
				</ul>				
		</div>
		
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
		//选择类别
		$(".category").click(function(){
			console.log($(this).html());
			$("#selectedCate1").html($(this).html());
		});
	</script>
	<script src="js/jquery.form.js"></script>
	<script>
		
		var noticeId = "1";
		$(function(){
			notice_get();
			
        });
        	
        function notice_get(){
        	$.ajax({    
				type:'post',        
				url:'/library_web/get_notice.action',    
				data:{	
					noticeId : noticeId		
           		 },   
	            cache:false,    
	            //dataType:'json',    
	            success:function(data){ 
            	console.log("请求数据成功" +data);
            	$.each(eval("(" + data+ ")"), function (index, obj) {
					    var anno_id = obj.anno_id;
	            		var category = obj.category;
	            		var content = obj.content;
	            		var img = obj.img;
	            		var time = obj.time;
	            		var title = obj.title;
	            		
	         			//var reg = "^(/library).*$";
	         			img = img.replace("/", 'http://118.89.198.254/'); 
	         			
	         			$("#title").val(title);
	         			$("#time").val(time);
	         			$("#selectedCate1").html(category);
	         			$("#noticeImg").attr("src", img);
	         			$("#content").val(content);
					});
		         },
		         error:function(){
		            console.log("请求数据失败");
		         }    
			}); 
        }
        
		
		
		$(".noticeId").click(function(){
			noticeId = $(this).html();
			$(this).parent().siblings().removeClass("active");
			$(this).parent().addClass("active");
			notice_get();
		});	
			
			
		$("#announcement").click(function(){
			var title = $("#title").val();
			var category = $("#selectedCate1").html();
			var time = $("#time").val();
			var content = $("#content").val();
				
			var reg = /[^\\\/]*[\\\/]+/g; //匹配文件的名称和后缀的正则表达式  
			var image;
			console.log($("#image").val());
			if($.trim($("#image").val()) == ''){
				image = noticeId + ".jpg";
			}else{
				image = $("#image").val().replace(reg, '');
			}
			
      		  
      		var noticeImg = "/library/image/announcement/" + image;
      		console.log(title);
      		console.log(category);
      		console.log(time);
      		console.log(content);
      		console.log(noticeImg);
      		console.log(noticeId);
      		update_notice(title, category, time, content, noticeImg, noticeId);
		});		
		
		//更新通知
		function update_notice(title, category, time, content, noticeImg, noticeId){
			$.ajax({    
				type:'post',        
				url:'/library_web/update_notice.action',    
				data:{	
					title : title,
					category : category,
					time : time,
					content : content,
					img : noticeImg,
					noticeId : noticeId		
           		 },   
	            cache:false,    
	            //dataType:'json',    
	            success:function(data){ 
            		console.log("请求数据成功" +data);
		         },
		         error:function(){
		            console.log("请求数据失败");
		         }    
			}); 
		}	
	
		//添加图书图片
		$("#image").bind("change", function(){
			console.log("状态改变了");
			//获取图片的路径，该路径不是图片在本地的路径
			var objUrl = getObjectURL(this.files[0]) ; 
			if (objUrl) {
				//将图片路径存入src中，显示出图片
				$("#noticeImg").attr("src", objUrl) ; 
				console.log(objUrl);
				console.log(this.name);
				//ajaxSubmitForm();
			}

		});

		//建立一个可存取到该file的url
		function getObjectURL(file) {
			var url = null ;
			// basic
			if (window.createObjectURL!=undefined) { 
				url = window.createObjectURL(file) ;
				// mozilla(firefox)
			} else if (window.URL!=undefined) { 
				url = window.URL.createObjectURL(file) ;
				// webkit or chrome
			} else if (window.webkitURL!=undefined) { 
				url = window.webkitURL.createObjectURL(file) ;
			}
			return url ;
		}
		
		//ajax提交图片
		function ajaxSubmitForm() {
			
	    	$("#userForm").ajaxSubmit({  
	    		type:'post',  
	    		url:'/library_web/img_upload.action',  
	    		xhr: function(){
	    			//进度条
			        myXhr = $.ajaxSettings.xhr();
			        if(myXhr.upload){
			        	myXhr.upload.addEventListener('progress',function(e) {
			            	if (e.lengthComputable) {
				              	var percent = Math.floor(e.loaded/e.total*100);
				              	if(percent <= 100) {
				              		$(".progress").attr("style","width:70%;margin:0 auto;");
				                	$("#progress").attr("style", "width:" + percent + "%");
				                	$("#progressNum").html(percent+"%");
				                	console.log(percent);
				              	}
				              	if(percent >= 100) {
				                	console.log("上传完成");
				              	}
				            }
			        	}, false);
			    	}
			        return myXhr;
			    },
	    		success:function(data){  
	    			console.log(data);  
	    		},  
	    		error:function(XmlHttpRequest,textStatus,errorThrown){  
	    			console.log(XmlHttpRequest);  
	    			console.log(textStatus);  
	    			console.log(errorThrown);  
	    		}  
	    	});  
			//返回false阻止表单再次提交
	    	return false; 
	    }
	</script>
  </body>
</html>
