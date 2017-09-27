<%-- 
    Document   : ViewHoliday
    Created on : Sep 7, 2017, 5:41:32 PM
    Author     : -D-
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
     String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
         String hfc_name = (String) session.getAttribute("HFC_NAME");
         String name = (String) session.getAttribute("USER_NAME");
         String title = (String) session.getAttribute("OCCUPATION_CODE");
         String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
         String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
         
         //                                     0                           1                           2                  3                    4                   5               6                 7             8              9                10                  11           
    String sqlDisplayHoliday = "SELECT lm.Master_Reference_code, ld.`Master_Reference_code`, ld.Detail_Reference_code, pmsh.state_code, pmsh.holiday_date, pmsh.holiday_desc, pmsh.holiday_type, pmsh.status, pmsh.status, pmsh.created_by, pmsh.created_date, ld.Description "
                + "FROM adm_lookup_master lm, adm_lookup_detail ld, pms_holiday pmsh "
                + "WHERE lm.`Master_Reference_code` = ld.`Master_Reference_code` AND ld.`Master_Reference_code` = '0002' AND ld.`Detail_Reference_code` = pmsh.state_code AND ld.hfc_cd = '" + hfc + "' "
                + "ORDER BY pmsh.holiday_date ASC, ld.`Description` ASC";
        ArrayList<ArrayList<String>> data = Conn.getData(sqlDisplayHoliday);
       
 %>
                                    <h3 class="headerTitle">View Holiday</h3>
                                    <div class="dropdown"  style="padding-bottom: 2%">
                                        <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">View By
                                            <span class="caret"></span></button>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" id="stateMenu">
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="state">All States</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="00">National</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="01">Johor</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="02">Kedah</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="03">Kelantan</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="04">Melaka</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="05">Negeri Sembilan</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="06">Pahang</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="08">Perak</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="09">Perlis</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="07">Pulau Pinang</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="12">Sabah</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="13">Sarawak</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="10">Selangor</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="11">Terengganu</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="14">Wilayah Persekutuan Kuala Lumpur</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="16">Wilayah Persekutuan Putrajaya</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="" class="viewHoliday" id="15">Wilayah Persekutuan Labuan</a></li>
                                        </ul>
                                    </div>
                                    <div class="table-responsive" id="viewAllHoliday">
                                        <table class="table table-bordered table-hover" id="viewHoliday">
                                            <thead>
                                                <tr>
                                                    <th><center>No</center></th>
                                            <th><center>Date</center></th>
                                            <th><center>Description</center></th>
                                            <th><center>State Name</center></th>
                                            <th><center>Applicable to</center></th>
                                            <!--<th><center>Status</center></th>-->
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    if (data.size() > 0) {
                                                        for (int i = 0; i < data.size(); i++) {
                                                            Date today = new Date();
                                                            String expectedPattern = "yyyy-MM-dd HH:mm:ss.SSS";
                                                            SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
                                                            String dateFromDB = data.get(i).get(4);
                                                            Date dateDB = formatter.parse(dateFromDB);

                                                            SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
                                                            String date = DATE_FORMAT.format(dateDB);

                                                            SimpleDateFormat df = new SimpleDateFormat("EEEE");
                                                            String newDate = df.format(dateDB);
                                                            //out.print(newDate);

                                                %>
                                                <tr>
                                                    <td><center>
                                                    <%                                                out.print(i + 1);
                                                    %>
                                            </center></td>
                                            <td><center><%=date%></center></td>
                                            <td><left><%=data.get(i).get(5)%></left></td>
                                            <td><left><%=data.get(i).get(11)%></left></td>
                                            <td><left><%=data.get(i).get(6)%></left></td> 
                                            </tr>
                                            <%
                                                        if (dateDB.before(today)) {
                                                            RMIConnector rmic = new RMIConnector();
                                                            String sqlInsert = "UPDATE pms_holiday SET status='inactive' WHERE holiday_date < date(now());";

                                                            boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                                                        }
                                                    }
                                                }%>
                                            </tbody>
                                        </table>
                                    </div>
                             