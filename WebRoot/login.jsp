<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书馆后台管理系统登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/login.css" rel="stylesheet" type="text/css" media="all" />
	
	<script>
		var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++) {if ( __links[i].getAttribute('data-t') == '_blank' ) { __links[i].addEventListener('click', __linkClick, false);}}
	</script>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script>
		$(document).ready(function(c) {
			$('.alert-close').on('click', function(c){
				$('.message').fadeOut('slow', function(c){
					$('.message').remove();
				});
			});	  
		});
	</script>
	
	<script type="text/javascript">
		$(function(){
			
			var cookieName = getCookie("username");
			var cookiePassword = getCookie("password");
			if($.trim(cookieName) != ''){
				$("#username").val(cookieName);
			}
			if($.trim(cookiePassword) != ''){
				$("#password").val(cookiePassword);
			}
			
			
			
			$("#signIn").click(function(){
				var username = $("#username").val();
				var password = $("#password").val();
				//cookie存储
				setCookie("username", username, 7);
				setCookie("password", password, 7);
				//客户端session存储
				console.log("点击了" + username + password);
				//localStorage.setItem('username', username);
				sessionStorage.username = username;
				var nowUser = sessionStorage.username;
				if(sessionStorage.username == null){
					console.log("用户名为空");
					return;
				}
				location.href = "index.action";
			});
			
			console.log(sessionStorage.usernames);
		});
	</script>
	
	<script>
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
  </head>
  
	<body>
 		<!-- contact-form -->	
		<div class="message warning">
			<div class="inset">
				<div class="login-head">
					<h1>Login Form</h1>
					<div class="alert-close"> </div> 			
				</div>
				<form>
					<li>
						<input type="text" class="text" value="Username" id="username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}"><a href="javascript:void(0);" class=" icon user"></a>
					</li>
					<div class="clear"> </div>
					<li>
						<input type="password" value="Password" id="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"> <a href="javascript:void(0);" class="icon lock"></a>
					</li>
					<div class="clear"> </div>
					<div class="submit">
						<input type="button" id="signIn" value="Sign in" >
						<h4><a href="javascript:void(0);">Lost your Password ?</a></h4>
						<div class="clear">  </div>	
					</div>
					
				</form>
			</div>					
		</div>
		
		<div class="clear"> </div>
		<!-- footer -->
		<div class="footer">
			<p>Copyright &copy; BlueBlueSky</p>
		</div>
 	</body>
</html>
