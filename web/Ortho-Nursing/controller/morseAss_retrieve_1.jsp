<%-- 
    Document   : morseAss_retrieve
    Created on : Jul 6, 2017, 10:39:07 AM
    Author     : user
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String intervalDay = request.getParameter("day");
    String dateFrom = request.getParameter("from");
    String dateTo = request.getParameter("to");

    Conn con = new Conn();

    String whenCondition = "";

    if (!intervalDay.equalsIgnoreCase("all") && !intervalDay.equalsIgnoreCase("x")) {
        whenCondition = " and (date(episode_date) between curdate()- interval " + intervalDay + " day and curdate()) ";
    } else if (intervalDay.equalsIgnoreCase("x")) {
        dateFrom = DateFormatter.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
        dateTo = DateFormatter.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
        whenCondition = " and (date(episode_date) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
    }

    //                        0       1                   2                                         3                         4           5               6                   7               8                   9               10          11              
    String query = "select pmi_no, hfc_cd, date_format(episode_date, '%d/%m/%Y'), date_format(encounter_date, '%d/%m/%Y'), datetime, falling_status, diagnosis_status, type_movement, venofix_syringe_pump, body_structure, mental_status, total_score "
            + "from lhr_ort_nur_morse_fall_scale "
            + "where pmi_no = '" + pmiNo + "' " + whenCondition//and (date(episode_date) between curdate()- interval "+intervalDay+" day and curdate()) "
            + "GROUP by episode_date, encounter_date, datetime "
            + "order by episode_date desc, encounter_date asc;";

    ArrayList<ArrayList<String>> dataMorseFall = con.getData(query);

    if (dataMorseFall.size() < 1) {

        out.print("<div style=\"text-align:center;border:1px solid #2196f3\"><h3>No record found!</h3></div>");
    } else {

        boolean canPrint = false;
        // out.print(pmiNo);
        String episodeDate = "";

%>
<table class="table table-bordered" id="morse_assessment_table">
    <tr>
        <th>Date</th>
        <th>Time</th>
        <th>History of falling</th>
        <th>Diagnosis</th>
        <th>Ambulatory Aid</th>
        <th>IV Venofix / Syringe Pump</th>
        <th>Body structure/Movement</th>
        <th>Mental Status</th>
        <th>Total Score</th>
        
    </tr>

    <%        for (int i = 0; i < dataMorseFall.size(); i++) {
        
        if()

         /* check whether the record has the same date to group it as records of the day*/
            if (!episodeDate.equalsIgnoreCase(dataMorseFall.get(i).get(3)) ) {
                episodeDate = dataMorseFall.get(i).get(3);
               
            }
            
            if(canPrint){
            
    %>
    <tr>
        <td rowspan="3">06/06/2017</td>
        <td>AM</td>
        <td>25</td>
        <td>15</td>
        <td>30</td>
        <td>20</td>
        <td>10</td>
        <td>15</td>
        <td></td>
    </tr>
    <tr>
        <td>PM</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>Noon</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <%
            }//end else if canPrint
    %>    
</table>
<%    }//else end; outer most if checking
%>