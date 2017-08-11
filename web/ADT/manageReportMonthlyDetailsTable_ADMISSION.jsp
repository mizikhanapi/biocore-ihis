<%-- 
    Document   : manageReportMonthlyDetailsTable
    Created on : Jun 28, 2017, 12:35:21 PM
    Author     : Shammugam
--%>



<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>

<table  id="reportMonthlyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">MONTH</th>
    <th style="text-align: center;">ID NUMBER</th>
    <th style="text-align: center;">PATIENT NAME </th>
    <th style="text-align: center;">REASON OF ADMIT</th>
    <th style="text-align: center;">ELIGIBILITY TYPE</th>
</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        String date = request.getParameter("date");

        double quantity = 0.00;
       // double test = 0.00;
        double grandTotal = 0.00;

        String sql = " SELECT DATE_FORMAT(wis_inpatient_episode.episode_date, '%M %Y') AS DATE, "
                + " wis_inpatient_episode.NEW_IC_NO, wis_inpatient_episode.PATIENT_NAME, wis_inpatient_episode.admission_description, adm_lookup_detail.Description,COUNT(wis_inpatient_episode.pmi_no) "
                + " FROM wis_inpatient_episode "
                + " JOIN adm_lookup_detail ON (adm_lookup_detail.Detail_Reference_Code =  wis_inpatient_episode.eligibility_category_cd) "
                + " WHERE wis_inpatient_episode.hfc_cd  = '" + hfc + "'  AND adm_lookup_detail.master_reference_code = '0063' AND EXTRACT(YEAR_MONTH FROM wis_inpatient_episode.created_date) = '" + date + "'group by  wis_inpatient_episode.pmi_no ";

        ArrayList<ArrayList<String>> dataReportMonthly = conn.getData(sql);

        int size = dataReportMonthly.size();
        for (int i = 0; i < size; i++) {
            //test = size;
             //int test = dataReportMonthly.get(i).get(0).size();
           // quantity = quantity + Double.parseDouble(dataReportMonthly.get(i).get(5));
            // test = size;
            //  grandTotal = grandTotal + Double.parseDouble(dataReportMonthly.get(i).get(4));
%>

    <tr style="text-align: center;" id="">
        <td><%= dataReportMonthly.get(i).get(0)%></td>
        <td><%= dataReportMonthly.get(i).get(1)%></td>
        <td><%= dataReportMonthly.get(i).get(2)%></td> 
        <td><%= dataReportMonthly.get(i).get(3)%></td>
        <td><%= dataReportMonthly.get(i).get(4)%></td>


    </tr>
    <%
        }
    %>
</tbody>
</table>

<ShannugamRamasamySeperator></ShannugamRamasamySeperator>
    <%=dataReportMonthly.size()%>
<ShannugamRamasamySeperator></ShannugamRamasamySeperator>
<%=formatter.format(grandTotal)%>