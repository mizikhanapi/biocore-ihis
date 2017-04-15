		
<%--<%@include file="../validateSession.jsp" %>--%>
<%
    String gamba ="";
    String nama = "";
    String role = "";
    String hfcName ="";
    String hfc_cd ="";
    String hfc_99 ="";
    String user_id="";
    String last_9="";
    
    if(session.getAttribute("USER_NAME") != null){
        
        
        gamba =session.getAttribute("PICTURE").toString();
        nama = session.getAttribute("USER_NAME").toString();
        role = session.getAttribute("ROLE_NAME").toString();
        hfcName = session.getAttribute("HFC_NAME").toString();
        
        hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        hfc_99 = (String) session.getAttribute("HFC_99");
        user_id = (String) session.getAttribute("USER_ID");
        
        last_9 = user_id.substring(user_id.length() - 1);
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
                                        @
                                        <div class="profile-usertitle-job">
						<%= hfcName%> (<%=hfc_cd%>)
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
				<li><a href="HIS010001.jsp"><i class="fa fa-search fa-lg"></i>Lookup Code Maintenance</a></li>
				<li><a href="HIS010002.jsp"><i class="fa fa-users fa-lg" ></i>Users Administration</a></li>
				<li><a href="HIS010003.jsp"><i class="fa fa-files-o fa-lg"></i>Queue Maintenance</a></li>
                                <li><a href="HIS010004.jsp"><i class="fa fa-hospital-o fa-lg"></i>Health Facility Maintenance</a></li>
                                <%
                                    if(last_9.equals("9") && hfc_99.equals("99_iHIS_99")){
                                %>
                                <li><a href="HIS010005.jsp"><i class="fa fa-desktop fa-lg"></i>System Code Maintenance</a></li>
                                <%
                                    }
                                %>
				<!-- // menu tanpa dropdown -->

				
            </ul>
        </div>
