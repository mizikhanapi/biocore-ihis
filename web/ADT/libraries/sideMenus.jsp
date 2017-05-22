<%@page import="Config.Config"%>


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



    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <li>
            <a  href="HIS070001.jsp" >
                <i class="fa fa-bed fa-lg"></i> Manage In-Patient
            </a>
        </li>

        <li>
            <a type="button" data-toggle="modal" data-target="#queueModal" id="queue">
                <i class="fa fa-users fa-lg"></i> List Of Admission
            </a>
        </li>
        <li>
            <a  href="HIS070005.jsp" >
                <i class="fa fa-briefcase fa-lg"></i> List of Discharge Inpatient
            </a>
        </li>
  <hr/>
        <li>
            <a  href="HIS070002.jsp" >
                <i class="fa fa-briefcase fa-lg"></i> Ward Occupancy
            </a>
        </li>
        <li><a  href="HIS070003.jsp" ><i class="fa fa-briefcase fa-lg"></i> Maintain Ward Code </a> </li>


        <li>
            <a  href="HIS070004.jsp" >
                <i class="fa fa-bed fa-lg"></i> Bed Booking Master Summary
            </a>
        </li>

        <li>
            <a href="HIS070006.jsp">
                <i class="fa fa-bar-chart fa-lg" aria-hidden="true" >
                    
                </i>Report</a>
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
