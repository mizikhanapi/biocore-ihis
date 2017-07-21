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
            <a  href="Order_list" >
                <i class="fa fa-shopping-cart fa-lg"></i> Lab Patient List Order
            </a>
        </li>
        <li>
            <a  href="Receive_Specimen" >
                <i class="fa fa-flask fa-lg"></i> Receive Specimen
            </a>
        </li> 
        <li>
            <a  href="Manage_Test" >
                <i class="fa fa-file-text fa-lg"></i> Verify Specimen for Test
            </a>
        </li>
        <li>
            <a  href="Post_To_Bill" >
                <i class="fa fa-file-text fa-lg"></i> Post To Bill
            </a>
        </li>
        <li>
            <a  href="Maintain_Test_Code" >
                <i class="fa fa-code fa-lg"></i> Manage Test Code
            </a>
        </li>



</div>  
