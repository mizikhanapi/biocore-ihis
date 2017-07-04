

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
        <li><a id="queueBtn"><i class="fa fa-users fa-lg"></i> Queue</a></li>
        <li><a id="searchBtn"><i class="fa fa-search fa-lg"></i> Search</a></li>
<!--        <li><a href="#order-entry" role="presentation" data-toggle="tab" class="panelito"><i class="fa fa-medkit fa-lg"></i>Order Entry</a></li>
        <li><a id="settingBtn"><i class="fa fa-gear fa-lg"></i> Setting</a></li>
        <li><a href="./../Report/mcMain2.jsp"class="panelito"><i class="fa fa-print fa-lg"></i> Print MC</a></li>
        <li><a href="./../Report/timeSlipMain2.jsp" class="panelito"><i class="fa fa-print fa-lg"></i> Print Time Slip</a></li>-->
        
        <!-- // menu tanpa dropdown -->
        <hr/>

        <!-- Menu Specialist Panel -->



        <li><a href="#generic-soap" role="presentation" data-toggle="tab" class="panelito"><i class="fa fa-angle-right fa-lg"></i> Primary Care</a></li>
        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-angle-right fa-lg"></i> Orthopedic <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="#orthopedic-con" role="presentation" data-toggle="tab" class="panelito">Consultation</a></li>
                <li><a href="#orthopedic-nur" role="presentation" data-toggle="tab" class="panelito">Nursing</a></li>
                <li><a href="#orthopedic-niw" role="presentation" data-toggle="tab" class="panelito">Nursing in Ward</a></li>
                <li><a href="#orthopedic-ot" role="presentation" data-toggle="tab" class="panelito">Operation Theater</a></li>
            </ul>
        </li>
        <li><a href="#ong" role="tab" data-toggle="tab" class="panelito"><i class="fa fa-angle-right fa-lg"></i> Obstetrics & Gynaecology</a></li>

        <!-- Menu Specialist Panel -->

    </ul>
</div>