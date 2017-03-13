<%-- 
    Document   : assignSpecimen
    Created on : Feb 9, 2017, 4:57:14 PM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Conn conn = new Conn();%>
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
        <form enctype="multipart/form-data" method="get" action="">
       
         <div class="container-fluid">
            <div class="row">
                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->
                
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

                                            

                                                
                                               <br>
                            <br>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        
                    <p>
                        <em>Specimen No: <% 
                            
                            RMIConnector rmic = new RMIConnector();
                            String sqlRow = "SELECT COUNT(order_no) AS rowcount FROM lis_specimen";
                            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlRow);
                            ArrayList<ArrayList<String>> q1 = conn.getData(sqlRow);
                            out.print(q1.get(0).get(0));
                        %></em>
                    </p>
                    <p>
                        <em>Specimen Type: </em>
                    </p>
                    <p>
                        <em></em>
                    </p>
                    <p>
                        <em></em>
                    </p>
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <address>
                    <p>
                        <em>Collection Date: <%= new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date())%><input type='text' name='Collection_date' id="C_date" value='<%= new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date())%>' style='display:none;'></em>
                    </p>
                    <p>
                        <em>Collection Time: <%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%><input type='text' name='Collection_time' id="C_time" value='<%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%>' style='display:none;'</em>
                    </p>
                    <p>
                        <em> </em>
                    </p>
                    <p>
                        <em> </em>
                    </p>
                    </address>
                </div>    
         <table id="orderRecieve"  class="table table-striped table-bordered" cellspacing="0" width="100%">
             
        <thead>
            <tr>
                <th class="col-sm-1">Order Name</th>
                <th class="col-sm-1">Container Information</th>
                <th class="col-sm-1">Order Date</th>	
            </tr>
        </thead>
        <tbody>
           <%
          
                          
                String[] itemCD;
                String pmi2 = request.getParameter("pmi");
                String orderno1 = request.getParameter("order_no");
                
                itemCD = request.getParameterValues("chkSpecimen");
                out.println("<input type='text' name='pmi' value='"+pmi2+"' id='pmi' style='display:none;'>");
                out.println("<input type='text' name='order_no' value='"+orderno1+"' id='order_no'  style='display:none;'>");
                int count = 0;
                if(itemCD !=null)
                {
                    //out.println("Item Code:<br>");
                    for(int j=0;j<itemCD.length; j++)
                    {
                        out.println("<input type='text' name='specimen"+j+"' value='"+itemCD[j]+"' id='specimen"+j+"' style='display:none;'>"); 
                        
                        count++;
                        String sqlPatientApp = "SELECT LOD.item_name, LOD.spe_container, LOD.order_date, LOM.pmi_no, LOM.hfc_cd FROM lis_order_detail LOD, lis_order_master LOM WHERE LOD.order_no = LOM.order_no AND LOD.item_cd = '"+itemCD[j]+"' AND LOD.order_no = '"+orderno1+"'";
                        //String sqlPatientApp = "SELECT item_name, order_no, item_cd FROM lis_order_detail WHERE order_no = '"+orderno1+"' AND item_cd = '"+itemCD[j]+"'";
                        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);
                        
                        if (dataPatientApp.size() > 0)
                        {
                            for (int i = 0; i < dataPatientApp.size(); i++)
                            {%>
                            
            <tr>
                <td><%=dataPatientApp.get(i).get(0)%></td>
                <td><%=dataPatientApp.get(i).get(1)%></td>
                <td><%=dataPatientApp.get(i).get(2)%></td>
                
            </tr>
                            <%
                            }
                        }
                   
                    }
                    out.println("<input type='text' name='TotalOptions' value='"+count+"' id='TotalOptions' style='display:none;'>");
                }
                else
                {
                    out.println("none");
                }
                            
           %>
     
       </tbody>
    </table>
           <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="openPage('view_order.jsp?pmi=<%=pmi2%> &order_no=<%=orderno1%>')">Cancel</button>
                                
                                <button type="button" class="btn btn-primary" data-dismiss="modal" id="assign">Submit</button> 
                                <input type="text" id="patient_name" name="patient_name" value="<%out.print(request.getParameter("patient_name"));%>" style="display: none;"> 
                            </div>
                                           



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
        </form>
                                <script type="text/javascript" charset="utf-8">
                                function openPage(pageURL) {
                                   window.location = pageURL;
                                    }
   
                                     $("#assign").click(function(){
                                      var sure = confirm("Are you sure to assign the specimen?");
                                      if(sure==true)
                                      {
                                          var pmi=$("#pmi").val();
                                            var order_no=$("#order_no").val();
                                            var C_date = $("#C_date").val();
                                            var C_time = $("#C_time").val();
                                            var specimen=[];
                                            var TotalOptions=$("#TotalOptions").val();
                                            var patient_name=$("#patient_name").val();

                                        for(var i=0;i<TotalOptions;i++)
                                        {
                                             specimen.push($("#specimen"+i).val());
                                        }
                                        $.ajax({
                                        type:"POST",
                                        url:"tSpecimenInsert.jsp",
                                        data:{
                                         Pmi:pmi,
                                         Order_no:order_no,
                                         "Specimen[]":specimen,
                                         patient_name:patient_name,
                                         C_date:C_date,
                                         C_time:C_time,
                                         Total:TotalOptions}

                                     });
                                     //alert("The specimen have been assigned. Thank you.");
                                      window.location.replace("MainPage.jsp");
                                     }  
                    });
    </script>
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