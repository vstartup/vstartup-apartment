<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	 <link href='${ctx}/bower_components/bootstrap/dist/css/bootstrap.css' rel='stylesheet'>
	 <link href="${ctx}/css/charisma-app.css" rel="stylesheet">
	 <link href='${ctx}/css/animate.min.css' rel='stylesheet'>
	 <link href='${ctx}/bower_components/ladda/ladda.css' rel='stylesheet'>
	 
	 
	<script src="${ctx}/bower_components/jquery/jquery.min.js"></script>
	<!-- calender plugin -->
	<script src='${ctx}/bower_components/moment/min/moment.min.js'></script>
	<script src='${ctx}/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
	<!-- for iOS style toggle switch -->
	<script src="${ctx}/js/jquery.iphone.toggle.js"></script>
	<!-- star rating plugin -->
	<script src="${ctx}/js/jquery.raty.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="${ctx}/bower_components/colorbox/jquery.colorbox-min.js"></script>
	<!-- data table plugin -->
	<script src='${ctx}/js/jquery.dataTables.min.js'></script>
	<script src="${ctx}/js/jquery.uploadify-3.1.min.js"></script>
	<script src="${ctx}/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script src="${ctx}/js/jquery.cookie.js"></script>
	<script src="${ctx}/bower_components/chosen/chosen.jquery.min.js"></script>
	<script src="${ctx}/js/jquery.autogrow-textarea.js"></script>
	<script src="${ctx}/js/jquery.history.js"></script>
	<script src="${ctx}/js/bootbox.min.js"></script> 
	<script src="${ctx}/bower_components/ladda/ladda.js"></script>
	<script src="${ctx}/js/charisma.js"></script>
	<script src="bower_components/dojoroot/dojo/dojo.js.uncompressed.js"></script>
	</head>

<body>
<!-- topbar starts -->
<div class="navbar navbar-default" role="navigation">

    <div class="navbar-inner">
        <button type="button" class="navbar-toggle pull-left animated flip">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand animated tada" href="${ctx}/views/index.jsp"> <img alt="Charisma Logo" src="${ctx}/img/logo20.png" class="hidden-xs"/>
            <span>Vstartup</span></a>

        <!-- user dropdown starts -->
        <div class="btn-group pull-right">
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> admin</span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#">Profile</a></li>
                <li class="divider"></li>
                <li><a href="login.html">Logout</a></li>
            </ul>
        </div>
        <!-- user dropdown ends -->

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
        <!--theme selector ends -->
<!--
         <ul class="collapse navbar-collapse nav navbar-nav top-menu">
             <li><a href="#"><i class="glyphicon glyphicon-globe"></i> Visit Site</a></li>
             <li class="dropdown">
                 <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i> Dropdown <span
                         class="caret"></span></a>
                 <ul class="dropdown-menu" role="menu">
                     <li><a href="#">Action</a></li>
                     <li><a href="#">Another action</a></li>
                     <li><a href="#">Something else here</a></li>
                     <li class="divider"></li>
                     <li><a href="#">Separated link</a></li>
                     <li class="divider"></li>
                     <li><a href="#">One more separated link</a></li>
                 </ul>
             </li>-->
            <!-- search query
            <li>
                <form class="navbar-search pull-left">
                    <input placeholder="Search" class="search-query form-control col-md-10" name="query"
                           type="text">
                </form>
            </li> 
        </ul>-->

    </div>
