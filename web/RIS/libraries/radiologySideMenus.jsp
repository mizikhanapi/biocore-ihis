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
        <li><a id="aReceiveOrder" href="ReceiveOrder"><i class="fa fa-credit-card sideIcon" aria-hidden="true" ></i>Receive Order</a></li>   
        <li><a id="aVerifyResult" href="VerifyResult"><i class="fa fa-check-square sideIcon" aria-hidden="true" ></i>Verify Result</a></li>   
        <li><a id="aManageCode" href="Procedure"><i class="fa fa-code-fork " aria-hidden="true" ></i>Manage RIS Code</a></li>
        <li><a id="aBill" href="Bill"><i class="fa fa-usd " aria-hidden="true" ></i>Post to Bill</a></li>
        <li id="aReportMain" data-toggle="collapse" data-target="#Report" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="caret"></span></a>
            <ul class="sub-menu collapse" id="Report" aria-expanded="true" style="">
                <li><a id="aReportProcedure" data-toggle="modal" data-target="#" href="ListProcedure">List of Procedure</a></li>
                <li><a id="aReportListOrder" data-toggle="modal" data-target="#" href="ListOrder">List of Order</a></li>
                <li><a id="aReportRadiology" data-toggle="modal" data-target="#" href="ListSale">Sales of Radiology</a></li>
            </ul>
        </li>
        <li><a id="aPastOrder" href="PastOrder"><i class="fa fa-history sideIcon" aria-hidden="true"></i>Past Completed Order</a></li>

    </ul>  
</div>