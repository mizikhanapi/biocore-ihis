<%@page import="ADM_helper.MySession"%>
<%@page import="Config.Config"%>	


<%

        String roleCode = session.getAttribute("ROLE_CODE").toString();
        String hfcCD = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String userID = session.getAttribute("USER_ID").toString();

        String pharmacy = "007";
        String systemAdmin = "001";

        MySession superUser = new MySession(userID, hfcCD);
        
        String parameterPIS = session.getAttribute("PIS_PARAM").toString();


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
        <!-- Menu without dropdown -->
        
        <%    
        
            if (parameterPIS.equalsIgnoreCase("2")) {
                
        %>
        <li>
            <a href="Screening_Drug_Order" id="PISPage1"><i class="fa fa-filter fa-lg" aria-hidden="true" ></i>Screening Drug Order</a>
        </li>
        <li>
            <a href="Dispense_Drug_Order" id="PISPage2"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true" ></i>Dispense Drug Order</a>
        </li>
        
        <%            }%>

        
        <%    
        
            if (parameterPIS.equalsIgnoreCase("1")) {
                
        %>
        <li>
            <a href="Dispense_Drug_Order_Disabled" id="PISPage3"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true" ></i>Dispense Drug Order</a>
        </li>           
        
        <%            }%>
        
        <li><a href="Manage_Drug_Code" id="PISPage4"><i class="fa fa-table fa-lg" aria-hidden="true" ></i>Manage Drug Code </a></li>
        <li><a href="Manage_Drug_Stock" id="PISPage5"><i class="fa fa-recycle fa-lg" aria-hidden="true" ></i>Manage Drug Stock </a></li>
        <li><a href="Manage_Vendor" id="PISPage6"><i class="fa fa-book fa-lg" aria-hidden="true" ></i>Manage Vendor</a></li>
        <!-- Menu without dropdown -->

        <!-- Menu with dropdown 2 -->
        <li  data-toggle="collapse" data-target="#Report" class="collapsed active"  id="PISPage8">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="Report">
            <li><a data-toggle="modal" data-target="#" href="ATC_Drug_List" id="PISPage8R1">List Of Category Codes</a></li>
            <li><a data-toggle="modal" data-target="#" href="MDC_Drug_List" id="PISPage8R2">List Of Pharmacy Drugs</a></li>
            <li><a data-toggle="modal" data-target="#" href="Supplier_List" id="PISPage8R3">List Of Supplier</a></li>
            <li><a data-toggle="modal" data-target="#" href="Drug_Reorder_Level_List" id="PISPage8R4">List Of Drugs Below Reorder Level</a></li>
            <li><a data-toggle="modal" data-target="#" href="Drug_Minimum_Level_List" id="PISPage8R5">List Of Drugs Below Minimum Level</a></li>
            <li><a data-toggle="modal" data-target="#" href="Incomplete_Order_List" id="PISPage8R6">List Of Incomplete Order</a></li>
            <li><a data-toggle="modal" data-target="#" href="Pharmacy_Sales_List" id="PISPage8R7">Sales For Pharmacy</a></li>
        </ul> 
        <!-- Menu with dropdown 2 -->

        <li><a href="Pharmacy_Past_Order" id="PISPage7"><i class="fa fa-history sideIcon" aria-hidden="true"></i>Past Completed Order</a></li>


        <%            

            if (roleCode.equalsIgnoreCase(systemAdmin) || roleCode.equalsIgnoreCase(pharmacy) || superUser.isSuperUser() == true) {

        %>
        <!-- Menu with dropdown 3 -->
        <li  data-toggle="collapse" data-target="#Management" class="collapsed active"  id="PISPage9">
            <a href="#"><i class="fa fa-file-archive-o fa-lg"></i> Data Management <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="Management">
            <li><a data-toggle="modal" data-target="#" href="Archive_Order" id="PISPage9R1">Archive Order</a></li>
        </ul> 
        <!-- Menu with dropdown 3 -->

    </ul>  

    <%            }%>
</div>