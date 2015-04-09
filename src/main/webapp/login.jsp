<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException "%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<link href="${ctx}/static/bower_components/bootstrap/3.3.2/css/bootstrap.min.css" type="text/css"rel="stylesheet" />
	<link href="${ctx}/static/bower_components/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
	
	<script src="${ctx}/static/bower_components/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bower_components/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/charisma.js"></script>
	<style type="text/css">
		body{padding-top:200px;}
	</style>
</head>

<body>
<!-- theme selector starts-->
            <div class="btn-group pull-right theme-container animated tada">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-tint"></i><span
                        class="hidden-sm hidden-xs"> Change Theme / Skin</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" id="themes">
                    <li><a data-value="classic" href="#"><i class="whitespace"></i> Classic</a></li>
                    <li><a data-value="cerulean" href="#"><i class="whitespace"></i> Cerulean</a></li>
                    <li><a data-value="cyborg" href="#"><i class="whitespace"></i> Cyborg</a></li>
                    <li><a data-value="simplex" href="#"><i class="whitespace"></i> Simplex</a></li>
                    <li><a data-value="darkly" href="#"><i class="whitespace"></i> Darkly</a></li>
                    <li><a data-value="lumen" href="#"><i class="whitespace"></i> Lumen</a></li>
                    <li><a data-value="slate" href="#"><i class="whitespace"></i> Slate</a></li>
                    <li><a data-value="spacelab" href="#"><i class="whitespace"></i> Spacelab</a></li>
                    <li><a data-value="united" href="#"><i class="whitespace"></i> United</a></li>
                </ul>
            </div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
    			<div class="panel-heading">
			    	<h3 class="panel-title">登   录</h3>
			 	</div>
			 	<div class="panel-body">
			 		<form id="loginForm" action="${ctx}/views/login" method="post" role="form">
			 		<fieldset>
					<%
						String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
						if(error != null){
					%>
							<div class="alert alert-error controls input-large">
								<button class="close" data-dismiss="alert">×</button>
					<%
							if(error.contains("DisabledAccountException")){
								out.print("用户已被屏蔽,请登录其他用户.");
							}
							else{
								out.print("登录失败，请重试.");
							}
					%>		
							</div>
					<%
						}
					%>
					<div class="form-group">
						<input type="text" placeholder="用户名" id="username" name="username" value="${username}" class="form-control input-medium required"/>
					</div>
					<div class="form-group">
						<input type="password" placeholder="密码" id="password" name="password" class="form-control input-medium required"/>
					</div>
					<div class="checkbox">
							<label>
								<input type="checkbox" value="记住我" id="rememberMe" name="rememberMe"/> 记住我
							</label>
						</div>
					</div>
					<input class="btn btn-lg btn-success btn-block" type="submit" value="登录">
					<p class="help-block">(管理员：<b>admin/admin</b>, 普通用户：<b>user/user</b>)</p>
				</fieldset>
				</form>
    		</div>
    	</div>
	</div>
</div>
	
	<script>
		$(document).ready(function() {
			$("#loginForm").validate();
		});
	</script>
</body>
</html>
