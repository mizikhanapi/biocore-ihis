<%-- 
    Document   : view_order
    Created on : Nov 24, 2016, 12:24:01 PM
    Author     : Ahmed
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
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
        <form method="post" action="Assign_Specimen" id="specimenOder">
      
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
                                                View Test Order </a>
                                        </li>

                                    </ul>
                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">

                                            

                                                
                                                 <%
                        Conn conn = new Conn(); 
                        String pmi0 = request.getParameter("pmi");
                        //Statement st0 = con.createStatement();
                        //ResultSet rs = 
                       // st0.executeQuery("select pmi_no,patient_name,new_ic_no,birth_date,sex_code,race_code,blood_type,allergy_ind from pms_patient_biodata where pmi_no = '"+pmi0+"'"); 
                        
                         String query1 = "select pmi_no,patient_name,new_ic_no,birth_date,sex_code,race_code,blood_type,allergy_ind from pms_patient_biodata where pmi_no = '"+pmi0+"' ";
                         ArrayList<ArrayList<String>> q1 = conn.getData(query1);
                     %>  
                                           
                <div class="row">
                   <%if (q1.size() > 0) 
                                        {
                                            for (int i = 0; i < q1.size(); i++) 
                                            {%>  
                                            <br>
                                            <br>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Patient Information</strong>
                        </br>
                         <br>
                    <p>
                        <em>Patient Name: <%=q1.get(i).get(1)%> <input type="text" id="patient_name" name="patient_name" value="<%=q1.get(i).get(1)%>" style=" display: none;"></em>
                    </p>
                    <p>
                        <em>PMI_NO: <%=q1.get(i).get(0)%></em>
                    </p>
                    <p>
                        <em>IC_NO: <%=q1.get(i).get(2)%></em>
                    </p>
                    <p>
                        <em>Gender: <%
                            String getGender = "SELECT ald.`Description` FROM adm_lookup_master alm,adm_lookup_detail ald WHERE alm.`Master_Reference_code`=ald.`Master_Reference_code` AND alm.`Description` = 'Gender' AND ald.`Detail_Reference_code` = '"+q1.get(i).get(4)+"'";
                            ArrayList<ArrayList<String>> q2 = conn.getData(getGender);
                            out.println(q2.get(0).get(0));
                        %></em>
                    </p>
                    </address>
                </div>
                                 
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    </br>
                    <p>
                        <em>Birth Date: <%=q1.get(i).get(3)%></em>
                    </p>
                    <p>
                        <em>Race: <%
                            String getRace = "SELECT DISTINCT Description FROM adm_lookup_detail WHERE Detail_Reference_code='"+q1.get(i).get(5)+"'";
                            ArrayList<ArrayList<String>> q3 = conn.getData(getRace);
                            out.println(q3.get(0).get(0));
                        %></em>
                    </p>
                     <p>
                        <em>Blood Type: <%
                            String getBlood = "SELECT DISTINCT Description FROM adm_lookup_detail WHERE Master_Reference_code='0074' AND Detail_Reference_code='"+q1.get(i).get(6)+"'";
                            ArrayList<ArrayList<String>> q4 = conn.getData(getBlood);
                            out.println(q4.get(0).get(0));
                        %></em>
                    </p>
                     <p>
                        <em>Allergy: <%
                            q1.get(i).get(7);
                            String getAllergy = "SELECT DISTINCT Description FROM adm_lookup_detail WHERE Master_Reference_code='0075' AND Detail_Reference_code='"+q1.get(i).get(7)+"'";
                            ArrayList<ArrayList<String>> q5 = conn.getData(getAllergy);
                            out.println(q5.get(0).get(0));
                        %></em>
                    </p>
                    
                </div>          
                     <%
                       }}
                     %>
                </div>
                
                <hr> 
         <table id="orderRecieve"  class="table table-striped table-bordered" cellspacing="0" width="100%">    
                     <%
                        String pmi1 = request.getParameter("pmi");
                        String query2 = "select episode_date,encounter_date,ICD10_DESCRIPTION,severity,comment from lhr_diagnosis where pmi_no = '"+pmi1+"'";
                        ArrayList<ArrayList<String>> q2 = conn.getData(query2);
                     %>
        <thead>
            <tr>
                <th class="col-sm-1">Episode date</th>
                <th class="col-sm-1">Onset Date</th>
                <th class="col-sm-1">Diagnosis</th>				 
                <th class="col-sm-1">Severity</th>
                <th class="col-sm-1">comment</th>
            </tr>
        </thead>
          <%if (q2.size() > 0) 
                                        {
                                            for (int i = 0; i < q2.size(); i++) 
                                            {%>  
        <tbody> 
            <tr>
                <td><%=q2.get(i).get(0)%></td>
                <td><%=q2.get(i).get(1)%></td>
                <td><%=q2.get(i).get(2)%></td>
                <td><%=q2.get(i).get(3)%></td>
                <td><%=q2.get(i).get(4)%></td>
      </tr> 
      <%
        }}
       %>
       </tbody>
    </table>
