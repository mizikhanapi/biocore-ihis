<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//    Config.getBase_url(request);
//    Config.getFile_url(session);
    // Conn conn = new Conn();
    // String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
 String totalNew = "";

%>
<div id="wardTable" class="form-group">


    <div class="row">

        <%//                Conn conn44 = new Conn();
//                String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            String sqlbedSum2 = "SELECT  a.ward_class_name, b.ward_name,  a.hfc_cd, a.ward_class_code,b.ward_class_code,  b.ward_id  FROM wis_ward_class a LEFT JOIN wis_ward_name b ON a.ward_class_code = b.ward_class_code  where a.hfc_cd = '" + hfc + "'";
            ArrayList<ArrayList<String>> databedSum2 = conn.getData(sqlbedSum2);
            
           

            int size292 = databedSum2.size();
            for (int i = 0; i < size292; i++) {
        %>
        <div class="col-md-4">
            <table class="table table-bordered" id="wardBedTable"  width="30%">

                <tr>
                    <th colspan="2" style="background:#a6a6a6"><%= databedSum2.get(i).get(0) + " | " + databedSum2.get(i).get(1)%></th>

                </tr>
                <tr>


                    <td style="background:#4d94ff"> Bed ID</td>
                    <td style="background:66ccff"> Status </td>


                </tr>
                <tr>
                    <%
                        String wardid = databedSum2.get(i).get(5);
                        String wardclass = databedSum2.get(i).get(4);
                        
                        String total = "SELECT COUNT(bed_id) FROM wis_bed_id where ward_id = '" + wardid + "' and ward_class_code = '" + wardclass + "' ";
                        ArrayList<ArrayList<String>> dataTotal = conn.getData(total);
                        
                        int size2922 = dataTotal.size();
                        for (int i2 = 0; i2 < size2922; i2++) { 
                            String t = dataTotal.get(i2).get(0);
                            totalNew = t; 
                        }


                        String sqlBedId = "SELECT  bed_id, bed_status from wis_bed_id where ward_id = '" + wardid + "' and ward_class_code = '" + wardclass + "'  ";
                       ArrayList<ArrayList<String>> databedId = conn.getData(sqlBedId);
   
                       int BedID = databedId.size();
                        for (int i3 = 0; i3 < BedID; i3++) {
                    %>

                    <td style="background:#ffffcc"><%= databedId.get(i3).get(0)%></td>


                    <%

                        if (databedId.get(i3).get(1).equals("Available")) {
                    %>
                    <td style="background:#33cc33" >A</td>


                    <% } else if (databedId.get(i3).get(1).equals("Occupied")) { %>

                    <td style="background:#ff5050" >O</td>

                    <% } else  { %>

                    <td style="background:#ffff99" >P</td>

                    <% } %>
                </tr>
                
                          
                
               <%
                }
            %>
            
               <tr >
                   <td style="background:#a6a6a6" >Total : </td>
                   <td style="background:#a6a6a6" ><%= totalNew %> </td> 
               </tr>
            </table>
  
        </div>
        <%
            }

        %>
    </div>
    </br>
</div>
</br>







