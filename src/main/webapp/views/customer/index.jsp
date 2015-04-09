<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/bower_components/dhtmlxWindows/codebase/dhtmlxwindows.css"/>
<script src="${ctx}/bower_components/dhtmlxWindows/codebase/dhtmlxwindows.js"></script> 
<script type="text/javascript">

require(["dijit/layout/BorderContainer"]);
searchCustomer = function(){
	getSearchForm("search_from","content_div");
}

getSearchForm = function (formId,targetId) {
	var formObj;
	require(["dojo/dom",
	         "dojo/_base/xhr",
	         "dojo/parser",
	         "dijit/registry",
	         "dojox/layout/ContentPane",
	         "dojo/parser",
	         "dojo/domReady!"
	         ],function(dom,xhr,parser,registry,ContentPane,parser){
		
		formObj = dom.byId(formId);
		//parser.parse(dojo.byId(targetId));
		xhr.get({
		  url: formObj.action,
		  form: formObj,
		  handleAs: "text",
		  load: function(response){
			if(dijit.byId(targetId)){
			   dijit.byId(targetId).destroy(true);    
			}
			
		  	var custContentPane = new ContentPane({
		  		style:"height:25px"
	        }, targetId);
		  	custContentPane.setContent(response);
		  },
		  error: function(err){
		    console.log("error:",err+"");
		  }
		});
	});
}
</script>  
</head>

<body>
<div class="ch-container">
<div class="row">
<div id="content">
<!--- content start---------->
	<form:form id="search_from" action="${ctx}/customer/list" class="form-inline" role="form">
		<input type="hidden" id="pageNumber" name="pageNumber" value="1">
		<input type="hidden" name="pageSize" value="10">
		<p class="text-muted">条件查询</p>
		<fieldset>
			<legend></legend>
			<div class="row">
				<div class="form-group  col-md-offset-1">
					<label class="control-label" for="search_LIKE_realName">姓名</label>
					<input class="form-control input-sm" type="text" name="search_LIKE_realName">
				</div>
				<div class="form-group">
					<label class="control-label" for="search_LIKE_userName">用户名</label>
					<input class="form-control input-sm" type="text" name="search_LIKE_userName">
				</div>
				<div class="form-group">
					<button type="button" onclick="searchCustomer();" class="btn btn-default btn-sm">查询</button>
				</div>
			</div>
		</fieldset>
	</form:form>
	<p class="text-muted">会员列表</p>
	<fieldset>
		<legend style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;"></legend>
		<div data-dojo-type="dijit/layout/BorderContainer" data-dojo-props="design:'sidebar', gutters:true, liveSplitters:true" id="borderContainer">
			<div id="content_div"></div>
		</div>
	</fieldset>
	
<!-- -content end---------------------- -->
</div>
</div>
</div>
</body>
</html>