<hr>
                     <%
                       String pmi3 = request.getParameter("pmi");
                       String orderno = request.getParameter("order_no");
                        
                         String query3 = "SELECT order_no,EPISODE_DATE,ORDER_date,pmi_no FROM LIS_ORDER_MASTER WHERE pmi_no = '"+pmi3+"' and order_no ='"+orderno+"'";
                         ArrayList<ArrayList<String>> q3 = conn.getData(query3);
                     %>
       <nav>
           <%if (q3.size() > 0) 
                                        {
                                            for (int i = 0; i < q3.size(); i++) 
                                            {%> 
           <strong><em>Order No : <%=q3.get(i).get(0)%></em></strong> |
           <strong><em>Episode date: <%=q3.get(i).get(1)%></em></strong> |
           <strong><em>Order date: <%=q3.get(i).get(2)%></em></strong>
            <div style = "clear: right; float: right; text-align: right;">
            <br />
            <br />
            <a href = "order_test.jsp?pmi=<%=q3.get(i).get(3)%> &orderno=<%=q3.get(i).get(0)%>">Add New Test</a>
            </div>
      </nav>
           <%}}%>
           <h3 class="headerTitle">List of Test Order Detail<input type="text" name="order_no" id="order_no3" value="<%=orderno%>" style=" display: none;"></h3>
    <div class="table-responsive" id='viewVODpage'>
        
    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <%
                        String pmi2 = request.getParameter("pmi");
                        String orderno1 = request.getParameter("order_no");
                        
                         String query4 = "SELECT item_cd,item_name,spe_source,volume,requestor_comments,filler_comments,specimen_status,Verification,collectionDate FROM lis_order_detail WHERE order_no='"+orderno1+"' AND pmi_no='"+pmi2+"' AND detail_status='0'";
                         ArrayList<ArrayList<String>> q4 = conn.getData(query4);
                         
                     %>
    <thead>
        <tr>
                <th class="col-sm-1">Item Code</th>
                <th class="col-sm-1">Item Name</th>			 
                <th class="col-sm-1">Specimen Source</th>
                <th class="col-sm-1">Volume</th>
                <th class="col-sm-1">Specimen Status</th>
                <th class="col-sm-1">Verification</th>
                <th class="col-sm-1">Collection Date</th>
                <th class="col-sm-1">Comments</th>
                <th class="col-sm-1">Set Collection Date</th>
                <th class="col-sm-1">Requestor Comments</th>
                <th class="col-sm-1">Check for Assign Specimen</th>
        </tr>
    </thead>
    <tbody>

       
         <%if (q4.size() > 0) 
           {
                for (int i = 0; i < q4.size(); i++) 
           {%> 
        <tr>
                <td><%=q4.get(i).get(0)%></td>
                <td><%=q4.get(i).get(1)%></td>
                <td><%=q4.get(i).get(2)%></td>
                <td><%=q4.get(i).get(3)%></td>
                
                
                <td><%=q4.get(i).get(6)%></td>
                <td><%=q4.get(i).get(7)%></td>
                <td><%=q4.get(i).get(8)%></td>
                <td><%=q4.get(i).get(5)%></td>
            <td>
                <a  style="cursor: pointer;" data-toggle="modal" data-target="#Collection<%=i %>"><i class="fa fa-calendar fa-lg"></i></a>
                <div class="modal fade" id="Collection<%=i %>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                            <h3 class="modal-title" id="lineModalLabel">Set Collection Date</h3>

                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Collection Date</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="tcode_<%=i%>" name="tcode" value="<%=q4.get(i).get(0)%>" readonly="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Collection Date</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="tname_<%=i%>" name="tcode" value="<%=q4.get(i).get(1)%>" readonly="">
                                </div>
                            </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Collection Date</label>
                            <div class="col-md-8">
                                <input type="text" id="collection<%=i %>" class="form-control input-md" placeholder="DD-MM-YYYY" value="<%=q4.get(i).get(8)%>">
                                <script>
                                    $( "#collection<%=i %>" ).datepicker({ 
                                        yearRange: '1999:c+1' ,
                                        changeMonth: true,
                                        changeYear: true,
                                        minDate: new Date(1999, 10 - 1, 25),
                                        maxDate: '+30Y',
                                        });
                                </script>
                                
                            </div>
                        </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Remarks</label>
                                    <div class="col-md-8">
                                        <textarea name="career[message]" class="form-control" id="fcomment_<%=i%>" placeholder="Write your details" ><%=q4.get(i).get(5)%></textarea>
                                
                                    </div>
                                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btn_submit<%=i %>">Submit</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" role="button" id="btn_cancel<%=i %>">Cancel Date</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>   
                <script>
                     $(document).ready(function () {
                     $("#btn_submit<%=i %>").click(function () {
                            var tcode = $("#tcode_<%=i%>").val();
                            var fcomment = $("#fcomment_<%=i%>").val();
                            var order_no = $("#order_no3").val();
                            var collectionDate = $("#collection<%=i%>").val();
                            
                            $.ajax({
                                url: "odUpdate.jsp",
                                type: "post",
                                data: {
                                    tcode: tcode,
                                    order_no: order_no,
                                    collectionDate: collectionDate,
                                    fcomment: fcomment
                                },
                                timeout: 10000,
                                success: function(data) {
                                     var d = data.split("|");
                                     if (d[1] == '1') {
                                         bootbox.alert("Collection date updated.")
                                         window.location.reload();
                                         $("#basicModal_<%=i %>").hide();
                                         $(".modal-backdrop").hide();
                                     } else {
                                         alert("Update failed!");
                                     }
                                },
                                error: function(err) {
                                    alert("Error update!");
                                }
                            });
                        });
                        
                        $("#btn_cancel<%=i %>").click(function () {
                            var tcode = $("#tcode_<%=i%>").val();
                            var fcomment = $("#fcomment_<%=i%>").val();
                            var order_no = $("#order_no3").val();
                            var collectionDate = $("#collection<%=i%>").val();
                            
                            $.ajax({
                                url: "odcancel.jsp",
                                type: "post",
                                data: {
                                    tcode: tcode,
                                    order_no: order_no,
                                    collectionDate: collectionDate,
                                    fcomment: fcomment
                                },
                                timeout: 10000,
                                success: function(data) {
                                     var d = data.split("|");
                                     if (d[1] == '1') {
                                         alert("Collection date is cancel.")
                                         window.location.reload();
                                         $("#basicModal_<%=i %>").hide();
                                         $(".modal-backdrop").hide();
                                     } else {
                                         alert("Update failed!");
                                     }
                                },
                                error: function(err) {
                                    alert("Error update!");
                                }
                            });
                        });
                    });
            </script>
            </td>
            <td><%=q4.get(i).get(4)%></td>
            <td>
               
               <input class="chk" type="checkbox" name="chkSpecimen" value="<%=q4.get(i).get(0)%>" id="checky"/>
                <input type="text" name="itemCD" value="<%=q4.get(i).get(0)%>" style="display:none;">
            </td>
            
        <%
                }
            }
        %>
             
          
        </tr>
       
    </tbody>
