<%-- 
    Document   : SideMenus
    Created on : Mar 28, 2017, 2:41:25 PM
    Author     : Mizi K (UI)
--%>


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
        <li><a href="HIS060001.jsp"><i class="fa fa-credit-card sideIcon" aria-hidden="true" ></i>Receive Order</a></li>   
        <li><a href="HIS060003.jsp"><i class="fa fa-check-square sideIcon" aria-hidden="true" ></i>Verify Result</a></li>   
        <li><a href="HIS060002.jsp"><i class="fa fa-code-fork " aria-hidden="true" ></i>RIS Procedure Maintenance</a></li>
        <li><a href="HIS060004.jsp"><i class="fa fa-usd " aria-hidden="true" ></i>Billing</a></li>
    </ul>  
</div>