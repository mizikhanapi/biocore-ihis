<%-- 
    Document   : sideMenus
    Created on : Mar 14, 2017, 8:11:58 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <li><a href="HIS080001.jsp"><i class="fa fa-usd fa-lg" aria-hidden="true"></i>Billing</a></li>
        <li><a href="HIS080002.jsp"><i class="fa fa-credit-card fa-lg " aria-hidden="true" ></i>Manage Bills</a></li>
        <li><a href="HIS080003.jsp"><i class="fa fa-asterisk fa-lg " aria-hidden="true" ></i>Miscellaneous</a></li>
        <li><a href="HIS080004.jsp"><i class="fa fa-sliders fa-lg " aria-hidden="true" ></i>Bill Parameter</a></li>
        <li><a href="HIS080005.jsp"><i class="fa fa-th-list fa-lg " aria-hidden="true" ></i>Report</a></li>
        <li><a href="HIS080006.jsp"><i class="fa fa-calendar fa-lg " aria-hidden="true" ></i>Year End Process</a></li>

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

