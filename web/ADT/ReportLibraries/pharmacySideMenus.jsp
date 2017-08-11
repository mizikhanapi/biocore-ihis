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
        <li><a href="Dispense_Drug_Order"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true" ></i>Dispense Drug Order</a></li>
        <li><a href="Manage_Drug_Code"><i class="fa fa-table fa-lg" aria-hidden="true" ></i>Manage Drug Code </a></li>
        <li><a href="Manage_Drug_Stock"><i class="fa fa-recycle fa-lg" aria-hidden="true" ></i>Manage Drug Stock </a></li>
        <li><a href="Manage_Vendor"><i class="fa fa-book fa-lg" aria-hidden="true" ></i>Manage Vendor</a></li>
        <!-- Menu without dropdown -->

        <!-- Menu with dropdown -->
        <li  data-toggle="collapse" data-target="#Report" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="Report">
            <li><a data-toggle="modal" data-target="#" href="ATC_Drug_List">List Of ATC Drugs</a></li>
            <li><a data-toggle="modal" data-target="#" href="MDC_Drug_List">List Of MDC Drugs</a></li>
            <li><a data-toggle="modal" data-target="#" href="Supplier_List">List Of Supplier</a></li>
            <li><a data-toggle="modal" data-target="#" href="Pendding_Order_List">List Of Pending Order</a></li>
            <li><a data-toggle="modal" data-target="#" href="Pharmacy_Sales_List">Sales For Pharmacy</a></li>
        </ul> 
        <!-- Menu with dropdown -->
    </ul>  
</div>