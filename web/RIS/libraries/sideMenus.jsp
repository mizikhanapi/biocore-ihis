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
            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href = '../Entrance/profile.jsp'">Manage Account</button>
        </div>
    </div>
    <hr/>

    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <!--<li>
<a href="Manage-RIS.html">
<i class="fa fa-search fa-lg"></i> Manage RIS Code
</a>
</li>
        <li>
<a href="order-RIS.html">
<i class="fa fa-users fa-lg"></i> Order RIS Procedure
</a>
</li> -->
        <li>
            <a href="receive-order.html">
                <i class="fa fa-files-o fa-lg"></i> Receive Order
            </a>
        </li>
        <!--<li>
<a href="modality.html">
<i class="fa fa-files-o fa-lg"></i> Modality
</a>
</li> -->
        <li>
            <a href="body-system.html">
                <i class="fa fa-files-o fa-lg"></i> Body System
            </a>
        </li>
        <li>
            <a href="RIS-procedure.html">
                <i class="fa fa-files-o fa-lg"></i> RIS Procedure
            </a>
        </li>

        <!-- // menu tanpa dropdown -->

        <!-- Menu with dropdown -->
        <!-- <li  data-toggle="collapse" data-target="#Subjective" class="collapsed active">
          <a href="#"><i class="fa fa-gift fa-lg"></i> Subjective <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="Subjective">
        <li><a data-toggle="modal" data-target="#squarespaceModal" href="">Complaints</a></li>
        </ul> -->
        <!-- Menu with dropdown -->
    </ul>
</div>