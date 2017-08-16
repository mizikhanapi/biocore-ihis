<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
%>

<div id="wardTable">
  <%     Date datenow = new Date();
                                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY | HH:mm");
                                        out.print("Date :");
                                        out.print(sdf.format(datenow));
                                    %>
                                    
    <div class="row">
        
        <%
            String totalA = "";
            String totalP = "";
            String totalO = "";
            String totalS = "";
            String sqlbedRemarks = "SELECT  a.ward_class_name, b.ward_name,  a.hfc_cd, a.ward_class_code,b.ward_class_code,  b.ward_id  FROM wis_ward_class a LEFT JOIN wis_ward_name b ON a.ward_class_code = b.ward_class_code  where a.hfc_cd = '" + hfc + "' AND b.hfc_cd = '" + hfc + "'";

            ArrayList<ArrayList<String>> databedRemarks = conn.getData(sqlbedRemarks);

            int sizeR = databedRemarks.size();
            for (int i = 0; i < sizeR; i++) {
        %>

        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-2">
            <div class="thumbnail">
                <div class="text-center">
                    <div class="bed-booking-title"><%= databedRemarks.get(i).get(0) + " | " + databedRemarks.get(i).get(1)%></div>
                    <%
                        String wardid = databedRemarks.get(i).get(5);
                        String wardclass = databedRemarks.get(i).get(4);

                        String a = "Available";

                        String totalAV = "SELECT COUNT(bed_status) FROM wis_bed_id where bed_status = '" + a + "' AND ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' AND hfc_cd = '" + hfc + "' ";
                        ArrayList<ArrayList<String>> dataTotalAV = conn.getData(totalAV);

                        int sizetotalAV = dataTotalAV.size();
                        for (int iTA = 0; iTA < sizetotalAV; iTA++) {
                            String tA = dataTotalAV.get(iTA).get(0);
                            totalA = tA;
                        }

                        String p = "Pending";
                        String totalPN = "SELECT COUNT(bed_status) FROM wis_bed_id where bed_status = '" + p + "' AND ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' AND hfc_cd = '" + hfc + "' ";
                        ArrayList<ArrayList<String>> dataTotalP = conn.getData(totalPN);

                        int sizetotalP = dataTotalP.size();
                        for (int iTP = 0; iTP < sizetotalP; iTP++) {
                            String tP = dataTotalP.get(iTP).get(0);
                            totalP = tP;
                        }

                        String red = "Occupied";
                        String totalOC = "SELECT COUNT(bed_status) FROM wis_bed_id where bed_status = '" + red + "' AND ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' AND hfc_cd = '" + hfc + "' ";
                        ArrayList<ArrayList<String>> dataTotalOC = conn.getData(totalOC);

                        int sizetotalOC = dataTotalOC.size();
                        for (int iOC = 0; iOC < sizetotalOC; iOC++) {
                            String tOC = dataTotalOC.get(iOC).get(0);
                            totalO = tOC;
                        }

                        String totalSum = "SELECT COUNT(bed_status) FROM wis_bed_id where ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' AND hfc_cd = '" + hfc + "' ";
                        ArrayList<ArrayList<String>> dataTotalSum = conn.getData(totalSum);
                        // out.print(totalOC);
                        int sizetotalSum = dataTotalSum.size();
                        for (int sum1 = 0; sum1 < sizetotalSum; sum1++) {
                            String sum = dataTotalSum.get(sum1).get(0);
                            totalS = sum;
                        }


                    %>
                    <span class="bed-booking-total"><%= totalS%></span>
                    <div>
                        <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;<%= totalA%></span> 
                     
                        <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;<%= totalO%></span>
                    </div>
                </div>
            </div>
        </div>
        <%
            }

        %>
    </div>
</div>

<div id="remarksBedTable" class="form-group" style="display: none;">
    <table id="remarksTable"  class="table table-bordered"  width="30%" cellspacing="0" >
        <tr>
            <th bgcolor="#33cc33">A</th>
            <td bgcolor="#33cc33">AVAILABLE</td>
        </tr>
      
        <tr>
            <th bgcolor="#ff5050">O</th>
            <td bgcolor="#ff5050">OCCUPIED</td><br>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#ff99ff">NOTE : THIS SCREEN IS REFRESHED EVERY 20 SECONDS</td>
        </tr>
    </table>
</div>




