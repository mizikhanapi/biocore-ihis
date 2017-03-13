<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>


<%
    Conn conn = new Conn();
   
    Config.getFile_url(session);
    Config.getBase_url(request);


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
         <%@include file="../assets/header.html"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/jquery.min.js"></script>
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  
        
    </head>
    <body>
        
         <div class="container-fluid">
            <div class="row">   		
            <!-- menu side -->		
            <%@include file = "libraries/sideMenus.jsp" %>
            <!-- menu side -->

            <!-- main -->		
            <div class="main" style="background: #f2f4f8;">
                <!-- menu top -->
                <%@include file = "libraries/topMenus.html" %>
                <!-- menu top -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">


                            <!-- Tab Menu -->

                            <div class="tabbable-panel">
                                <div class="tabbable-line">
                                    <ul class="nav nav-tabs ">
                                        <li class="active">
                                            <a href="#tab_default_1" data-toggle="tab">
                                                Recieve Order </a>
                                        </li>

                                    </ul>
                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">

                                            
                             <table id="orderRecieve"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <%
                              // Statement st = con.createStatement();
                             //  ResultSet resultset = 
                              // st.executeQuery("SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO");
                              //Conn conn = new Conn();       
                              String sqlPatientApp = "SELECT om.order_no, OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.EPISODE_DATE,OM.ORDER_BY,OM.HFC_CD,OM.ORDER_STATUS FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO AND OM.ORDER_STATUS='0'";    
                              ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);

                        %>
                        <thead>
                            <tr>
                                <th class="col-sm-1">Order No</th>
                                <th class="col-sm-1">PMI No</th>
                                <th class="col-sm-1">Patient Name</th>
                                <th class="col-sm-1">Order date</th>		
                                <th class="col-sm-1">Episode date</th>
                                <th class="col-sm-1">Requester Name</th>
                                <th class="col-sm-1">Requester Location</th>
                                <th class="col-sm-1">Order Detail</th>
                            </tr>
                        </thead>
                        <tbody>
           
                        <%if (dataPatientApp.size() > 0) 
                          {
                              for (int i = 0; i < dataPatientApp.size(); i++) 
                          {%>
                          <tr>
                              <td><%=dataPatientApp.get(i).get(0)%></td>
                              <td><%=dataPatientApp.get(i).get(1)%></td>
                              <td><%=dataPatientApp.get(i).get(2)%></td>
                              <td><%=dataPatientApp.get(i).get(3)%></td>
                              <td><%=dataPatientApp.get(i).get(4)%></td>
                              <td><%=dataPatientApp.get(i).get(5)%></td>
                              <td><%=dataPatientApp.get(i).get(6)%></td>
                              <td><a href='view_order.jsp?pmi=<%=dataPatientApp.get(i).get(1)%> &order_no=<%=dataPatientApp.get(i).get(0)%>' class='btn btn-primary btn' ><span class='glyphicon glyphicon-'></span>View</a></td> 
                          </tr>
                     <%
                      }}
                     %>
                     </tbody>
                  </table>
                                                
                            
                                           



                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tab Menu -->

                        </div>
                    </div>
                </div>

            </div>

        </div>
              
            
             </div> 
        <script type="text/javascript" charset="utf-8">
   $(document).ready(function() {
    $('#orderRecieve').DataTable();
} );
    </script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        
         <script>
        w3IncludeHTML();

        $(document).ready(function () {
            //$("#WardOccupancy").load("WardOccupancy.jsp");
            //$("#RecieveOderTable").load("RecieveOder-Table.jsp");
            
            
            $("#headerindex").load("libraries/header.html");
            $("#topmenuindex").load("libraries/topMenus.html");
            $("#sidemenus").load("libraries/sideMenus.jsp");
//                $("#WardOccupancyTable").load("WardOccupancy-Table.jsp");

        });

    </script>
    </body>
</html>
