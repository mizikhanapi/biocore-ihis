		
<%@page import="ADM_helper.MySession"%>
<%--<%@include file="../validateSession.jsp" %>--%>
<%
   
    String hfc_cd ="";
    String hfc_99 ="";
    String user_id="";
    String last_9="";
    
    if(session.getAttribute("USER_NAME") != null){
          
        hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        hfc_99 = (String) session.getAttribute("HFC_99");
        user_id = (String) session.getAttribute("USER_ID");
        
        last_9 = user_id.substring(user_id.length() - 1);
    }
    
    MySession adm_sideMenus_mys = new MySession(user_id, hfc_99);

%>
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
				<li><a href="Lookup"><i class="fa fa-search fa-lg"></i>Lookup Code Maintenance</a></li>
				<li><a href="UserManagement"><i class="fa fa-users fa-lg" ></i>Users Administration</a></li>
<!--				<li><a href="QueueManagement"><i class="fa fa-files-o fa-lg"></i>Queue Maintenance</a></li>-->
                                <li><a href="HealthFacilityManagement"><i class="fa fa-hospital-o fa-lg"></i>Health Facility Maintenance</a></li>
                                <li><a href="Setting"><i class="fa fa-cog fa-lg"></i>Settings</a></li>
                                <li><a href="Report"><i class="fa fa-bar-chart fa-lg"></i>Report</a></li>
                                <%
                                    if(adm_sideMenus_mys.isSuperUser()){
                                %>
                                <li><a href="System"><i class="fa fa-desktop fa-lg"></i>System Code Maintenance</a></li>
                                <%
                                    }
                                %>
				<!-- // menu tanpa dropdown -->

				
            </ul>
        </div>
