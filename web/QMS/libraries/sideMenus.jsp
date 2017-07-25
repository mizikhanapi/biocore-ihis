		
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
				
				<li><a href="index.jsp"><i class="fa fa-files-o fa-lg"></i>Queue Maintenance</a></li>
                                
				<!-- // menu tanpa dropdown -->

				
            </ul>
        </div>
