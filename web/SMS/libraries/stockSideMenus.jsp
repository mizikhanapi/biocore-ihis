<%@page import="ADM_helper.MySession"%>
<%@page import="Config.Config"%>	
<%
    String roleCode = session.getAttribute("ROLE_CODE").toString();
    String hfcCD = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String userID = session.getAttribute("USER_ID").toString();

    String adminCS = "CS01";
    String systemAdmin = "001";

    MySession superUser = new MySession(userID, hfcCD);
%>
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
        <li class="active"><a href="Order_Stock"><i class="fa fa-plus fa-lg" aria-hidden="true" ></i>Order Stock</a></li>
            <%            if (roleCode.equalsIgnoreCase(adminCS) || superUser.isSuperUser() == true) { %>
        <li><a href="Distribution_Stock_Order"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true" ></i>Stock Distribution</a></li>
        <li><a href="Manage_Stock_Quantity"><i class="fa fa-recycle fa-lg" aria-hidden="true" ></i>Manage Stock Receipt</a></li>
        
        <li><a href="Manage_VendorS"><i class="fa fa-book fa-lg" aria-hidden="true" ></i>Manage Vendor</a></li>
            <% } %>
        
        <%
            if (roleCode.equalsIgnoreCase(adminCS) || superUser.isSuperUser() == true) { %>
                <li  data-toggle="collapse" data-target="#ManageCode" class="collapsed active">
                    <a href="#"><i class="fa fa-table fa-lg" aria-hidden="true" ></i> Manage Code <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="ManageCode">
                    <li><a href="Manage_Stock_Code">Manage Stock Code</a></li>
                    <li><a href="Manage_Drug_Stock_Code">Manage Drug Code</a></li>
                </ul>
        <%    }else{ %>
                <li  data-toggle="collapse" data-target="#ManageCode" class="collapsed active">
                    <a href="#"><i class="fa fa-table fa-lg" aria-hidden="true" ></i> View Code <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="ManageCode">
                    <li><a href="Manage_Stock_Code">View Stock Code</a></li>
                    <li><a href="Manage_Drug_Stock_Code">View Drug Code</a></li>
                </ul>
        <%     }
        %>
        
        <li><a href="Stock_Past_Order"><i class="fa fa-history sideIcon" aria-hidden="true"></i>Past Completed Order</a></li>
        <li><a href="Stock_Adjustment"><i class="fa fa-book fa-lg" aria-hidden="true" ></i>Stock Adjustment</a></li>
        <li  data-toggle="collapse" data-target="#Report" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="Report">
            <li><a data-toggle="modal" data-target="#" href="List_Of_Category">List Of Category</a></li>
            <li><a data-toggle="modal" data-target="#" href="List_Of_Items">List Of Item</a></li>
            <li><a data-toggle="modal" data-target="#" href="List_Of_Vendor">List Of Vendor</a></li>
            <li><a data-toggle="modal" data-target="#" href="Sales_For_Stock">Sales For Stock</a></li>
            <li><a data-toggle="modal" data-target="#" href="Stock_adjust_report">Stock Adjustment Report</a></li>
            <li><a data-toggle="modal" data-target="#" href="Stock_distribute_report">Stock Distribution Report</a></li> 
        </ul> 
        
    </ul>  

</div>