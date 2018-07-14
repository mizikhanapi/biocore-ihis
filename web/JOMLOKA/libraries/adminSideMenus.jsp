<%-- 
    Document   : adminSideMenus
    Created on : Apr 15, 2018, 9:18:25 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-sm-3 col-md-2 sidebar">
    <div class="brand"></div>
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <%@include file="../../assets/side_profile.jsp" %>
    <hr/>
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <li><a href="Admin"><i class="fa fa-hospital-o sideIcon" aria-hidden="true" ></i>Manage Tenant Application</a></li>   
        
    </ul>  
</div>
