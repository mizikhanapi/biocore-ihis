<%-- 
    Document   : facility
    Created on : Jan 13, 2017, 11:27:07 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    if (session.getAttribute("USER_ID") == null) {
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- header -->
<%@include file = "../assets/header.html" %>
<link href="../assets/css/login.css" rel="stylesheet">
<!-- header -->
</head> 
<body>
 <div class="container">
     <div class="" >
         <div class="card card-container" >
             <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
             <div class="profile-img-card">
                 <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
             </div>
             <h2 style="text-align: center;">Clinical Support System</h2>
             <p id="profile-name" class="profile-name-card">Please select to continue</p>
             <form class="form-signin" action="dashboard.jsp">
                 <span id="reauth-email" class="reauth-email"></span>
                 <select class="form-control select-full">
                     <option>Healthcare Facility</option>
                     <option>---</option>
                 </select>
                 <select class="form-control select-full">
                     <option>Discipline</option>
                     <option>---</option>
                 </select>
                 <select class="form-control select-full">
                     <option>Sub-Discipline</option>
                     <option>---</option>
                 </select>

                 <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Submit</button>
             </form><!-- /form -->
             <a href="#" class="" type="submit">Change Account</a>
             <a href="destroySession.jsp" class="pull-right" type="submit">Log Out</a>
         </div>

        </div><!-- /card-container -->
    </div><!-- /container -->
	
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--
	<script>
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();   
	});
	</script>
    -->
	
    <%@include file="../libraries/script.html"%>
	
	<!--<script src="http://www.w3schools.com/lib/w3data.js"></script>-->
      
	<script>
	
        
        console.log("<%=session.getAttribute("HEALTH_FACILITY_CODE").toString()%>");
        console.log("<%=session.getAttribute("PAGE_CODE").toString()%>");
        console.log("<%=session.getAttribute("SYSTEM_CODE").toString()%>");
        console.log("<%=session.getAttribute("MODULE_CODE").toString()%>");
        console.log("<%=session.getAttribute("HFC_NAME").toString()%>");
        console.log("<%=session.getAttribute("USER_NAME").toString()%>");
        console.log("<%=session.getAttribute("DISCIPLINE_CODE").toString()%>");
        console.log("<%=session.getAttribute("SUB_DISCIPLINE_CODE").toString()%>");
	</script>
</body>
</html>
