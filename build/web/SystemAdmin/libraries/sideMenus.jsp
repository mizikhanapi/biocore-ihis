		
<%--<%@include file="../validateSession.jsp" %>--%>
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
                                    <img src="<%= gamba%>" class="img-responsive" alt="profile pic">
				</div>
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						<%=nama %>
					</div>
					<div class="profile-usertitle-job">
						<%= role%>
					</div>
				</div>
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
                                    <button type="button" class="btn btn-success btn-sm" onclick="window.location.href='../Entrance/profile.jsp'">Manage Account</button>
				</div>
		</div>
		<hr/>
		<!-- profile Sidebar -->
				
            <ul id="menu-content" class="nav nav-sidebar">
                <!-- // menu tanpa dropdown -->
				<li><a href="Lookup-Maintenance.jsp"><i class="fa fa-search fa-lg"></i>Lookup Code Maintenance</a></li>
				<li><a href="User_Administration_Maintenance.jsp"><i class="fa fa-users fa-lg" ></i>Users Administration</a></li>
				<li><a href="queue_1.html"><i class="fa fa-files-o fa-lg"></i>Queue Maintenance</a></li>
                                <li><a href="Health_Facility_Maintenance.jsp"><i class="fa fa-hospital-o fa-lg"></i>Health Facility Maintenance</a></li>
                                <li><a href="System_Maintenance.jsp"><i class="fa fa-desktop fa-lg"></i>System Code Maintenance</a></li>
				<!-- // menu tanpa dropdown -->

				
            </ul>
        </div>
