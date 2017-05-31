

<div class="col-sm-3 col-md-2 sidebar">
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
     <%@include file="../../assets/side_profile.jsp" %>
    <hr/>
    <!-- profile Sidebar -->


    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <li><a id="queueBtn"><i class="fa fa-users fa-lg"></i> Queue</a></li>
         
        <!--                <li><a id="missingBtn"><i class="fa fa-circle-o fa-lg"></i> Missing</a></li>-->
        <li><a id="searchBtn"><i class="fa fa-search fa-lg"></i> Search</a></li>
        <li><a id="settingBtn"><i class="fa fa-gear fa-lg"></i> Setting</a></li>

        <li><a href="./../Report/mcMain2.jsp"class="panelito"><i class="fa fa-file-text-o fa-lg"></i> Print MC</a></li>
         <li><a href="./../Report/timeSlipMain2.jsp" class="panelito"><i class="fa fa-file-text-o fa-lg"></i> Print Time Slip</a></li>
        <!-- // menu tanpa dropdown -->
        <hr/>
        <!-- Menu Specialist Panel -->
        <li class="active"><a href="#generic" role="tab" data-toggle="tab" class="panelito"><i class="fa fa-hospital-o fa-lg"></i> Generic SOAP</a></li>
        <li><a href="#orthopedic" role="tab" data-toggle="tab" class="panelito"><i class="fa fa-wheelchair fa-lg"></i> Orthopedic</a></li>
        <li><a href="#ong" role="tab" data-toggle="tab" class="panelito"><i class="fa fa-venus-mars fa-lg"></i> Obstetrics & Gynaecology</a></li>
        <!-- Menu Specialist Panel -->
    </ul>
</div>