<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<% if (session.getAttribute("USER_ID") == null) {
        response.sendRedirect("index.jsp");
    }%>
    
<%
    String modules = session.getAttribute("MODULE_CODE").toString();
    
    
    ArrayList<String> arrayModule = new  ArrayList<>(Arrays.asList(modules.split("\\|")));
    
    boolean mod01, mod02, mod03, mod04, mod05, mod06, mod07, mod08, mod09, mod10, mod11, mod12, mod13, mod14, mod15, mod16, mod17; 
    
    mod01= mod02= mod03= mod04= mod05= mod06= mod07= mod08= mod09= mod10= mod11= mod12= mod13= mod14= mod15= mod16= mod17 = false;
    
    for(int i = 0; i<arrayModule.size(); i++){
        
        if(arrayModule.get(i).equalsIgnoreCase("01")){
        
            mod01 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("02")){
            
            mod02 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("03")){
            
            mod03 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("04")){
            
            mod04 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("05")){
            
            mod05 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("06")){
            
            mod06 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("07")){
            
            mod07 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("08")){
            
            mod08 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("09")){
            
            mod09 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("10")){
            
            mod10 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("11")){
            
            mod11 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("12")){
            
            mod12 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("13")){
            
            mod13 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("14")){
            
            mod14 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("15")){
            
            mod15 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("16")){
            
            mod16 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("17")){
            
            mod17 = true;
            
        }
    }
    
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
    <%@include file="libraries/header.html"%>
    <!-- header -->

</head>

<body>
    <!-- menu top -->
    <%@include file="libraries/topMenus.jsp"%>
    <!-- menu top -->

    <div class="container-fluid">
        <div class="row">       
            <!-- menu side -->		
            <%@include file="libraries/sideMenus.html"%>
            <!-- menu side -->	

            <!-- main -->		
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                <div class="row">
                    <%
                        if(mod01){
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-users" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Human Resources</h3>
                            </div>
                        </a>
                    </div>
                    <%
                      }
                      
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-calendar" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Patient Appointment</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-stethoscope" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Medical Checkup</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        if(mod01){
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-cogs" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>SNOMED Maintenance</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                    %>
                </div>

                <div class="row">
                    <%
                        if(mod08){
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-credit-card" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Billing System</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                            
                        if(mod03){
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-user" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Patient Management System</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-user-md" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Patient Consultation</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        if(mod04){
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-medkit" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Pharmacy Info System</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                    %>
                </div>

                <div class="row">
                    <%
                        if(mod11){
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-file-text" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Reports</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-database" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Data Management</h3>
                            </div>
                        </a>
                    </div>
                    
                    <%
                        if(mod07){
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-bed" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Admit, Discharge & Transfer System</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                            
                        if(mod01){
                    %>
                    <div class="col-md-3">
                        <a href="SystemAdmin/Lookup-Maintenance.jsp" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-desktop" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>System Administration</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                    %>
                </div>

                <div class="row">
                    <%
                        if(mod17){
                    %>
                    <div class="col-md-3">
                        <a href="#" class="thumbnail">
                            <div class="kotak text-center">
                                <i class="fa fa-check-square-o" aria-hidden="true" style="color: #333; font-size: 4em;"></i>
                                <h3>Procedure Order System</h3>
                            </div>
                        </a>
                    </div>
                    <%
                        }
                    %>
                </div>

            </div>

        </div>
        <!-- main -->		

    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<div w3-include-html="libraries/script.html"></div>

<!--<script src="http://www.w3schools.com/lib/w3data.js"></script>-->
<script src="assets/js/w3data.js" type="text/javascript"></script>

<script type ="text/javascript">
   console.log("<%=arrayModule.size()%>");
   console.log("<%= modules%>");
   console.log("<%= arrayModule%>");
   
 


</script>
</body>
</html>
