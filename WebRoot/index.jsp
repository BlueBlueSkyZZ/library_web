<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib  uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书馆后台管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">

	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/searchStyle.css" media="screen" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="css/pullToRefresh.css">
	<style type="text/css">
	.myBooks { 
		/*background-color: #e8e8ff;*/
		text-align: center;
		margin: 0 auto;
		margin-top: 12%;
		width: 80%;
	}
	
	.myBookImg {
		width: 50%;
		height: 50%;
		margin: 5%;
	}
	
	.myBookName {
		font-size: 22px;
		color: #808080;
		margin-top: 1%;
	}
	
	.myBookAuthor {
		font-size: 16px;
		color: #808080;
		margin-top: 2%;
	}
	
	.myBookPublisher {
		font-size: 16px;
		color: #808080;
		margin-top: 2%;
	}
	
	#wrapper {
		height: 450px;
		width: 95%;
		border: solid 1px #8080c0;
		border-radius: 25px;
		box-shadow: 10px 10px 5px #888888;
		margin: 0 auto;
		margin-bottom: 20px;
	}
	
	.underlineInput {
		border-top-width: 0px;
		border-right-width: 0px;
		border-left-width: 0px;
		border-bottom: #787878 1px solid;
		background-color: #ffffff;
		width: 60%;
	}
	
	td {
		padding-top: 3%;
	}
	
	tr {
		margin-top: 2%;
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
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
			<li class="active"><a href="#"><span class="glyphicon glyphicon-dashboard"></span> 书籍管理</a></li>
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

			<li><a href="managers.action"><span class="glyphicon glyphicon-list-alt"></span> 管理员列表</a></li>
			<li role="presentation" class="divider"></li>
			<li><a href="about.action"><span class="glyphicon glyphicon-hand-right"></span> About us</a></li>
		</ul>
		
	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">书籍管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">书籍管理</h1>
			</div>
		</div><!--/.row-->

		<div class="row">
			<div class="col-xs-12 col-sm-4" id="add">
				<div class="panel panel-blue panel-widget">
					<div class="row no-padding">
						<a href="javascript:void(0)">
							<div class="col-sm-4 widget-left">
								<em class="glyphicon glyphicon-plus glyphicon-l"></em>
							</div>
						</a>
						<div class="col-sm-8 widget-right">
							<div class="large">添加</div>
							<div class="text-muted">点击添加图书</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-4">

				<section class="webdesigntuts-workshop" style="margin-top:6%;">
					<form action="" method="">		    
						<input type="search" placeholder="搜索你想查询的图书">		    	
						<button>
							<em class="glyphicon glyphicon-search"></em>
						</button>
					</form>
				</section>
				
			</div>

			<div class="col-xs-12 col-sm-4">
				<div class="btn-group" style="margin-top:6%;">
					<button type="button" class="btn btn-info btn-lg dropdown-toggle" 
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="selectCate">
						<span id="selectedCate1">类别</span>
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="javascript:void(0)" class="category1">文学</a></li>
						<li><a href="javascript:void(0)" class="category1">传记</a></li>
						<li><a href="javascript:void(0)" class="category1">历史</a></li>
						<li><a href="javascript:void(0)" class="category1">哲学</a></li>
						<li><a href="javascript:void(0)" class="category1">儿童</a></li>
						<li><a href="javascript:void(0)" class="category1">小说</a></li>
						<li><a href="javascript:void(0)" class="category1">心理</a></li>
						<li><a href="javascript:void(0)" class="category1">社会</a></li>
						<li><a href="javascript:void(0)" class="category1">科技</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="javascript:void(0)" class="category1">全部</a></li>
					</ul>
				</div>
				
				
			</div>

			<div class="col-xs-9 col-sm-9 col-xs-offset-1 col-sm-offset-1">
				<button type="button" class="btn btn-primary"  onclick="upexcel.click()">导入图书</button>
				<form action="#" enctype="multipart/form-data" method="post" id="uploadExcel" style="visibility: hidden; position: absolute;">
					<input type="file" id="upexcel" name="excelFile" ><!--onchange="uploadFile()"-->
				</form>
			</div>
			<div class="col-xs-2 col-sm-2">
				<button type="button" class="btn btn-info" onclick="outputExcel.click()">导出图书</button>
			</div>
				
			<form id="searchform" action="output_excel.action" method="post" style="display:none;">   
					<input type="submit" value="导出" id="outputExcel"/>  
			</form>
		</div><!--row-->

		<div class="row" id="wrapper" >
			<ul>

			</ul>
		</div><!--row-->
		

		<!--弹窗-->
		<div class="modal" id="mymodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">添加书籍</h4>
					</div>
					<div class="modal-body" >
						<table width="100%">
							<tr>
								<td style="text-align:center">
									<img src="http://apis.juhe.cn/goodbook/img/93b469cf22ef86b40ce84a6c63b95e82.jpg" height="100px" id="bookImg">
									<br><br>
									<button type="button" class="btn btn-default" onclick="image.click()">选择图片</button>
									<form action="#" enctype="multipart/form-data" method="post" id="userForm">
										
										<input type="file" id="image" name="image" style="visibility: hidden; position: absolute;">
										
									</form><!--
										<input type="submit" value="提交表单" >style="visibility: hidden; position: absolute;" -->

									<div class="progress" style="width:70%;margin:0 auto;display:none;">
										<div class="progress-bar progress-bar-striped active" role="progressbar" id="progress"
										aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width:30%;min-width:1em;">
											<span id="progressNum">0%</span><!--class="sr-only"-->
										</div>
									</div>
								</td>

								<td>
									<label>摘要：</label>
									<textarea></textarea>
								</td>
							</tr>
							<tr>

								<td >
									<label>图书名：</label>
									<input type="text" class="underlineInput"><br>
									<label>作者名：</label>
									<input type="text" class="underlineInput"><br>
									<label>出版社：</label>
									<input type="text" class="underlineInput"><br>
									<label>图书分类:</label>
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="category">
											<span id="selectedCate2">类别</span>
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="javascript:void(0)" class="category2">文学</a></li>
											<li><a href="javascript:void(0)" class="category2">传记</a></li>
											<li><a href="javascript:void(0)" class="category2">历史</a></li>
											<li><a href="javascript:void(0)" class="category2">哲学</a></li>
											<li><a href="javascript:void(0)" class="category2">儿童</a></li>
											<li><a href="javascript:void(0)" class="category2">小说</a></li>
											<li><a href="javascript:void(0)" class="category2">心理</a></li>
											<li><a href="javascript:void(0)" class="category2">社会</a></li>
											<li><a href="javascript:void(0)" class="category2">科技</a></li>
										</ul>
									</div>
									
								</td>
								
								<td>
									<label>导读：</label>
									<textarea></textarea>
								</td>
							</tr>	

							<tr>
								<td >
									<label>ISBN号：</label>
									<input type="text" class="underlineInput"><br>
									<label>图书版本：</label>
									<input type="text" class="underlineInput"><br>
									<label>图书价格：</label>
									<input type="text" class="underlineInput"><br>
									<label>图书库存：</label>
									<input type="text" class="underlineInput">
								</td>

								<td>
									<label>目录：</label>
									<textarea></textarea>
								</td>
							</tr>

						</table>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveButton">保存</button>
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

	<script type="text/javascript">
		$(function(){
			//添加图书
			$("#add").click(function(){
				$("#mymodal").modal("toggle");	
			});



			//选择类别
			$("#dropdown-menu li a").click(function(){
				console.log($(this).html());
				$("#selectCate").html($(this).html());
			});
			
		});
	</script>

	<script type="text/javascript" src="js/pullToRefresh.js"></script>
	<script type="text/javascript" src="js/iscroll.js"></script>
	<script>
		//插件代码
		refresher.init({
			id:"wrapper",
			pullDownAction:Refresh,                                                            
			pullUpAction:Load 																			
		});
		Refresh();	//初始化加载	
		var generatedCount = 0;																			
		function Refresh() {																
			setTimeout(function () {	
				var el, li, i;																		
				el =document.querySelector("#wrapper ul");									
				el.innerHTML='';																
				for (i=0; i<8; i++) {																	 
					var outside = document.createElement('div');
					outside.setAttribute("class", "col-xs-12 col-sm-6 col-lg-3");
					var myBooks = document.createElement('div');
					myBooks.setAttribute("class", "myBooks");
					var aLink = document.createElement('a');
					aLink.innerHTML = "<img src='http://apis.juhe.cn/goodbook/img/93b469cf22ef86b40ce84a6c63b95e82.jpg' alt='图书图片' class='myBookImg'>";
					var myBookName = document.createElement("div");
					myBookName.setAttribute("class", "myBookName");
					myBookName.innerHTML = "微观历史" + i;
					var myBookAuthor = document.createElement("div");
					myBookAuthor.setAttribute("class", "myBookAuthor");
					myBookAuthor.innerHTML = "陆仁贾";
					var myBookPublisher = document.createElement("div");
					myBookPublisher.setAttribute("class", "myBookPublisher");
					myBookPublisher.innerHTML = "机械工业出版社" ;
					var nbsp = document.createElement("div");
					nbsp.setAttribute("style", "height:5px;");
					nbsp.innerHTML = "&nbsp;";

					outside.appendChild(myBooks);
					myBooks.appendChild(aLink);
					myBooks.appendChild(myBookName);
					myBooks.appendChild(myBookAuthor);
					myBooks.appendChild(myBookPublisher);
					myBooks.appendChild(nbsp);

					el.append(outside);											
				}																					
				//刷新
				wrapper.refresh();
			}, 1000);

		}

		function Load() {
			setTimeout(function () {
				var el, li, i;
				el =document.querySelector("#wrapper ul");

				// var delete_end = document.getElementById("page_end");
				// delete_end.remove(delete_end);

				for (i=0; i<4; i++) {
					var outside = document.createElement('div');
					outside.setAttribute("class", "col-xs-12 col-sm-6 col-lg-3");
					var myBooks = document.createElement('div');
					myBooks.setAttribute("class", "myBooks");
					var aLink = document.createElement('a');
					aLink.innerHTML = "<img src='http://apis.juhe.cn/goodbook/img/93b469cf22ef86b40ce84a6c63b95e82.jpg' alt='图书图片' class='myBookImg'>";
					var myBookName = document.createElement("div");
					myBookName.setAttribute("class", "myBookName");
					myBookName.innerHTML = "微观历史新增" + i;
					var myBookAuthor = document.createElement("div");
					myBookAuthor.setAttribute("class", "myBookAuthor");
					myBookAuthor.innerHTML = "陆仁贾";
					var myBookPublisher = document.createElement("div");
					myBookPublisher.setAttribute("class", "myBookPublisher");
					myBookPublisher.innerHTML = "机械工业出版社" ;
					var nbsp = document.createElement("div");
					nbsp.setAttribute("style", "height:5px;");
					nbsp.innerHTML = "&nbsp;";

					outside.appendChild(myBooks);
					myBooks.appendChild(aLink);
					myBooks.appendChild(myBookName);
					myBooks.appendChild(myBookAuthor);
					myBooks.appendChild(nbsp);

					//刷新
					el.append(outside);
				}


				wrapper.refresh();
				
			}, 1000);	
		}
	</script>

	
	<script src="js/jquery.form.js"></script>
	<script type="text/javascript">
		//添加菜单
		//选择类别
		$(".category1").click(function(){
			console.log($(this).html());
			$("#selectedCate1").html($(this).html());
		});
		
		$(".category2").click(function(){
			console.log($(this).html());
			$("#selectedCate2").html($(this).html());
		});

		//保存图书
		$("#saveButton").click(function(){

		});

		//添加图书图片
		$("#image").bind("change", function(){
			console.log("状态改变了");
			//获取图片的路径，该路径不是图片在本地的路径
			var objUrl = getObjectURL(this.files[0]) ; 
			if (objUrl) {
				//将图片路径存入src中，显示出图片
				$("#bookImg").attr("src", objUrl) ; 
				console.log(objUrl);
				console.log(this.name);
				ajaxSubmitForm();
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
		
		//ajax提交
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
	
	<script>
		//上传excel
		//添加图书图片
		$("#upexcel").bind("change", function(){
			console.log("状态改变了");
			
			$("#uploadExcel").ajaxSubmit({
				type:'post',  
	    		url:'/library_web/upload_excel.action',
	    		success:function(data){  
	    			console.log(data);  
	    		},  
	    		error:function(XmlHttpRequest,textStatus,errorThrown){  
	    			console.log(XmlHttpRequest);  
	    			console.log(textStatus);  
	    			console.log(errorThrown);  
	    		}
			});

		});
	</script>

  </body>
</html>
