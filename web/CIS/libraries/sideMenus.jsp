<%
    String gamba = "";
    String nama = "";
    String role = "";
    String namaHfc = "";

    if (session.getAttribute("USER_NAME") != null) {

        gamba = session.getAttribute("PICTURE").toString();
        nama = session.getAttribute("USER_NAME").toString();
        role = session.getAttribute("ROLE_NAME").toString();
        namaHfc = session.getAttribute("HFC_NAME").toString();
    }

%>

<div class="col-sm-3 col-md-2 sidebar">
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <div class="profile">
        <div class="profile-userpic">
            <img src="<%=gamba%>" class="img-responsive" alt="">
        </div>
        <!-- SIDEBAR USER TITLE -->
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">
                <%=nama%>
            </div>
            <div class="profile-usertitle-job">
                <%=role%>
            </div>
            @
            <div class="profile-usertitle-job">
                <%= namaHfc%>
            </div>
        </div>
        <!-- SIDEBAR BUTTONS -->
        <div class="profile-userbuttons">
            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href = '../Entrance/profile.jsp'">Manage Account</button>
        </div>
    </div>
    <hr/>
    <!-- profile Sidebar -->


    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <li><a id="queueBtn"><i class="fa fa-users fa-lg"></i> Queue</a></li>
        <!--                <li><a id="missingBtn"><i class="fa fa-circle-o fa-lg"></i> Missing</a></li>-->
        <li><a id="searchBtn"><i class="fa fa-search fa-lg"></i> Search</a></li>
        <li><a id="settingBtn"><i class="fa fa-gear fa-lg"></i> Setting</a></li>
        <!-- // menu tanpa dropdown -->
        <hr/>
        <!-- Menu Specialist Panel -->
        <li class="active"><a href="#generic" role="tab" data-toggle="tab" class="panelito"><i class="fa fa-hospital-o fa-lg"></i> Generic SOAP</a></li>
        <li><a href="#orthopedic" role="tab" data-toggle="tab" class="panelito"><i class="fa fa-wheelchair fa-lg"></i> Orthopedic</a></li>
        <!-- Menu Specialist Panel -->
    </ul>
</div>