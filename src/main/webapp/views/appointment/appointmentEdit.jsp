<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
</head>

<body>
	<form action="" role="form">
		<table>
			<tr>
				<td style="height:40"><label style="width:100px;text-align:right" for="customerId">客户编号</label></td>
				<td><input type="text" id="customerId" class="form-control input-sm" style="width: 234px;" readonly="readonly" value="${customer.customerId}"></td>
			</tr>
			<tr>
				<td style="height:40"><label style="width:100px;text-align:right">手机号：</label></td>
				<td><input type="text" class="form-control input-sm" style="width: 234px;" readonly="readonly" value="${customer.phone}"></td>
			</tr>
	
			<tr>
				<td style="height:40"><label style="width:100px;text-align:right">订单状态：</label></td>
				<td>
					<form:radiobuttons path="appointment.statusCode" items="${appointment.statusName }"/><br/>
				</td>
			</tr>
			<tr>
				<td style="height:40"><label style="width:100px;text-align:right">会员备注：</label></td>
				<td>
				<textarea class="form-control" style="width: 234px;" rows="3"></textarea>
				</td>
			</tr>
			<tr>
				<td style="height:70;text-align:right"><button type="button" class="btn btn-default btn-sm">保存</button></td>
				<td style="height:40;text-align:center">
					<button type="button" class="btn btn-default btn-sm">取消</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
	