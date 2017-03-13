<%-- 
    Document   : assignSpecimen
    Created on : Feb 9, 2017, 4:57:14 PM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

                                <div class="tabbable-line">
                                    <ul class="nav nav-tabs ">
                                        <li class="active">
                                            <a href="#tab_default_1" data-toggle="tab">
                                                Verify Result1 </a>
                                        </li>

                                    </ul>
                                    <!-- tab content -->

                                            

                                                
                                               <br>
                            <br>
                        
         <table id="orderRecieve"  class="table table-striped table-bordered" cellspacing="0" width="100%">
             
        <thead>
            <tr>
                <th class="col-sm-1">Test Name</th>
                <th class="col-sm-1">Result</th>
                <th class="col-sm-1">Remarks</th>
                <th class="col-sm-1">Test Date</th>
                <th class="col-sm-1">Test Time</th>
                <th class="col-sm-1">Verification</th>
                <th class="col-sm-1">Test Performed By</th>
                <th class="col-sm-1">Selection</th>
            </tr>
        </thead>    
        <tbody>
           <%
          
                Conn conn = new Conn();          
                String[] itemCD;
                String pmi2 = request.getParameter("pmi");
                String orderno1 = request.getParameter("order_no");
                String Specimen_no = request.getParameter("Specimen_no");
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
                        String sqlPatientApp = "SELECT lod.item_name,LVR.`result`,LVR.remarks,LVR.`TestDate`,LVR.`TestTime`,LVR.`Verification` FROM lis_verify_result LVR , lis_order_detail LOD WHERE LOD.item_cd = LVR.item_cd AND LOD.item_cd = '"+itemCD[j]+"'";
                        //String sqlPatientApp = "SELECT item_name, order_no, item_cd FROM lis_order_detail WHERE order_no = '"+orderno1+"' AND item_cd = '"+itemCD[j]+"'";
                        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);
                        
                        if (dataPatientApp.size() > 0)
                        {
                            for (int i = 0; i < dataPatientApp.size(); i++)
                            {%>
                            
            <tr>
                <td><%=dataPatientApp.get(i).get(0)%></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                
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
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="assign">Approave</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="assign">Reject</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal" id="assign">Cancel Verification</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="openPage('VerifySpecimen.jsp?pmi=<%=pmi2%> &specimen_no=<%=Specimen_no%>')">Cancel</button>
                                
                                <input type="text" id="patient_name" name="patient_name" value="<%out.print(request.getParameter("patient_name"));%>" style="display: none;"> 
                            </div>
                                           



                                </div>

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
