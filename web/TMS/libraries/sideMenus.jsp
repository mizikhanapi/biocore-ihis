<%-- 
    Document   : radiologySideMenus
    Created on : Mar 28, 2017, 2:41:25 PM
    Author     : Shammugam
--%>

<div class="col-sm-3 col-md-2 sidebar">
    <div class="brand"></div>
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <%@include file="../side_profile.jsp" %>
    <hr/>
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <li><a href="home.jsp"><i class="fa fa-hospital-o" aria-hidden="true"></i>Health Facility</a></li>           
        <li><a href="personal.jsp"><i class="fa fa-user" aria-hidden="true"></i>Personal Information</a></li>           
        <li><a href="tenant_info.jsp"><i class="fa fa-building" aria-hidden="true"></i>Tenant Information</a></li>           
    </ul>  
</div>