<%-- 
    Document   : radiologySideMenus
    Created on : Mar 28, 2017, 2:41:25 PM
    Author     : Shammugam
--%>
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
            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href='../Entrance/profile.jsp'">Manage Account</button>
        </div>
    </div>
    <hr/>
    <!-- profile Sidebar -->
    <ul class="nav nav-sidebar" id="side-menu">
        <li><a href="HIS060001.jsp"><i class="fa fa-credit-card sideIcon" aria-hidden="true" ></i>Receive Order</a></li>   
        <li><a href="HIS060002.jsp"><i class="fa fa-code-fork " aria-hidden="true" ></i>RIS Procedure Maintenance</a></li>
    </ul>  
</div>