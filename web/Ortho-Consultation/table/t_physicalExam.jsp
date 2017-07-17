<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%

    if (session.getAttribute("patientPMINo") == null || session.getAttribute("patientPMINo").equals(" ")) {
        out.print("<br>No data recorded.");
    } else {
        try {

            String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            String pmino = session.getAttribute("patientPMINo").toString();
            String user_id = session.getAttribute("USER_ID").toString();
            String episodeDate = session.getAttribute("episodeDate").toString();
            String time_history = request.getParameter("time_history");

            SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");//dd/MM/yyyy
            Date now = new Date();
            String datetime = sdfDate.format(now);

            String sql = "";
            if (time_history == null) {
                sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "' AND p.episode_date='" + episodeDate + "' AND p.hfc_cd='" + hfc + "' AND DATE(p.encounter_date) = CURDATE()";
            } else if (time_history.equals("Viewby")) {
                sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "' AND p.episode_date='" + episodeDate + "' AND p.hfc_cd='" + hfc + "' AND DATE(p.encounter_date) = CURDATE()";
            } else if (time_history.equals("Today")) {
                sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "' AND p.episode_date='" + episodeDate + "' AND p.hfc_cd='" + hfc + "' AND DATE(p.encounter_date) = CURDATE()";
            } else if (time_history.equals("Yesterday")) {
                sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "' AND p.episode_date='" + episodeDate + "' AND p.hfc_cd='" + hfc + "' AND DATE(p.encounter_date) = SUBDATE('" + datetime + "',1)";
            } else if (time_history.equals("7 Days")) {
                sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "' AND p.episode_date='" + episodeDate + "' AND p.hfc_cd='" + hfc + "' AND DATE(p.encounter_date) between SUBDATE('" + datetime + "',7) and '" + datetime + "'";
            } else if (time_history.equals("30 Days")) {
                sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "' AND p.episode_date='" + episodeDate + "' AND p.hfc_cd='" + hfc + "' AND DATE(p.encounter_date) between SUBDATE('" + datetime + "',30) and '" + datetime + "'";
            } else if (time_history.equals("60 Days")) {
                sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "' AND p.episode_date='" + episodeDate + "' AND p.hfc_cd='" + hfc + "' AND DATE(p.encounter_date) between SUBDATE('" + datetime + "',90) and '" + datetime + "'";
            } else if (time_history.equals("Select_date")) {
                String startDate = request.getParameter("startDate");
                String toDate = request.getParameter("toDate");
                sql = "SELECT p.encounter_date,p.physical_exam,p.search_content,p.comment FROM lhr_ort_neu_physical_examination p WHERE p.pmi_no='" + pmino + "' AND p.episode_date='" + episodeDate + "' AND p.hfc_cd='" + hfc + "' AND DATE(p.encounter_date) BETWEEN '"+startDate+"' AND '"+toDate+"'";
            }
            //out.print(hfc + " ----- " + pmino + " ----- " + episodeDate + " ------ " + user_id);
            Conn conn = new Conn();
            ArrayList<ArrayList<String>> q4 = conn.getData(sql);
%>

<table class="table table-bordered table-striped">
    <tr>
        <th style="width: 10%">Physical Examination</th>
        <td style="width: 60%">
    <dd>Information</dd>
</td>
<td style="width: 20%">Comment</td>
<td style="width: 10%">Action</td>
</tr>
<%
    if (q4.size() > 0) {
        for (int i = 0; i < q4.size(); i++) {%>
<tr>
    <th><%=q4.get(i).get(1)%></th>
    <td><%=q4.get(i).get(2)%></td>
    <td><%=q4.get(i).get(3)%></td>
    <td>
        <a href="#" class="deleteBtn" id="delete_PE_<%=i%>"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
        <script>
            $("#delete_PE_<%=i%>").click(function () {

                var dateTime = "<%=q4.get(i).get(0)%>";
                var r = confirm("Are you sure to delete the data?");
                if (r == true) {
                    $.ajax({
                        url: "../Ortho-Consultation/modal/action/delete_physical_exam.jsp",
                        type: "post",
                        data: {dateTime: dateTime
                        },
                        timeout: 10000,
                        success: function () {

                            $.ajax({
                                url: "../Ortho-Consultation/table/t_physicalExam.jsp",
                                type: "post",
                                timeout: 3000,
                                success: function (returnObservation) {
                                    $('#get_physicalExam').html(returnObservation);
                                    console.log(returnObservation);
                                    $('#get_physicalExam').trigger('contentchanged');
                                    alert("Data recorded is deleted.");
                                }
                            });
                        },
                        error: function (err) {
                            alert("Error update!");
                        }
                    });
                } else {
                    //txt = "You pressed Cancel!";
                }
            });
        </script>
    </td>
</tr>
<%             }
            } else {
                out.print("<br>No data recorded.");
            }
        } catch (Exception e) {
        }

    }
%>
</table>