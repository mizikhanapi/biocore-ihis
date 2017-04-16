<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>



<div id="wardTable" class="form-group">

    <div class="row">
        <%

            String sqlbedRemarks = "SELECT  a.ward_class_name, b.ward_name,  a.hfc_cd, a.ward_class_code,b.ward_class_code,  b.ward_id  FROM wis_ward_class a LEFT JOIN wis_ward_name b ON a.ward_class_code = b.ward_class_code  where a.hfc_cd = '" + hfc + "'";

            ArrayList<ArrayList<String>> databedRemarks = conn.getData(sqlbedRemarks);

            int sizeR = databedRemarks.size();
            for (int i = 0; i < sizeR; i++) {
        %>
        <div class="col-md-4" width="5%">

            <table id="wardBedTable"  class="table table-bordered"  >



                <tr>
                    <th colspan="2" bgcolor="#a6a6a6"><%= databedRemarks.get(i).get(0) + " | " + databedRemarks.get(i).get(1)%></th>

                </tr>

                <%
                    String wardid = databedRemarks.get(i).get(5);
                    String wardclass = databedRemarks.get(i).get(4);

                    String totalA = "";

                    String a = "Available";

                    String totalAV = "SELECT COUNT(bed_status) FROM wis_bed_id where bed_status = '" + a + "' AND ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "'";
                    ArrayList<ArrayList<String>> dataTotalAV = conn.getData(totalAV);

                    int sizetotalAV = dataTotalAV.size();
                    for (int iTA = 0; iTA < sizetotalAV; iTA++) {
                        String tA = dataTotalAV.get(iTA).get(0);
                        totalA = tA;
                    }

                    String totalP = "";
                    String p = "Pending";
                    String totalPN = "SELECT COUNT(bed_status) FROM wis_bed_id where bed_status = '" + p + "' AND ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' ";
                    ArrayList<ArrayList<String>> dataTotalP = conn.getData(totalPN);

                    int sizetotalP = dataTotalP.size();
                    for (int iTP = 0; iTP < sizetotalP; iTP++) {
                        String tP = dataTotalP.get(iTP).get(0);
                        totalP = tP;
                    }

                    String totalO = "";
                    String red = "Occupied";
                    String totalOC = "SELECT COUNT(bed_status) FROM wis_bed_id where bed_status = '" + red + "' AND ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' ";
                    ArrayList<ArrayList<String>> dataTotalOC = conn.getData(totalOC);

                    int sizetotalOC = dataTotalOC.size();
                    for (int iOC = 0; iOC < sizetotalOC; iOC++) {
                        String tOC = dataTotalOC.get(iOC).get(0);
                        totalO = tOC;
                    }

                    String totalS = "";

                 

                    String totalSum = "SELECT COUNT(bed_status) FROM wis_bed_id where ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' ";
                    ArrayList<ArrayList<String>> dataTotalSum = conn.getData(totalSum);
                    // out.print(totalOC);
                    int sizetotalSum = dataTotalSum.size();
                    for (int sum1 = 0; sum1 < sizetotalSum; sum1++) {
                        String sum = dataTotalSum.get(sum1).get(0);
                        totalS = sum;
                    }


                %>

                <tr>
                    <th style="background:#33cc33">A</th>
                    <td style="background:#33cc33"><%= totalA%></td>
                </tr>

                <tr>

                    <th style="background:#ffff99">P</th>
                    <td style="background:#ffff99"><%= totalP%></td>
                </tr>


                <tr>

                    <th style="background:#ff5050">O</th>
                    <td style="background:#ff5050"><%= totalO%></td>
                </tr>


                <%     //}
%>

                <tr>


                    <th bgcolor="#a6a6a6"> Total</th>
                    <td bgcolor="#a6a6a6"><%= totalS%></td>


                </tr>
            </table>
        </div>

        <%
            }

        %>



    </div>
    </br>
</div>







<div id="remarksBedTable" class="form-group">



    <table id="remarksTable"  class="table table-bordered"  width="30%" cellspacing="0">



        <tr>
            <th bgcolor="#33cc33">A</th>
            <td bgcolor="#33cc33">AVAILABLE</td>
        </tr>

        <tr>

            <th bgcolor="#ffff99">P</th>
            <td bgcolor="#ffff99">PENDING</td>
        </tr>


        <tr>

            <th bgcolor="#ff5050">O</th>
            <td bgcolor="#ff5050">OCCUPIED</td><br>
        </tr>
        </br>
        <tr>

            <td colspan="2" bgcolor="#ff99ff">NOTE : THIS SCREEN IS REFRESHED EVERY 20 SECONDS</td>
        </tr>


    </table>
</div>