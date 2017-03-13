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
          <script>
                        function a() 
                        {
                            <%
                            try
                            {
                                String error = request.getParameter("error");
                                if (error != null) 
                                {
                                    %>
                                    alert('<%=error %>');
                                    location.href = 'MainPage.jsp';
                                    <%
                                }
                            } 
                            catch (Exception e) 
                            {
                            }
                            %>
                        }
                    </script>
                   <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
                   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
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
        <li ><a href="LIS_Order_Detail.jsp">LIS Order Detail<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
                </div>   
                
                    <div class="col-md-8 col-sm-12 col-xs-12 bodyContent">
                    <div class="tab-content">
                        <div id="home" class="tab-pane active">
                            <h3 class="headerTitle">Collect Specimen</h3>
                                <div class='row' style="padding-bottom: 2%; padding-top: 2%; padding-left: 2%; background-color: #d9d9d9; margin-bottom: 4%">
                                <div class="col-md-6 col-sm-12 col-xs-12">
                                    <!--<form method="post" name="myform" role="form" action="tCategoryInsert.jsp">-->
                                        <!--<div class="form-inline" >-->
                                        
                                        <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">PMI No:</label>
                                        <div class="col-xs-5">
                                            <input type="text" name="testCatName" id="testCatName" class="form-control"  required="required"/>
                                        </div>
                                        <div class="col-xs-5">
                                        <button type="button" class="btn btn-primary" id="btn_add" >Submit</button>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">Order Date:</label>
                                        <div class="col-xs-5">
                                            <input type="text" name="testCatName" id="datepicker" class="form-control"  required="required"/>
                                        </div>
                                        <div class="col-xs-5">
                                        <button type="button" class="btn btn-primary" id="btn_add" >Refresh</button>
                                        </div>
                                        </div>
                                </div>
                                        <!--</div>-->
                                    <!--</form>-->
                            </div>  
                            <input type="checkbox" name="vehicle" value="Bike"> Assigned Test Order<br><br>
                            
         <table id="orderRecieve"  class="table table-striped table-bordered" cellspacing="0" width="100%">
             <%
               // Statement st = con.createStatement();
              //  ResultSet resultset = 
               // st.executeQuery("SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO");
               Conn conn = new Conn();       
               String sqlPatientApp = "SELECT od.order_no, od.pmi_no, pb.PMI_NO, pb.PATIENT_NAME FROM lis_order_detail od, pms_patient_biodata pb WHERE od.pmi_no=pb.PMI_NO";
               ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);             
         %>
        <thead>
            <tr>
                <th class="col-sm-1">Order No</th>
                <th class="col-sm-1">PMI No</th>
                <th class="col-sm-1">Registration No</th>
                <th class="col-sm-1">Patient Name</th>	
                <th class="col-sm-1">Order Source</th>
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
                <td></td>
                <td><%=dataPatientApp.get(i).get(3)%></td>

                <td>
                 <button  class='btn btn-primary btn-xs' data-toggle="modal" data-target="#basicModal_<%=i%>">See Detail</button>

                <div class="modal fade" id="basicModal_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                               
                                <h4 class="modal-title" id="myModalLabel">Add</h4>
                            </div>
                            <div class="modal-body">
                                
                                    <label>Specimen Source</label>
                                    <select class="form-control" id="status_<%=i%>">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                               
                                    
                            </div>
                            <div class="modal-body">
                                
                                    <label>Specimen Container</label>
                                    <select class="form-control" id="status_<%=i%>">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                              
                                    
                            </div>
                                        
                            <div class="modal-body">
                            
                                    <label>Status</label>
                                    <select class="form-control" id="status_<%=i%>">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                              
                                    
                            </div>
                        
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="btn_update_<%=i%>">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                </td>
                <td>
                <button  class='btn btn-primary btn-xs' data-toggle="modal" data-target="#update_<%=i%>">See Detail</button>
                
                <div class="modal fade" id="update_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="update_" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                
                                <h4 class="modal-title" id="myModalLabel">Update</h4>
                            </div>
                            <div class="modal-body">
                                
                                    <label>Specimen Source</label>
                                    <select class="form-control" id="status_<%=i%>">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                               
                                    
                            </div>
                            <div class="modal-body">
                                
                                    <label>Specimen Container</label>
                                    <select class="form-control" id="status_<%=i%>">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                              
                                    
                            </div>
                                        
                            <div class="modal-body">
                            
                                    <label>Status</label>
                                    <select class="form-control" id="status_<%=i%>">
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                              
                                    
                            </div>
                        
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="btn_update_<%=i%>">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                </td> 
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
    
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
                        </div> 
                        </div> 
                              </div> 
                        </div>
             </div> 
    </body>
</html>
