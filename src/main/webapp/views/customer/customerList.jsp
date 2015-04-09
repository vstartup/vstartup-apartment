<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head> 
<link rel="stylesheet" href="${ctx}/css/qunit-1.11.0.css">
<link rel="stylesheet" type="text/css" href="${ctx}/bower_components/ladda/m-progress.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/bower_components/dhtmlxWindows/codebase/dhtmlxwindows.css"/>
<script src="${ctx}/bower_components/dhtmlxWindows/codebase/dhtmlxwindows.js"></script> 
<script src="${ctx}/js/bootstrap-paginator.js"></script> 
<script src="${ctx}/js/qunit-1.11.0.js"></script>
<script>
//pageination setting
var element = $('#bp-3-element-sm-test');
options = {
    size:"small",
    bootstrapMajorVersion:3,
    currentPage: "${requestScope.pageNumber}",
    numberOfPages: 9,
    totalPages:"${requestScope.totalPages}",
    onPageClicked: function(e,originalEvent,type,page){
        $('#pageNumber').attr("value",page); 
        searchCustomer();
    }
};
element.bootstrapPaginator(options);
</script>
</head>
<body >
	<form id="search_editfrom" action="${ctx}/customer/preEdit" class="form-inline" role="form">
		<input type="hidden" class="search_id" name="search_id" value="">
	</form>
	<form id="search_deletefrom" action="${ctx}/customer/doDelete" class="form-inline" role="form">
		<input type="hidden" class="search_id" name="search_id" value="">
	</form>
	
	<div class=" box-content row col-md-12">
		<div class="box-content row col-md-4"
			 style="padding-top:0px;margin-top:0px;padding-bottom:5px;margin-bottom:0px;">
		    <ul id='bp-3-element-sm-test' style="padding-top:0px;margin-top:0px;padding-bottom:0px;margin-bottom:0px;"></ul>
		</div>
		<div class="box-content row col-md-2 pull-right" style="padding-top:0px;margin-top:0px;padding-bottom:5px;margin-bottom:0px;text-align:right">共${page.totalElements}项，共${totalPages}页</div>
	    <table id="customer_table" class="table table-striped table-bordered  responsive">
	    	<thead>
			    <tr>
			        <th>用户名</th>
			        <th>姓名</th>
			        <th>注册时间</th>
			        <th>电话</th>
			        <th>类型</th>
			        <th>状态</th>
			        <th>Actions</th>
			    </tr>
		    </thead>
		    <tbody>
			    <c:forEach var="instance" items="${page.content}" varStatus="status">
			    	<tr>
				        <td>${instance.userName}</td>
				        <td class="center">${instance.realName}</td>
				        <td class="center"><fmt:formatDate value="${instance.regDate}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
				        <td class="center">${instance.phone}</td>
				        <td class="center">${instance.typeName}</td>
				        <td class="center" style="padding-top:16px">
				        	<c:if test="${instance.statusCode==1}">
				            	<span class="label-success label label-default">${instance.statusName}</span>
				        	</c:if>
				        	<c:if test="${instance.statusCode==2}">
				        		<span class="label-warning label label-default">${instance.statusName}</span>
				        	</c:if>
				        </td>
				        <td class="center">
				        	<!-- 
				            <button class="btn btn-primary btn-sm">
				                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
				                View
				            </button>
				             -->
				            <button class="btn btn-info btn-sm btn-edit" data-id="${instance.id}">
				                <i class="glyphicon glyphicon-edit icon-white"></i>
				                Edit
				            </button>
				            <button class="btn btn-danger btn-sm btn-delete ladda-button" data-style="zoom-in" data-id="${instance.id}">
				                <i class="glyphicon glyphicon-trash icon-white"></i>
				                <span class="ladda-label">Delete</span>
				            </button>
				        </td>
				    </tr>
			    </c:forEach>
			  </tbody>
		</table>
	</div>

<script type="text/javascript">

