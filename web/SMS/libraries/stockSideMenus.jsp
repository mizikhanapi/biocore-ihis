<%@page import="ADM_helper.MySession"%>
<%@page import="Config.Config"%>	

<div class="col-sm-3 col-md-2 sidebar" id="style-3">
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
        <!-- Menu without dropdown -->
        <li><a href="Distribution_Stock_Order"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true" ></i>Distribute Stock Order</a></li>
        <li><a href="Manage_Stock_Code"><i class="fa fa-table fa-lg" aria-hidden="true" ></i>Manage Stock Code</a></li>
        <li><a href="Manage_Stock_Quantity"><i class="fa fa-recycle fa-lg" aria-hidden="true" ></i>Manage Stock Quantity</a></li>
        <!-- Menu without dropdown -->

    </ul>  

</div>