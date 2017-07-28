

<div class="col-sm-3 col-md-2 sidebar" id="style-3">
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
        <li><a id="btnCIS_MAIN_QUEUE"><i class="fa fa-users fa-lg"></i> Queue</a></li>
        <li><a id="searchBtn"><i class="fa fa-search fa-lg"></i> Search</a></li>
        <li class="hidden"><a id="settingBtn"><i class="fa fa-gear fa-lg"></i> Setting</a></li>
        <li><a href="./../Report/mcMain2.jsp"class="panelito"><i class="fa fa-calendar fa-lg"></i> Print MC</a></li>
        <li><a href="./../Report/timeSlipMain2.jsp" class="panelito"><i class="fa fa-clock-o fa-lg"></i> Print Time Slip</a></li>

        <!-- // menu tanpa dropdown -->
        <hr/>

        <!-- Menu Specialist Panel -->


        <li><a href="" role="presentation" data-toggle="tab" class="panelito general-exam"><i class="fa fa-angle-right fa-lg"></i> General Examination</a></li>

        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-angle-right fa-lg"></i> Orthopedic <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a class="panelito ortho-niward">Nursing</a></li>
                <li><a class="panelito ortho-opthe">Operation Theater</a></li>
            </ul>
        </li>
        <li><a href="#ong" role="tab" data-toggle="tab" class="panelito"><i class="fa fa-angle-right fa-lg"></i> Obstetrics & Gynaecology</a></li>

        <!-- Menu Specialist Panel -->

    </ul>
</div>