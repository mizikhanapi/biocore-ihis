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
    <%@include file="../../assets/side_profile.jsp" %>
    <hr/>
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <li><a href="HIS180001.jsp"><i class="fa fa-credit-card sideIcon" aria-hidden="true" ></i>Receive Order</a></li>   
        <li><a href="HIS180002.jsp"><i class="fa fa-code-fork " aria-hidden="true" ></i>Procedure Maintenance</a></li>
        <li><a href="HIS180003.jsp"><i class="fa fa-usd " aria-hidden="true" ></i>Billing</a></li>
        <li data-toggle="collapse" data-target="#Report" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="arrow"></span></a>
            <ul class="sub-menu collapse" id="Report" aria-expanded="true" style="">
                <li><a data-toggle="modal" data-target="#" href="list_procedure_cd.jsp">List of Procedure Code</a></li>
                <li><a data-toggle="modal" data-target="#" href="list_pending_order.jsp">List of Order</a></li>
                <li><a data-toggle="modal" data-target="#" href="list_OfSale.jsp">Procedure Sale</a></li>
            </ul>
        </li>
    </ul>  
</div>