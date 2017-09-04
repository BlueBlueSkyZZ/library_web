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
		width: 90%;
	}
	
	.myBookImg {
		width: 60%;
		height: 30%;
		margin: 5%;
	}
	
	.myBookName {
		font-size: 8px;
		color: #808080;
		margin-top: 1%;
	}
	
	.myBookAuthor {
		font-size: 6px;
		color: #808080;
		margin-top: 2%;
	}
	
	.myBookPublisher {
		font-size: 6px;
		color: #808080;
		margin-top: 2%;
	}
	
	#wrapper {
		height: 450px;
		width: 75%;
		border: solid 1px #8080c0;
		border-radius: 25px;
		box-shadow: 3px 3px 1px #888888;
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
	
	.hot_category td{
		padding-top: 1%;
		width:200px;
	}
	
	.hot_category td span{
		margin-left:3%;
	}
	
	.hot_book td{
		padding-top: 1%;
		width:200px;
	}
	
	.hot_book td span{
		margin-left:3%;
	}
	.rank{  
		display:inline-block;
		padding:1px 0;
		color:#fff;
		width:14px;
		line-height:100%;
		font-size:12px;
		text-align:center;
		background-color:#8EB9F5;
	}
	
	.rank_cate{
	
	}
	
	.hotNum{
		margin-left:50px;
	}	
	
	.rank1{
		background-color:#F54545;
	}
	
	.rank2{
		background-color:#FF8547;
	}
	
	.rank3{
		background-color:#FFAC38;
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
						<div class="col-sm-8 widget-right" style="height:10%;">
							<div class="large">添加</div>
							<div class="text-muted">点击添加图书</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-4">

				<section class="webdesigntuts-workshop" style="margin-top:6%;">  
					<input type="search" placeholder="搜索你想查询的图书" id="keyBox">		    	
					<button id="search">
						<em class="glyphicon glyphicon-search"></em>
					</button>	
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

			<div class="col-xs-8 col-sm-8 col-xs-8-offset-1 col-sm-offset-1">
				<button type="button" class="btn btn-primary pull-right"  onclick="upexcel.click()">导入图书</button>
				<form action="#" enctype="multipart/form-data" method="post" id="uploadExcel" style="visibility: hidden; position: absolute;">
					<input type="file" id="upexcel" name="excelFile" ><!--onchange="uploadFile()"-->
				</form>
			</div>
			<div class="col-xs-3 col-sm-3">
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
		
		<div class="row">
			<div class="col-xs-12" style="margin-top:0%;margin-left:77%;">
				<h4 style="font-weight:bold;">搜索类别热度</h4>
				<table class="hot_category">
					
				</table>
			</div>
			
			<div class="col-xs-12" style="margin-top:5%;margin-left:77%;">
				<h4 style="font-weight:bold;">搜索书籍热度</h4>
				<table class="hot_book">
					
					
				</table>
			</div>
		</div><!-- row -->
		
		
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
									<textarea id="newAbstract" class="form-control" rows="2"></textarea>
								</td>
							</tr>
							<tr>

								<td >
									<label>图书名：</label>
									<input type="text" class="underlineInput" id="newBookName"><br>
									<label>作者名：</label>
									<input type="text" class="underlineInput" id="newAuthor"><br>
									<label>出版社：</label>
									<input type="text" class="underlineInput" id="newPublisher"><br>
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
									<textarea id="newGuide" class="form-control" rows="2"></textarea>
								</td>
							</tr>	

							<tr>
								<td >
									<label>ISBN号：</label>
									<input type="text" class="underlineInput" id="newISBN"><br>
									<label>图书版本：</label>
									<input type="text" class="underlineInput" id="newVersion"><br>
									<label>图书价格：</label>
									<input type="text" class="underlineInput" id="newPrice"><br>
									<label>图书库存：</label>
									<input type="text" class="underlineInput" id="newLeftNum">
								</td>

								<td>
									<label>目录：</label>
									<textarea id="newOutline" class="form-control" rows="2"></textarea>
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
		
		<div class="modal" id="mymodal2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">书籍详情</h4>
					</div>
					<div class="modal-body" >
						<table width="100%">
							<tr>
								<td style="text-align:center">
									<img src="http://apis.juhe.cn/goodbook/img/93b469cf22ef86b40ce84a6c63b95e82.jpg" height="100px" id="nowBookImg">
									<br><br>
									
								</td>

								<td>
									<label>摘要：</label>
									<textarea id="nowAbstract" class="form-control" rows="2"></textarea>
								</td>
							</tr>
							<tr>

								<td >
									<label>图书名：</label>
									<input type="text" class="underlineInput" id="nowBookName"><br>
									<label>作者名：</label>
									<input type="text" class="underlineInput" id="nowAuthor"><br>
									<label>出版社：</label>
									<input type="text" class="underlineInput" id="nowPublisher"><br>
									<label>图书分类:</label>
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="nowCategory">
											<span id="selectedCate3">类别</span>
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="javascript:void(0)" class="category3">文学</a></li>
											<li><a href="javascript:void(0)" class="category3">传记</a></li>
											<li><a href="javascript:void(0)" class="category3">历史</a></li>
											<li><a href="javascript:void(0)" class="category3">哲学</a></li>
											<li><a href="javascript:void(0)" class="category3">儿童</a></li>
											<li><a href="javascript:void(0)" class="category3">小说</a></li>
											<li><a href="javascript:void(0)" class="category3">心理</a></li>
											<li><a href="javascript:void(0)" class="category3">社会</a></li>
											<li><a href="javascript:void(0)" class="category3">科技</a></li>
										</ul>
									</div>
									
								</td>
								
								<td>
									<label>导读：</label>
									<textarea id="nowGuide" class="form-control" rows="2"></textarea>
								</td>
							</tr>	

							<tr>
								<td >
									<label>ISBN号：</label>
									<input type="text" class="underlineInput" id="nowISBN"><br>
									<label>图书版本：</label>
									<input type="text" class="underlineInput" id="nowVersion"><br>
									<label>图书价格：</label>
									<input type="text" class="underlineInput" id="nowPrice"><br>
									<label>图书库存：</label>
									<input type="text" class="underlineInput" id="nowLeftNum">
								</td>

								<td>
									<label>目录：</label>
									<textarea id="nowOutline" class="form-control" rows="2"></textarea>
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

	<script type="text/javascript">
		$(function(){
			//添加图书
			$("#add").click(function(){
				$("#mymodal").modal("toggle");	
			});



			//选择类别
			/*$("#dropdown-menu li a").click(function(){
				console.log($(this).html());
				$("#selectCate").html($(this).html());
				if($(this).html() != "全部"){
					nowCategory = $(this).html();
				}else{
					nowCategory = "";
				}
			});*/
			
		});
	</script>

	<script type="text/javascript" src="js/pullToRefresh.js"></script>
	<script type="text/javascript" src="js/iscroll.js"></script>
	<script>
	
		var nowPage = 0;	
		var nowCategory = "";
		
		//选择类别
		$(".category1").click(function(){
			console.log($(this).html());
			$("#selectedCate1").html($(this).html());
			if($(this).html() != "全部"){
				nowCategory = $(this).html();
			}else{
				nowCategory = "";
			}
			console.log(nowCategory);
			Refresh();
		});
	
		//插件代码
		refresher.init({
			id:"wrapper",
			pullDownAction:Refresh,                                                            
			pullUpAction:Load 																			
		});
		Refresh();	//初始化加载	
																			
		function Refresh() {																
			setTimeout(function () {	
				
				var el, li, i;																		
				el = $("#wrapper").find("ul");
				el.html("");//清空
				nowPage = 0;
				$.ajax({    
					type:'post',        
					url:'/library_web/show_limit_books.action',    
					data:{	
						nowPage : nowPage,
						category : nowCategory
	            	},   
	            	cache:false,    
	            	//dataType:'json',    
	            	success:function(data){ 
	            		//console.log("请求数据成功" + data);
		            	$.each(eval("(" + data+ ")"), function (index, obj) {
						    var author = obj.author;
		            		var bookAbstract = obj.bookAbstract;
		            		var bookimg = obj.bookimg;
		            		var bookname = obj.bookname;
		            		var bookno = obj.bookno;
		            		var category = obj.category;
		            		var guide = obj.guide;
		            		var isbn = obj.isbn;
		            		var leftnum = obj.leftnum;
		         			var outline = obj.outline;
		         			var price = obj.price;
		         			var publisher = obj.publisher;
		         			var readingnum = obj.readingnum;
		         			var score = obj.score;
		         			var version = obj.version;
		         			
		         			addBookDom(bookno ,bookimg, bookname, author, publisher);
		         			console.log(bookname);
						});
						//$("#mymodal4").modal("toggle");
		            },
		            error:function(){
		            	console.log("请求数据失败");
		            	
		            } 
	        	}); 
															
				//刷新
				wrapper.refresh();
			}, 1000);

		}

		function Load() {
			setTimeout(function () {
				var el, li, i;
				el = $("#wrapper").find("ul");
				nowPage++;
				console.log(nowCategory);
				$.ajax({    
					type:'post',        
					url:'/library_web/show_limit_books.action',    
					data:{	
						nowPage : nowPage,
						category : nowCategory
	            	},   
	            	cache:false,    
	            	//dataType:'json',    
	            	success:function(data){ 
	            		//console.log("请求数据成功" + data);
	            		if(data == "[]"){
	            			alert("没有更多数据了");
	            		}else{
	            			$.each(eval("(" + data+ ")"), function (index, obj) {
						    var author = obj.author;
		            		var bookAbstract = obj.bookAbstract;
		            		var bookimg = obj.bookimg;
		            		var bookname = obj.bookname;
		            		var bookno = obj.bookno;
		            		var category = obj.category;
		            		var guide = obj.guide;
		            		var isbn = obj.isbn;
		            		var leftnum = obj.leftnum;
		         			var outline = obj.outline;
		         			var price = obj.price;
		         			var publisher = obj.publisher;
		         			var readingnum = obj.readingnum;
		         			var score = obj.score;
		         			var version = obj.version;
		         			
		         			addBookDom(bookno ,bookimg, bookname, author, publisher);
		         			console.log(bookname);
						});
	            		}
		            	
						//$("#mymodal4").modal("toggle");
		            },
		            error:function(){
		            	console.log("请求数据失败");
		            } 
	        	}); 
				
				wrapper.refresh();
				
			}, 1000);	
		}
		
		$("#search").click(function(){
			var key = $("#keyBox").val();
			if(key != ""){
				searchBooks(key);
			}
		});
		
		function searchBooks(key){
			var el;
			el = $("#wrapper").find("ul");
			el.html("");
			$.ajax({    
					type:'post',        
					url:'/library_web/show_search_books.action',    
					data:{	
						key : key
	            	},   
	            	cache:false,    
	            	//dataType:'json',    
	            	success:function(data){ 
	            		//console.log("请求数据成功" + data);
	            		if(data == "[]"){
	            			alert("没有更多数据了");
	            		}else{
	            			$.each(eval("(" + data+ ")"), function (index, obj) {
						    var author = obj.author;
		            		var bookAbstract = obj.bookAbstract;
		            		var bookimg = obj.bookimg;
		            		var bookname = obj.bookname;
		            		var bookno = obj.bookno;
		            		var category = obj.category;
		            		var guide = obj.guide;
		            		var isbn = obj.isbn;
		            		var leftnum = obj.leftnum;
		         			var outline = obj.outline;
		         			var price = obj.price;
		         			var publisher = obj.publisher;
		         			var readingnum = obj.readingnum;
		         			var score = obj.score;
		         			var version = obj.version;
		         			
		         			addBookDom(bookno ,bookimg, bookname, author, publisher);
		         			console.log(bookname);
						});
	            		}
		            	
						//$("#mymodal4").modal("toggle");
		            },
		            error:function(){
		            	console.log("请求数据失败");
		            } 
	        	});
		}
		
		function addBookDom(bookno ,bookimg, bookname, author, publisher){
			
			var el, li, i;																		
			el = $("#wrapper").find("ul");
		
			var outside = $("<div></div>");
			outside.addClass("col-xs-12 col-sm-6 col-lg-3");
			var myBooks = $("<div></div>");
			myBooks.addClass("myBooks");
			//myBooks.attr("bookno", bookno);
			var aLink = $("<a></a>");
			aLink.attr("href", "javascript:void(0);");
			aLink.attr("bookno", bookno);
			aLink.addClass("showBook");
			var bookImg = $("<img />");
			bookImg.attr("src", bookimg);
			bookImg.attr("alt", "图书图片");
			bookImg.attr("onerror", "javascript:this.src='http://apis.juhe.cn/goodbook/img/98ca508f94ea736aa904708092bc838b.jpg'");
			bookImg.addClass("myBookImg");
			var myBookName = $("<div></div>");
			myBookName.addClass("myBookName");
			myBookName.html(bookname);
			var myBookAuthor = $("<div></div>");
			myBookAuthor.addClass("myBookAuthor");
			myBookAuthor.html(author);
			var myBookPublisher = $("<div></div>");
			myBookPublisher.addClass("myBookPublisher");
			myBookPublisher.html(publisher);
			var nbsp = $("<div></div>");
			nbsp.css("height", "5px");
			nbsp.html("&nbsp;");
					
			outside.append(myBooks);
			myBooks.append(aLink);
			aLink.append(bookImg);
			myBooks.append(myBookName);
			myBooks.append(myBookAuthor);
			myBooks.append(myBookPublisher);	
			myBooks.append(nbsp);
					
			el.append(outside);			
		}
		
		$(function(){
			//父节点绑定点击事件
			$("#wrapper").on("click", ".showBook", function(){
				var bookno = $(this).attr("bookno");
				console.log(bookno);
				$.ajax({    
					type:'post',        
					url:'/library_web/get_single_book.action',    
					data:{	
						bookno : bookno
	            	},   
	            	cache:false,    
	            	//dataType:'json',    
	            	success:function(data){ 
	            		console.log("请求数据成功" + data);
	            		if(data == "[]"){
	            			alert("没有更多数据了");
	            		}else{
	            			$.each(eval("(" + data+ ")"), function (index, obj) {
						    var author = obj.author;
		            		var bookAbstract = obj.bookAbstract;
		            		var bookimg = obj.bookimg;
		            		var bookname = obj.bookname;
		            		var bookno = obj.bookno;
		            		var category = obj.category;
		            		var guide = obj.guide;
		            		var isbn = obj.isbn;
		            		var leftnum = obj.leftnum;
		         			var outline = obj.outline;
		         			var price = obj.price;
		         			var publisher = obj.publisher;
		         			var readingnum = obj.readingnum;
		         			var score = obj.score;
		         			var version = obj.version;
		         			
		         			$("#nowBookImg").attr("src", bookimg);
		         			$("#nowAbstract").html(bookAbstract);
		         			$("#nowBookName").val(bookname);
		         			$("#nowAuthor").val(author);
		         			$("#nowPublisher").val(publisher);
		         			$("#selectedCate3").html(category);
		         			$("#nowGuide").html(guide);
		         			$("#nowISBN").val(isbn);
		         			$("#nowVersion").val(version);
		         			$("#nowPrice").val(price);
		         			$("#nowLeftNum").val(leftnum);
		         			$("#nowOutline").val(outline);
						});
	            	}
		            	
						//$("#mymodal4").modal("toggle");
		            },
		            error:function(){
		            	console.log("请求数据失败");
		            } 
	        	}); 
				
				$("#mymodal2").modal("toggle");
			});
			
		});
	</script>

	
	<script src="js/jquery.form.js"></script>
	<script type="text/javascript">
		//添加菜单
		//选择类别
		
		$(".category2").click(function(){
			console.log($(this).html());
			$("#selectedCate2").html($(this).html());
		});

		//保存图书
		$("#saveButton").click(function(){
			var newImage = $("#image").name;
			var newAbstract = $("#newAbstract").val();
			var newBookNmae = $("#newBookName").val();
			var newAuthor = $("#newAuthor").val();
			var newPublisher = $("#newPublisher").val();
			var newCategory = $("#selectedCate2").html();
			var newGuide = $("#newGuide").val();
			var newISBN = $("#newISBN").val();
			var newVersion = $("#newVersion").val();
			var newPrice = $("#newPrice").val();
			var newLeftNum = $("#newLeftNum").val();
			var newOutline = $("#newOutline").val();
			
			var reg = /[^\\\/]*[\\\/]+/g; //匹配文件的名称和后缀的正则表达式  
      		var newImage = $("#image").val().replace(reg, '');  
      		//var postfix = /\.[^\.]+/.exec(name);//获取文件的后缀  
      		//var text =name.substr(0,postfix['index']);//获取没有后缀的名称
			
			$.ajax({    
				type:'post',        
				url:'/library_web/add_new_book.action',    
				data:{	
				newImage : newImage,
				newAbstract : newAbstract,
				newBookNmae : newBookNmae,
				newAuthor : newAuthor,
				newPublisher : newPublisher,
				newCategory : newCategory,
				newGuide : newGuide,
				newISBN : newISBN,
				newVersion : newVersion,
				newPrice : newPrice,
				newLeftNum : newLeftNum,
				newOutline : newOutline
            },   
            cache:false,    
            //dataType:'json',    
            success:function(data){ 
            	console.log("请求数据成功");
            	console.log(data);
            },
            error:function(){
            	console.log("请求数据失败");
            }    
        }); 
			
			
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
	    
	    $("#saveButton").click(function(){
	    
	    });
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

	<script>
	$(function(){
		//热点
		var books = new Array("战马","看得见风的男孩","活着","浮沉","绿山墙的安妮");
        var hot = new Array("258", "223", "212", "198", "176");
        for(var i = 0; i < books.length; i++){
			addBookDom(i, books[i], hot[i]);
        }
		
		var cate = new Array("小说", "科技", "历史", "儿童", "心理", "传记", "社会", "哲学");
		var hot2 = new Array("353", "285", "260", "245", "162", "144", "129", "117", "108");
		console.log("请求数据失败");
		for(var i = 0; i < cate.length; i++){
			addCateDom(i, cate[i], hot2[i]);
		}
		
		/*$.ajax({    
			type:'get',      
			async: false,  
			url:'http://118.89.198.254/library/getBookPoint.action',    
			data:{	
            },   
            cache:false,    
            dataType:'jsonp', 
            jsonp: "callbackparam",
            jsonpCallback:"success_jsonpCallback",
            success:function(data){ */
            	/*console.log("图书热点");
	            for(var i = 0; i<data.length; i++){
            		console.log(data[i].key);
            		console.log(data[i].value);
            		addBookDom(i, data[i].key, data[i].value);
            	}
            	var books = new Array("战马","看得见风的男孩","活着","浮沉","绿山墙的安妮");
            	var hot = new Array("1496", "1494", "1491", "1491", "1487");
            	for(var i = 0; i < books.length; i++){
            		addBookDom(i, books[i], hot[i]);
            	} */
          /*  },
            error:function(){
            	var books = new Array("战马","看得见风的男孩","活着","浮沉","绿山墙的安妮");
            	var hot = new Array("1496", "1494", "1491", "1491", "1487");
            	for(var i = 0; i < books.length; i++){
            		addBookDom(i, books[i], hot[i]);
            	} 
            	console.log("请求数据失败");
            }    
        }); */
        
       /* $.ajax({    
			type:'get',        
			url:'http://118.89.198.254/library/getCatPoint.action',    
			data:{	
            },   
            cache:false,    
            dataType:'jsonp', 
            jsonp: "callbackparam",
            jsonpCallback:"success_jsonpCallback",
            success:function(data){ */
            	/*console.log("种类热点");
            	for(var i = 0; i<data.length; i++){
            		console.log(data[i].key);
            		console.log(data[i].value);
            		addCateDom(i, data[i].key, data[i].value);
            	}
            	var cate = new Array("小说", "科技", "历史", "儿童", "心理", "传记", "社会", "哲学");
            	var hot = new Array("353", "285", "260", "245", "162", "144", "129", "117", "108");
            	console.log("请求数据失败");
            	for(var i = 0; i < cate.length; i++){
            		addCateDom(i, data[i].key, data[i].value);
            	}*/
          /*  },
            error:function(){
            	var cate = new Array("小说", "科技", "历史", "儿童", "心理", "传记", "社会", "哲学");
            	var hot = new Array("353", "285", "260", "245", "162", "144", "129", "117", "108");
            	console.log("请求数据失败");
            	for(var i = 0; i < cate.length; i++){
            		addCateDom(i, data[i].key, data[i].value);
            	}
            }    
        }); */
        
        function addCateDom(i, category, value){
        	var tr = $("<tr></tr>");
        	var td_name = $("<td></td>");
        	var span_rank = $("<span></span>");
        	var className = "rank rank" + (i+1);
        	span_rank.addClass(className);
        	span_rank.html(i+1);
        	var span_name = $("<span></span>");
        	span_name.addClass("rank_cate");
        	span_name.html(category);
        	var td_point = $("<td></td>");
        	td_point.addClass("hotNum");
        	td_point.html(value);
        	
        	$(".hot_category").append(tr);
        	tr.append(td_name);
        	td_name.append(span_rank);
        	td_name.append(span_name);
        	tr.append(td_point);
        }
        
        function addBookDom(i, book, value){
        	var tr = $("<tr></tr>");
        	var td_name = $("<td></td>");
        	var span_rank = $("<span></span>");
        	var className = "rank rank" + (i+1);
        	span_rank.addClass(className);
        	span_rank.html(i+1);
        	var span_name = $("<span></span>");
        	span_name.addClass("rank_book");
        	span_name.html(book);
        	var td_point = $("<td></td>");
        	td_point.addClass("hotNum");
        	td_point.html(value);
        	
        	$(".hot_book").append(tr);
        	tr.append(td_name);
        	td_name.append(span_rank);
        	td_name.append(span_name);
        	tr.append(td_point);
        }
	});
	</script>
  </body>
</html>
