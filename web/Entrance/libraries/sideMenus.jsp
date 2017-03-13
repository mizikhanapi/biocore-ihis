<%-- 
    Document   : sideMenus
    Created on : Mar 10, 2017, 12:52:51 AM
    Author     : user
--%>

<%
    String gamba ="";
    String nama = "";
    String role = "";
    
    if(session.getAttribute("USER_NAME") != null){
        
        
        gamba =session.getAttribute("PICTURE").toString();
        nama = session.getAttribute("USER_NAME").toString();
        role = session.getAttribute("ROLE_NAME").toString();
    }

%>

<div class="col-sm-3 col-md-2 sidebar" id="style-3">
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <div class="profile">
        <div class="profile-userpic">
            <img id="proPic" src="<%= gamba%>" class="img-responsive" alt="">
        </div>
        <!-- SIDEBAR USER TITLE -->
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">
                <%= nama%>
            </div>
            <div class="profile-usertitle-job">
                <%= role%>
            </div>
        </div>
        <!-- SIDEBAR BUTTONS -->
        <!--				<div class="profile-userbuttons">
                                                <button type="button" class="btn btn-success btn-sm">Manage Account</button>
                                        </div>-->
    </div>
    <hr/>

</div>

