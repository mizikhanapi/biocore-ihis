<%
    String gamba = "";
    String nama = "";
    String role = "";
    String hfcName = "";

    if (session.getAttribute("USER_NAME") != null) {

        gamba = session.getAttribute("PICTURE").toString();
        nama = session.getAttribute("USER_NAME").toString();
        role = session.getAttribute("ROLE_NAME").toString();
        hfcName = session.getAttribute("HFC_NAME").toString();
    }

%>

<div class="col-sm-3 col-md-2 sidebar">
    <div class="brand"></div>
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <div class="profile">
        <div class="profile-userpic">
            <img src="<%= gamba%>" class="img-responsive" alt="">
        </div>
        <!-- SIDEBAR USER TITLE -->
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">
                <%= nama%>
            </div>
            <div class="profile-usertitle-job">
                <%= role%>
            </div>
            @
            <div class="profile-usertitle-job">
                <%= hfcName%>
            </div>
        </div>
        <!-- SIDEBAR BUTTONS -->
        <div class="profile-userbuttons">
            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href = '../Entrance/profile.jsp'">Manage Account</button>
        </div>
    </div>
    <hr/>
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <!-- Menu without dropdown -->
        <li><a href="HIS040001.jsp"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true" ></i>Dispense Drug Order</a></li>
        <li><a href="HIS040002.jsp"><i class="fa fa-table fa-lg" aria-hidden="true" ></i>Manage Drug Code </a></li>
        <li><a href="HIS040003.jsp"><i class="fa fa-recycle fa-lg" aria-hidden="true" ></i>Manage Drug Stock </a></li>
        <li><a href="HIS040004.jsp"><i class="fa fa-book fa-lg" aria-hidden="true" ></i>Manage Vendor</a></li>
        <!-- Menu without dropdown -->

        <!-- Menu with dropdown -->
        <li  data-toggle="collapse" data-target="#Report" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="Report">
            <li><a data-toggle="modal" data-target="#" href="HIS040009.jsp">List Of ATC Drugs</a></li>
            <li><a data-toggle="modal" data-target="#" href="HIS040005.jsp">List Of MDC Drugs</a></li>
            <li><a data-toggle="modal" data-target="#" href="HIS040006.jsp">List Of Supplier</a></li>
            <li><a data-toggle="modal" data-target="#" href="HIS040007.jsp">List Of Pending Order</a></li>
            <li><a data-toggle="modal" data-target="#" href="HIS040008.jsp">Sales For Pharmacy</a></li>
        </ul> 
        <!-- Menu with dropdown -->
    </ul>  
</div>