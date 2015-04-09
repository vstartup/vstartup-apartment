<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <title>Free HTML5 Bootstrap Admin Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">


<!-- The styles -->
    <link id="bs-css" href="${ctx}/css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="${ctx}/css/charisma-app.css" rel="stylesheet">
    <link href='${ctx}/bower_components/bootstrap/dist/css/bootstrap.css' rel='stylesheet'>
    <link href='${ctx}/bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='${ctx}/bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='${ctx}/bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='${ctx}/bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='${ctx}/bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='${ctx}/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='${ctx}/css/jquery.noty.css' rel='stylesheet'>
    <link href='${ctx}/css/noty_theme_default.css' rel='stylesheet'>
    <link href='${ctx}/css/elfinder.min.css' rel='stylesheet'>
    <link href='${ctx}/css/elfinder.theme.css' rel='stylesheet'>
    <link href='${ctx}/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='${ctx}/css/uploadify.css' rel='stylesheet'>
    <link href='${ctx}/css/animate.min.css' rel='stylesheet'>
   
    <!-- link href='css/bootstrap-slate.min.css' rel='stylesheet'> -->
	<script src="${ctx}/bower_components/dojoroot/dojo/dojo.js"></script>
    <!-- jQuery -->
    <script src="${ctx}/bower_components/jquery/jquery.min.js"></script>
    

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- The fav icon -->
    <link rel="shortcut icon" href="${ctx}/img/favicon.ico">

<script type="text/javascript">

</script>	
<sitemesh:head/>
</head>

<body>
	<div class="ch-container">
		<div class="row">
			<%@ include file="/layouts/header.jsp"%>
		</div>
		<div class="row">
			<div class="col-md-2">
				<%@ include file="/layouts/left.jsp"%>
			</div>
			<div id="main" class="col-md-10">
				<sitemesh:body />
			</div>
		</div>
		<div class="row">
			<%@ include file="/layouts/footer.jsp"%>
		</div>
	</div>
	
	<!-- external javascript -->
	
	<script src="${ctx}/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<!-- library for cookie management -->
	<script src="${ctx}/js/jquery.cookie.js"></script>
	<!-- calender plugin -->
	<script src='${ctx}/bower_components/moment/min/moment.min.js'></script>
	<script src='${ctx}/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='${ctx}/js/jquery.dataTables.min.js'></script>
	
	<!-- select or dropdown enhancer -->
	<script src="${ctx}/bower_components/chosen/chosen.jquery.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="${ctx}/bower_components/colorbox/jquery.colorbox-min.js"></script>
	<!-- notification plugin -->
	<script src="${ctx}/js/jquery.noty.js"></script>
	<!-- library for making tables responsive -->
	<script src="${ctx}/bower_components/responsive-tables/responsive-tables.js"></script>
	<!-- tour plugin -->
	<script src="${ctx}/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
	<!-- star rating plugin -->
	<script src="${ctx}/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="${ctx}/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="${ctx}/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="${ctx}/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="${ctx}/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="${ctx}/js/charisma.js"></script>
	
</body>
</html>