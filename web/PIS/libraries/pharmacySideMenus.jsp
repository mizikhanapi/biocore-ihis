<div class="col-sm-3 col-md-2 sidebar">
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <div class="profile">
        <div class="profile-userpic">
            <img src="<%= session.getAttribute("PICTURE").toString()%>" class="img-responsive" alt="">
        </div>
        <!-- SIDEBAR USER TITLE -->
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">
                <%=session.getAttribute("USER_NAME").toString()%>
            </div>
            <div class="profile-usertitle-job">
                <%=session.getAttribute("ROLE_NAME").toString()%>
            </div>
        </div>
        <!-- SIDEBAR BUTTONS -->
        <div class="profile-userbuttons">
            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href='../Entrance/profile.jsp'">Manage Account</button>
        </div>
    </div>
    <hr/>
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <li><a href="manageInventory.jsp"><i class="fa fa-barcode fa-lg" aria-hidden="true" ></i>Manage Drug Inventory </a></li>
        <li><a href="patientOrderList.jsp"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true" ></i>Dispense Drug Order</a></li>   
        <li><a href="manageReport.jsp"><i class="fa fa-bar-chart fa-lg" aria-hidden="true" ></i>Report</a></li>
    </ul>  
</div>