</table>

       
        <div style = "clear: right; float: right; text-align: right;">
            <input type="text" value="<%=pmi2%>" name="pmi" style="display:none;">
            <input type="text" value="<%=orderno1%>" name="order_no" style="display:none;">
            <button type="submit" class="btn btn-primary" id="subm">Assign Specimen</button>
            <button type="button" class="btn btn-default" id="cancelAss">Back</button>
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
      </div>
        </form>
             <script type="text/javascript" charset="utf-8">
           
   $(document).ready(function() {
    $('#orderRecieve').DataTable();
} );
    </script>
            <script>
        w3IncludeHTML();
        $(document).ready(function () { 
                     $("#cancelAss").click(function () {
                            window.location.replace("Order_list");
                        });
                    });
        $(document).ready(function () {
            //$("#WardOccupancy").load("WardOccupancy.jsp");
            //$("#RecieveOderTable").load("RecieveOder-Table.jsp");
            $( "#collection" ).datepicker({ 
            yearRange: '1999:c+1' ,
            changeMonth: true,
            changeYear: true,
            minDate: new Date(1999, 10 - 1, 25),
            maxDate: '+30Y',
        });
            
            $("#headerindex").load("libraries/header.html");
            $("#topmenuindex").load("libraries/topMenus.html");
            $("#sidemenus").load("libraries/sideMenus.jsp");
//                $("#WardOccupancyTable").load("WardOccupancy-Table.jsp");

        });

    </script>
    <script type="text/javascript">
           $('#submit').prop("disabled", true);
           $('#subm').prop("disabled", true);
        
        $('input:checkbox').click(function() {
        if ($(this).is(':checked')) {
			$('#submit').prop("disabled", false);
                        $('#subm').prop("disabled", false);
        } else {
		if ($('.chk').filter(':checked').length < 1){
			$('#submit').attr('disabled',true);
                    $('#subm').prop("disabled", true);}
		}
});
    
  
       </script>
    </body>
</html>