</div>
<!-- topbar ends -->
<div style="padding:10px 10px 10px 10px">
	<div class="row col-md-2 col-sm-2 col-lg-2">
		<div class="sidebar-nav">
		    <div class="nav-canvas">
		        <div class="nav-sm nav nav-stacked">
		        </div>
		        <ul class="nav nav-pills nav-stacked main-menu">
		            <li class="nav-header">Main</li>
		            <li><a class="vsajax-link" href="${ctx}/views/index.jsp"><i class="glyphicon glyphicon-home"></i><span> Dashboard</span></a>
		            </li>
		            <li><a class="vsajax-link" href="${ctx}/views/customer/index.jsp"><i class="glyphicon glyphicon-user"></i><span> 会员管理</span></a>
		            </li>
		            <li><a class="vsajax-link" href="${ctx}/views/ui.jsp"><i class="glyphicon glyphicon-eye-open"></i><span> UI Features</span></a>
		            </li>
		            <li><a class="vsajax-link" href="${ctx}/views/form.jsp"><i
		                        class="glyphicon glyphicon-edit"></i><span> Forms</span></a></li>
		            <li><a class="vsajax-link" href="${ctx}/views/chart.jsp"><i class="glyphicon glyphicon-list-alt"></i><span> Charts</span></a>
		            </li>
		            <li><a class="vsajax-link" href="${ctx}/views/typography.jsp"><i class="glyphicon glyphicon-font"></i><span> Typography</span></a>
		            </li>
		            <li><a class="vsajax-link" href="${ctx}/views/gallery.jsp"><i class="glyphicon glyphicon-picture"></i><span> Gallery</span></a>
		            </li>
		            <li class="nav-header hidden-md">Sample Section</li>
		            <li><a class="vsajax-link" href="${ctx}/views/table.jsp"><i
		                        class="glyphicon glyphicon-align-justify"></i><span> Tables</span></a></li>
		            <li class="accordion">
		                <a href="#"><i class="glyphicon glyphicon-plus"></i><span> Accordion Menu</span></a>
		                <ul class="nav nav-pills nav-stacked">
		                    <li><a href="#">Child Menu 1</a></li>
		                    <li><a href="#">Child Menu 2</a></li>
		                </ul>
		            </li>
		            <li><a class="vsajax-link" href="${ctx}/views/calendar.jsp"><i class="glyphicon glyphicon-calendar"></i><span> Calendar</span></a>
		            </li>
		            <li><a class="vsajax-link" href="${ctx}/views/grid.jsp"><i
		                        class="glyphicon glyphicon-th"></i><span> Grid</span></a></li>
		            <li><a href="tour.html"><i class="glyphicon glyphicon-globe"></i><span> Tour</span></a></li>
		            <li><a class="vsajax-link" href="${ctx}/views/icon.jsp"><i
		                        class="glyphicon glyphicon-star"></i><span> Icons</span></a></li>
		            <li><a href="${ctx}/views/error.jsp"><i class="glyphicon glyphicon-ban-circle"></i><span> Error Page</span></a>
		            </li>
		            <li><a href="${ctx}/login.jsp"><i class="glyphicon glyphicon-lock"></i><span> Login Page</span></a>
		            </li>
		        </ul>
		        <label id="for-is-ajax" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
		    </div>
		</div>
	</div>
</div>

<div id="right_div" data-dojo-type="dojox/layout/ContentPane" class="col-lg-10 col-sm-10">
</div>
<div class="col-lg-12 col-sm-12">
	<footer class="row"  style="padding-top:20px">
        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://usman.it" target="_blank">Muhammad
                Usman</a> 2012 - 2014</p>

        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">Powered by: <a
                href="http://usman.it/free-responsive-admin-template">Vstartup</a></p>
    </footer>
</div>
<script type="text/javascript">
var msie = navigator.userAgent.match(/msie/i);//is the ie explorer
$('a.vsajax-link').click(function (e) {
    if (msie) e.which = 1;//is the IE
    alert(e.which != 1);
    alert(!$('#is-ajax').prop('checked'));
    alert( $(this).parent('li').hasClass('active'));
    
    if (e.which != 1 || !$('#is-ajax').prop('checked') || $(this).parent('li').hasClass('active')) return false;
    e.preventDefault();
    $('.sidebar-nav').removeClass('active');
    $('.navbar-toggle').removeClass('active');
    
    var $clink = $(this);
    //History.pushState(null, null, $clink.attr('href'));
    loadContent($clink.attr('href'),"right_div");
    $('ul.main-menu li.active').removeClass('active');
    $clink.parent('li').addClass('active');
});
loadContent = function(href,targetId) {
	require(["dojo/dom",
	         "dojo/_base/xhr",
	         "dojo/parser",
	         "dijit/registry",
	         "dojox/layout/ContentPane",
	         "dojo/domReady!"
	         ],function(dom,xhr,parser,registry,ContentPane){
		$('#loading').remove();
	    $('#right_div').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
		parser.parse();
		xhr.get({
		  url: href,
		  handleAs: "text",
		  load: function(response){
				if(registry.byId(targetId)){
					registry.byId(targetId).destroy(true);    
				}
				
			  	var _rightContentPane = new ContentPane({
			  		style:"height:125px"
		        }, targetId);
			  	_rightContentPane.setContent(response);
		        
		        $('#loading').remove();
	            $("#"+targetId).fadeIn();
	            var newTitle = $(response).filter('title').text();
	            $('title').text(newTitle);
		  },
		  error: function(err){
		    console.log("error:",err+"");
		  }
		});
	});
}
</script>

</body>
</html>
