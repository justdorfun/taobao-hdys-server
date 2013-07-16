<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>康定电子管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords"
			content="康定电子管理系统,www.dangg999.com" />
		<meta name="description" content="数字化医院管理系统" />
		<link rel="stylesheet" href="<%=path %>/css/main.css" />
		<script src="<%=path %>/js/jquery-1.4.4.min.js" type="text/javascript"></script>
		<script>
		function login(){
			var name = $("#username").val();
			var pwd = $("#password").val();
			var yz =$("#yz").val();
			if($.trim(name)=="" || $.trim(pwd)=="" ||  $.trim(yz)==""){
				alert("用户名,密码或验证码不能为空!");
				$("#username").focus();
				return;
			}
			if(name.length < 2 || name.length > 15){
				alert("用户名长度最小2位，最大15位");
				$("#username").focus();
				return;
			}
			if(pwd.length < 2 || pwd.length > 15){
				alert("密码长度最小2位，最大15位");
				$("#password").focus();
				return;
			}
			
			if(yz.length != 5){
				alert("验证码为5位！");
				$("#yz").focus();
				return;
			}	
			$("#form1").submit();
		}
		</script>

	</head>

	<body>
		<center>
		<div id="topMain" align="center" style="width: 920px;">
			<div id="top" style="width: 920px; height: 46px;">
				<div align="left">
					<img src="<%=path %>/img/logo1.png" style="float: left" />
					<div style="float: left; margin-top: 15px; margin-left: 10px;">
						康定电子商务平台
					</div>
				</div>
			</div>
			<div id="menu">
				<div
					style="background-image: url(<%=path %>/img/menu.jpg); width: 920px; height: 36px;">
				</div>
			</div>
		</div>
		</center>
		<!-- Begin main -->
		<div id="main" style="">

			<form id="form1" action="<%=path %>/sys/menu/login.do" method="post">
				<div id="left">
					<table width="295px" border="0">
						<tr>
							<td colspan="2" style="height: 32px;">
								<span>登录康定电子管理系统</span>
							</td>
						</tr>
						<tr>
							<td height="5px;"></td>
						</tr>
						<tr>
							<td width="67" align="right">
								帐&nbsp;&nbsp;&nbsp;号：
							</td>
							<td width="210" align="left">
								<input type="text" id="username" name="username"
									class="input01" onblur="if (value ==''){value='登录账号';}"
									onfocus="if (value =='登录账号'){value =''}" value="登录账号"
									tabindex="1" cssStyle="ime-mode: disabled;" />
							</td>
						</tr>
						<tr>
							<td height="5px;"></td>
						</tr>
						<tr>
							<td align="right">
								密&nbsp;&nbsp;&nbsp;码：
							</td>
							<td align="left">
								<input type="password" id="password" name="password"
									class="input01" tabindex="2" maxlength="16" />
								&nbsp;
							</td>
						</tr>
						<tr>
							<td height="5px;"></td>
						</tr>
						<tr>
							<td align="right">
								验证码：
							</td>
							<td align="left">
								<input type="text" id="yz" name="yz" class="input01 validate"
									maxlength="5" tabindex="3" cssStyle="ime-mode: disabled;" />
								&nbsp;
							</td>
						</tr>
						<tr>
							<td height="5px;"></td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td align="left">
								<img src="<%=path %>/kaptcha.jpg" />
							</td>
						</tr>
						<tr>
							<td height="5px;"></td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td align="left">
								<input class="signin-btn" type="button" tabindex="5" value=""
									onclick="login()" />
								<a href="#">忘记密码</a>
							</td>
						</tr>
					</table>
				</div>
			</form>
			<!-- End Left Column -->


			<!-- Begin Right Column -->

			<div id="right">
				<div style="float: left;font-size:26px; margin-top: 10px; margin-left: 20px; width: 700px;">
					<strong>康定电子</strong>
				</div>
				<div  style="float: left; margin-top: 40px; margin-left: 20px; width: 700px;">
					<img src="<%=path %>/img/1.gif" alt="bg" style="float: left" />
					<div style="float: left; margin-top: 10px; margin-left: 20px;">
						<strong> 安全的服务器内容保障 </strong>
						<br />
						<br />
						基于计算机图形图像技术，为服务器提供安全的流媒体，文字等内容保障。
					</div>
				</div>
				<div style="float: left; margin-top: 40px; margin-left: 20px;width: 700px;">
					<img src="<%=path %>/img/2.gif" alt="bg" style="float: left" />
					<div style="float: left; margin-top: 10px; margin-left: 20px;">
						<strong>多种产品形态，满足你的需求</strong>
						<br />
						<br />
						提供服务版，单机版，链路版等多个版本，满足客户需求
					</div>
	
				</div>
				<div style="float: left; margin-top: 40px; margin-left: 20px;width: 700px;">
					<img src="<%=path %>/img/3.gif" alt="bg" style="float: left" />
					<div style="float: left; margin-top: 10px; margin-left: 20px;">
						<strong>中心节点统一管理</strong>
						<br />
						<br />
						采取客户端分析监控，中心节点统一管理
					</div>
				</div>
			</div>
		</div>

	</body>
</html>
<%
	Object err = request.getAttribute("err");
	if (err != null) {
%>
<script>
		alert("<%=err%>");
	</script>
<%
	}
%>