require(["dojo/dom","dojo/_base/xhr",
         "dojox/layout/ContentPane",
         "dijit/registry",
         "dojo/query",
         "dojo/on"],function(dom,xhr,ContentPane,registry,query,on){
	var dhxWins;
	showEditWindow = function(){
		dhxWins = new dhtmlXWindows();
		popupWindow('CustomerEditWin',"search_editfrom","会员修改",380,400,true);
	}
	popupWindow = function(name,formId,title,iWidth,iHeight,modal){
	    
		var containerId="result_content_div";//the content for return of  springMvc
		var formObj = dom.byId(formId);//commit form
		var winId=name;
		var  iTop=(document.body.clientHeight-iHeight)/2;
	    var  iLeft=(document.body.clientWidth-iWidth)/2;
	    var dhxWin=dhxWins.createWindow(winId, iLeft,iTop, iWidth,iHeight);
		dhxWin.setText(title);
		dhxWins.window(winId).setModal(true);
		dhxWin.button("close").attachEvent("onClick", function(){
			closeTopmostWindow();
		});
		
		//if already registed ContentPane container,must destory it before new again
		if(dijit.byId(containerId)){
		   dijit.byId(containerId).destroy();    
		}
		//create a new div to attach ContentPane
    	var srcNode = document.createElement(containerId);
    	srcNode.id=containerId;
    	srcNode.style.overflow="auto";
    	document.body.appendChild(srcNode);
    	//ContentPane can execute javascript
    	var dojoDhxContainer = new ContentPane({style:"height:125px"}, containerId);
    	refreshDiv(dojoDhxContainer,formObj);//us ajax load...
    	
    	dhxWin.attachObject(containerId);//the context of dhxWin
		return dhxWin;
	}
	closeTopmostWindow = function(){
		var closeWin=dhxWins.getTopmostWindow();
		if(closeWin){
			closeWin.close();
		}
	    var topWin=dhxWins.getTopmostWindow();

	    if(topWin){
	        topWin.setModal(true);
	    }
	}
	
	//target:dojox.layout.ContenPane to load result page 
	//formObj:form instance of the request
	refreshDiv = function (target,formObj) {
		var oldHref = target.href;
		target.setContent("加载中，请稍候");
		xhr.post({
		  url: formObj.action,
		  form: formObj,
		  handleAs: "text",
		  load: function(response){
			target.setContent(response)
			target.href = oldHref;
		  },
		  error: function(err){
		    console.log("error:",err+"");
		  }
		});
	}
	RESTfullService = function (ladda,formObj) {
		xhr.post({
		  url: formObj.action,
		  form: formObj,
		  handleAs: "json",
		  load: function(response){
            	if(response.msg=="success"){
            		bootbox.alert({
            			size:'small',
            			message:'删除成功！'
            		});
            		searchCustomer();
            	}else{
            		bootbox.alert("删除失败！")
            		ladda.stop();
            	}
		  },
		  error: function(err){
		    console.log("error:",err+"");
		  }
		});
	}
	
	//connect on buttons click function
	on(query(".btn-edit"),"click",function(){
		query("#search_editfrom .search_id")[0].setAttribute("value",this.dataset.id);
		showEditWindow();
	});
	on(query(".btn-delete"),"click",function(){
	    //Ladda用于按钮等待状态，返回信息后，恢复按钮状态
		var ladda = Ladda.create(this);
	    var btn = this;
	    ladda.start();
	    bootbox.confirm({ 
	        size: 'small',
	        message: "确认删除会员？", 
	        callback: function(result){ 
	        	if(result){
	        		query("#search_deletefrom .search_id")[0].setAttribute("value",btn.dataset.id);
	        		var formObj = dom.byId("search_deletefrom");
	        		RESTfullService(ladda,formObj);
	        	}else{
	        		ladda.stop();
	        	}
			}
	    })
	});
});

</script>  	
</body>
</html>
	