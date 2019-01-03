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
            <a  href="HIS070001.jsp" id="ADTPageOne">
                <i class="fa fa-bed fa-lg"></i> Manage In-Patient
            </a>
        </li>
        <li>
            <a type="button" data-toggle="modal" data-target="#queueModal" id="queue">
                <i class="fa fa-users fa-lg"></i> List Of Admission
            </a>
        </li>
          <hr/>
        
        <li>
            <a  href="HIS070002.jsp" id="ADTPageTwo">
                <i class="fa fa-briefcase fa-lg"></i> Ward Occupancy
            </a>
        </li>

        <li>
            <a  href="HIS070005.jsp" id="ADTPageThree">
                <i class="fa fa-users fa-lg"></i> List of Discharge Inpatient
            </a>
        </li>

        <hr/>

        <!--        <li>
                    <a  href="HIS070007.jsp" >
                        <i class="fa fa-th-list fa-lg"></i> Eligibility Table
                    </a>
                </li>-->
        <li><a  href="HIS070003.jsp" id="ADTPageFour"><i class="fa fa-wrench fa-lg"></i> Maintain Ward Code </a> </li>

        <li><a  href="HIS070008.jsp" id="ADTPageFive"><i class="fa fa-usd fa-lg"></i> Maintain Hospital Charges </a> </li>

        
        
        
        <!-- Menu with dropdown -->
        <li  data-toggle="collapse" id="ADTPageSeven" data-target="#ReportDrop" class="collapsed active">
            <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Report <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="ReportDrop">
            <li><a href="Admission_List" id="ADTPageSevenR1">List Of Admission</a></li>
            <li><a href="Discharge_List" id="ADTPageSevenR2">List Of Discharge</a></li>
            <li><a href="Summary_Of_Health_Workers_Workload" id="ADTPageSevenR3">Summary Of Health Workers Workload</a></li>
            <li><a href="List_Of_Ward_Occupancy" id="ADTPageSevenR4">List Of Ward Occupancy</a></li>
           
        </ul> 
        <!-- Menu with dropdown -->
        
        <li>
            <a  href="HIS070004.jsp" id="ADTPageSix">
                <i class="fa fa-bed fa-lg"></i> Bed Booking Master Summary
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
