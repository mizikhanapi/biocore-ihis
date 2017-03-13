<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
<%@page import="dbConn1.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
         <%@include file="Header.jsp"%>
         <link href="assets/css/bootstrap.min.css" rel="stylesheet">
         <script src="assets/js/jquery.min.js"></script>

        <link href="assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <!-- Custom styles for this template -->
        <link href="assets/css/dashboard.css" rel="stylesheet">
        <link href="assets/css/Line-tabs.css" rel="stylesheet">

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
        <div  id="topmenuindex"></div>
         <div class="container-fluid">
            
             <div class="row">
               
                <div id="sidemenus"></div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background: #f2f4f8;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">


                            <!-- Tab Menu -->

                            <div class="tabbable-panel">
                                <div class="tabbable-line">
                                    <ul class="nav nav-tabs ">
                                        <li class="active">
                                            <a href="#tab_default_1" data-toggle="tab">
                                                Add New Test </a>
                                        </li>

                                    </ul>
                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">

                                                                 <% 
                            String[] itemCD;
                            itemCD = request.getParameterValues("itemCD");
                            String pmi = request.getParameter("pmi");
                            String ordno = request.getParameter("orderno");
                            
                           %>
                          
                           <br>
                    <br>
                                <strong><em>Order No : <% out.print(ordno);%></em></strong>
                        <div class="table-responsive" id='viewOT'> 
                            
                           <hr>   
                                           



                                        </div>
                              

                                                
        <table id="orderRecieve"  class="table table-striped table-bordered" cellspacing="0" width="100%">
         <%
               // Statement st = con.createStatement();
              //  ResultSet resultset = 
               // st.executeQuery("SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO");
               //RMIConnector rmic = new RMIConnector();        
                      
               Conn conn = new Conn();
               String query_count = "select om.pmi_no,om.order_no,OM.ORDER_DATE,OM.EPISODE_DATE,lim.item_cd,lim.item_name,lim.spe_source,lim.spe_container,lim.volume,lim.special_inst "
                               + "from lis_order_master om,lis_item_detail lim where om.pmi_no='"+pmi+"' and order_no = '"+ordno+"' ";
               ArrayList<ArrayList<String>> q1 = conn.getData(query_count);
                        
    //out.println(isInsert);
    
         %>
        <thead>
            <tr>
                <th class="col-sm-1">Item code</th>
                <th class="col-sm-1">Item name</th>
                <th class="col-sm-1">S.source</th>
                <th class="col-sm-1">S.container</th>
                <th class="col-sm-1">Volume</th>
                <th class="col-sm-1">Special instruction</th>
                <th class="col-sm-1">Add</th>
                 <th class="col-sm-1">Action</th>
            </tr>
        </thead>
        <tbody>
           
          <%if (q1.size() > 0) 
           {
                for (int i = 0; i < q1.size(); i++) 
           {%>
            <tr>
                <td><%=q1.get(i).get(4)%></td>
                <td><%=q1.get(i).get(5)%></td>
                <td><%=q1.get(i).get(6)%></td>
                <td><%=q1.get(i).get(7)%></td>
                <td><%=q1.get(i).get(8)%></td>
                <td><%=q1.get(i).get(9)%></td>
           <td>
                  <button  class='btn btn-primary btn-xs' data-toggle="modal" data-target="#basicModal_<%=i%>" >Add</button>

                <div class="modal fade" id="basicModal_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <form name="myForm" action="" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h4 class="modal-title" id="myModalLabel">Add New Test</h4>
                            </div>
                            <div class="modal-body">
                                
                                <div class="form-group">
                                <label>PMI No</label>
                                    <input class="form-control" type="text" id="pmino_<%=i%>" value="<%=q1.get(i).get(0)%>" readonly="">
                                </div>
                                <div class="form-group">
                                <label>Order No</label>
                                    <input class="form-control" type="text" id="orderno_<%=i%>" value="<%=q1.get(i).get(1)%>" readonly="">
                                </div>
                                <div class="form-group">
                                    <label>Order Date</label>
                                    <input type="text" name="testCatName"  class="form-control" id="ordate_<%=i%>" value="<%=q1.get(i).get(2)%>" required="required" readonly="">
                                </div>
                                <div class="form-group">
                                    <label>Episode Date</label>
                                    <input type="text" name="testCat"  class="form-control" id="epdate_<%=i%>" value="<%=q1.get(i).get(3)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Item code</label>
                                    <input type="text" name="testCatName"  class="form-control" id="itemcode_<%=i%>" value="<%=q1.get(i).get(4)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Item name</label>
                                    <input type="text" name="testCatName"  class="form-control" id="itemname_<%=i%>" value="<%=q1.get(i).get(5)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Specimen source</label>
                                    <input type="text" name="testCatName"  class="form-control" id="ssource_<%=i%>" value="<%=q1.get(i).get(6)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Specimen container</label>
                                    <input type="text" name="testCatName"  class="form-control" id="scontainer_<%=i%>" value="<%=q1.get(i).get(7)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Volume required</label>
                                    <input type="text" name="testCatName"  class="form-control" id="vreq_<%=i%>" value="<%=q1.get(i).get(8)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                <label>Special instruction</label>
                                    <input type="text" name="testCatName"  class="form-control" id="sinst_<%=i%>" value="<%=q1.get(i).get(9)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                <label>Requestor comments</label>
                                    <textarea name="career[message]" class="form-control" id="rcomment_<%=i%>"   placeholder="Write your details" ></textarea>
                                </div>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="btn_add_<%=i%>">Add</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                                </form>
                    </div>
                </div>
                  <script>
                               
                                
                                
                                $("#btn_add_<%=i%>").click(function () {
                                      var sure = confirm("Are you sure to assign the specimen?");
                                      if(sure==true)
                                      {
                                        var pmino = $("#pmino_<%=i%>").val();
                                       var orderno = $("#orderno_<%=i%>").val();
                                       var ordate = $("#ordate_<%=i%>").val();
                                       var epdate = $("#epdate_<%=i%>").val();
                                       var itemcode = $("#itemcode_<%=i%>").val();
                                       var itemname = $("#itemname_<%=i%>").val();
                                       var ssource = $("#ssource_<%=i%>").val();
                                       var scontainer = $("#scontainer_<%=i%>").val();
                                       var vreq = $("#vreq_<%=i%>").val();
                                       var sinst = $("#sinst_<%=i%>").val();
                                       var rcomment = $("#rcomment_<%=i%>").val();
                                       
                                        $.ajax({
                                            type: "post",
                                           url: "otInsert.jsp",
                                           
                                           data: {
                                               pmino: pmino,
                                               orderno: orderno,
                                               ordate: ordate,
                                               epdate: epdate,
                                               itemcode: itemcode,
                                               itemname: itemname,
                                               ssource: ssource,
                                               scontainer: scontainer,
                                               vreq: vreq,
                                               sinst: sinst,
                                               rcomment: rcomment}
                                       });
                                     alert("The specimen have been assigned. Thank you.");
                                      //alert(""+pmino+"   "+orderno+"   "+ordate+"   "+epdate+"   "+itemcode+"   "+itemname+"   "+ssource+"   "+scontainer+"   "+vreq+"   "+sinst+"  "+rcomment);
                                       
                                      }  
                    });
                            </script>    
                            
            </td>
                <td>
                 <a href = "view_order.jsp?pmi=<%=q1.get(i).get(0)%> &order_no=<%=q1.get(i).get(1)%>">Back to user profile</a>
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
        });
       </script>
                                           



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
