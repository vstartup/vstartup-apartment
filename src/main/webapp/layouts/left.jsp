<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="sidebar-nav">
    <div class="nav-canvas">
        <div class="nav-sm nav nav-stacked">

        </div>
        <ul class="nav nav-pills nav-stacked main-menu">
            <li class="nav-header">Main</li>
            <li><a class="ajax-link" href="${ctx}/views/index.jsp"><i class="glyphicon glyphicon-home"></i><span> Dashboard</span></a>
            </li>
            <li><a class="ajax-link" href="${ctx}/customer/index"><i class="glyphicon glyphicon-user"></i><span> 会员管理</span></a>
            </li>
            <li><a class="ajax-link" href="${ctx}/views/ui.jsp"><i class="glyphicon glyphicon-eye-open"></i><span> UI Features</span></a>
            </li>
            <li><a class="ajax-link" href="${ctx}/views/form.jsp"><i
                        class="glyphicon glyphicon-edit"></i><span> Forms</span></a></li>
            <li><a class="ajax-link" href="${ctx}/views/chart.jsp"><i class="glyphicon glyphicon-list-alt"></i><span> Charts</span></a>
            </li>
            <li><a class="ajax-link" href="${ctx}/views/typography.jsp"><i class="glyphicon glyphicon-font"></i><span> Typography</span></a>
            </li>
            <li><a class="ajax-link" href="${ctx}/views/gallery.jsp"><i class="glyphicon glyphicon-picture"></i><span> Gallery</span></a>
            </li>
            <li class="nav-header hidden-md">Sample Section</li>
            <li><a class="ajax-link" href="${ctx}/views/table.jsp"><i
                        class="glyphicon glyphicon-align-justify"></i><span> Tables</span></a></li>
            <li class="accordion">
                <a href="#"><i class="glyphicon glyphicon-plus"></i><span> Accordion Menu</span></a>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">Child Menu 1</a></li>
                    <li><a href="#">Child Menu 2</a></li>
                </ul>
            </li>
            <li><a class="ajax-link" href="${ctx}/views/calendar.jsp"><i class="glyphicon glyphicon-calendar"></i><span> Calendar</span></a>
            </li>
            <li><a class="ajax-link" href="${ctx}/views/grid.jsp"><i
                        class="glyphicon glyphicon-th"></i><span> Grid</span></a></li>
            <li><a href="tour.html"><i class="glyphicon glyphicon-globe"></i><span> Tour</span></a></li>
            <li><a class="ajax-link" href="${ctx}/views/icon.jsp"><i
                        class="glyphicon glyphicon-star"></i><span> Icons</span></a></li>
            <li><a href="${ctx}/views/error.jsp"><i class="glyphicon glyphicon-ban-circle"></i><span> Error Page</span></a>
            </li>
            <li><a href="${ctx}/login.jsp"><i class="glyphicon glyphicon-lock"></i><span> Login Page</span></a>
            </li>
        </ul>
        <label id="for-is-ajax" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
    </div>
</div>