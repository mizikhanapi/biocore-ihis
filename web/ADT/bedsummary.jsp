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
  
               
   //   Config.getBase_url(request);
    //        Config.getFile_url(session);
            Conn conn = new Conn();
   String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String totalNew = "";

%>

<div id="wardTable2" class="form-group">
    <h4 class="margin-bottom-30px">Bed Details</h4>
    <div class="row">
        <%//                Conn conn44 = new Conn();
//                String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            String sqlbedSum2 = "SELECT  a.ward_class_name, b.ward_name,  a.hfc_cd, a.ward_class_code,b.ward_class_code,  b.ward_id  FROM wis_ward_class a LEFT JOIN wis_ward_name b ON a.ward_class_code = b.ward_class_code  where a.discipline_cd ='" + dis + "' AND a.hfc_cd = '" + hfc + "' AND b.discipline_cd ='" + dis + "' AND b.hfc_cd = '" + hfc + "'";
            ArrayList<ArrayList<String>> databedSum2 = conn.getData(sqlbedSum2);

            int size292 = databedSum2.size();
            for (int i = 0; i < size292; i++) {
        %>
        <div class="col-md-6 col-lg-4">
            <div class="thumbnail">
                <h4 style="padding-top: 0px; padding-bottom: 10px;"><%= databedSum2.get(i).get(0) + " | " + databedSum2.get(i).get(1)%></h4>
                <hr class="pemisah" />
                <div style="height: 192px; overflow: auto; margin-top:-30px; padding-top: 30px;">    
                    <table class="table table-striped" id="wardBedTable"  width="30%" style="margin-bottom: 0px; margin-top:-30px;">
                        <thead>
                            <tr>
                                <th style="color: #999; font-weight: 500;"> Bed ID</th>
                                <th style="color: #999; font-weight: 500;"> Status </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <%
                                    String wardid = databedSum2.get(i).get(5);
                                    String wardclass = databedSum2.get(i).get(4);

                                    String total = "SELECT COUNT(bed_id) FROM wis_bed_id where discipline_cd = '" + dis + "' AND ward_id = '" + wardid + "' and ward_class_code = '" + wardclass + "' ";
                                    ArrayList<ArrayList<String>> dataTotal = conn.getData(total);

                                    int size2922 = dataTotal.size();
                                    for (int i2 = 0; i2 < size2922; i2++) {
                                        String t = dataTotal.get(i2).get(0);
                                        totalNew = t;
                                    }

                                    String sqlBedId = "SELECT  bed_id, bed_status from wis_bed_id where discipline_cd = '" + dis + "' AND ward_id = '" + wardid + "' and ward_class_code = '" + wardclass + "'  ";
                                    ArrayList<ArrayList<String>> databedId = conn.getData(sqlBedId);

                                    int BedID = databedId.size();
                                    for (int i3 = 0; i3 < BedID; i3++) {
                                %>

                                <td style="font-weight: 500;"><%= databedId.get(i3).get(0)%></td>


                                <%

                                    if (databedId.get(i3).get(1).equals("Available")) {
                                %>
                                <td style="color:#26a69a;" >Available</td>


                             <% } else { %>

                                <td style="color:#f5707a;" >Occupied</td>

                               

                              

                                <% } %>
                            </tr>

                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div style="position: absolute; color: #999; top: 30px; right: 30px; font-weight: 500; text-transform: uppercase">Total Room: <%= totalNew%></div>
            </div>
        </div>
        <%
            }

        %>
    </div>
</div>


