<%-- 
    Document   : morseAss_retrieve
    Created on : Jul 6, 2017, 10:39:07 AM
    Author     : user
--%>

<%
    String pmiNo = request.getParameter("pmiNo");
    String intervalDay = request.getParameter("day");
    String dateFrom;
    String dateTo;
    
    String query = "select pmi_no, hfc_cd, episode_date, encounter_date, datetime, falling_status, diagnosis_status, type_movement, venofix_syringe_pump, body_structure, mental_status, total_score "
            + "from lhr_ort_nur_morse_fall_scale "
            + "where pmi_no = '"+pmiNo+"' and (date(episode_date) between curdate()- interval "+intervalDay+" day and curdate()) "
            + "GROUP by episode_date, encounter_date, datetime "
            + "order by episode_date desc, encounter_date asc;";
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
        <th>Approval</th>
    </tr>
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
        <td></td>
    </tr>
</table>