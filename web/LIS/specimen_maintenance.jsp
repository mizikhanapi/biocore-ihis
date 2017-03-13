<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
<%@page import="dbConn1.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
         <%@include file="Header.jsp"%>
       
    </head>
    <body>
         <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-md-offset-1" style="margin-top: 2%; margin-bottom: 2%">
                    <img src="bootstrap-3.3.6-dist/image/posterHeader.jpg" width="1600" height="250">
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 col-md-offset-1 " style="padding-top: 0.5%;">       
                </div>
                <div class="col-md-5 text-right">
                    <button class="btn btn-info buttonAuthenticate" onclick="window.location.href = 'destroySession.jsp'">Log out</button>
                </div>
            </div>   
            <div class="row">
                <div class="col-md-2 col-md-offset-1 col-sm-12 col-xs-12 bodyContent">
                    <h3 class="headerTitle">Categories</h3>
                    <hr>
                 <nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="MainPage.jsp">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
        <li ><a href="#">View Order<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>        
        <li ><a href="#">Order test<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></a></li>
         <li class="dropdown" id="tab"><a class="dropdown-toggle" data-toggle="dropdown">Maintenance test<span class="caret"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
            <li><a href="Maintain_test_Category.jsp">Maintain test category</a></li>
            <li class="divider"></li>
            <li><a href="Maintain_Test_Detail.jsp">Maintain test detail</a></li>
          </ul>
         </li>
        <li ><a href="specimen_maintenance.jsp">Specimen Maintenance<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
                </div>   
                          <div class="col-md-8 col-sm-12 col-xs-12 bodyContent">
                    <div class="tab-content">
                        <div id="home" class="tab-pane active">
                            <h3 class="headerTitle">Specimen Maintenance</h3>
                           <hr>                  
         <table id="orderRecieve"  class="table table-striped table-bordered" cellspacing="0" width="100%">
             <%
               // Statement st = con.createStatement();
              //  ResultSet resultset = 
               // st.executeQuery("SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO");
               Conn conn = new Conn();       
               String sqlPatientApp = "SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO";
               ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);             
         %>
        <thead>
            <tr>
                <th class="col-sm-1">Order No</th>
                <th class="col-sm-1">PMI No</th>
                <th class="col-sm-1">Patient Name</th>
                <th class="col-sm-1">Order date</th>				 
                <th class="col-sm-1">HFC</th>
                <th class="col-sm-1">Episode date</th>
                <th class="col-sm-1">Order by</th>
                <th class="col-sm-1">View</th>
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
     <script type="text/javascript" charset="utf-8">
   $(document).ready(function() {
    $('#orderRecieve').DataTable();
} );
    </script>
                        </div> 
                        </div> 
                              </div> 
                        </div>
             </div> 
    </body>
</html>
