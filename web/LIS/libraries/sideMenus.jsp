<%@page import="Config.Config"%>		
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
    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <li>
            <a  href="MainPage.jsp" >
                <i class="fa fa-shopping-cart fa-lg"></i> Lab Patient List Order
            </a>
        </li>
        <li>
            <a  href="ManageResult.jsp" >
                <i class="fa fa-flask fa-lg"></i> Receive Specimen
            </a>
        </li> 
        <li>
            <a  href="ManageTest.jsp" >
                <i class="fa fa-file-text fa-lg"></i> Manage Test
            </a>
        </li> 
        <li>
            <a  href="ManageTestCode.jsp" >
                <i class="fa fa-code fa-lg"></i> Manage Test Code
            </a>
        </li>



</div>  
