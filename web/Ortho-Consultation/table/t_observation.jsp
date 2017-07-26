<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>

<table class="table table-striped table-bordered" id="table_observe">
    <thead style="text-transform: uppercase;" >
        <tr>
            <th rowspan="2" style="vertical-align: middle;">Check</th>
            <th rowspan="2" style="vertical-align: middle;">Date</th>
            <th rowspan="2" style="vertical-align: middle;">Time</th>
            <th colspan="2" style="text-align: center;">Coma Scale</th>
            <th rowspan="2" style="vertical-align: middle;">Blood Presure</th>
            <th colspan="2" style="text-align: center;">Pupil</th>
            <th colspan="2" style="text-align: center;">Limb</th>
            <th rowspan="2" style="vertical-align: middle;">Action</th>
        </tr>
        <tr>
            <th>Result</th>
            <th>Points</th>
            <th>Left</th>
            <th>Right</th>
            <th>Arm</th>
            <th>Legs</th>
        </tr>
    </thead>
    <tbody>
        <%

            if (session.getAttribute("patientPMINo") == null || session.getAttribute("patientPMINo").equals(" ")) {
                out.print("<br>No data recorded.");
            } else {
                try {
                    String time_history = request.getParameter("time_history");
                    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                    String pmino = session.getAttribute("patientPMINo").toString();
                    String user_id = session.getAttribute("USER_ID").toString();
                    String episodeDate = session.getAttribute("episodeDate").toString();

                    SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");//dd/MM/yyyy
                    Date now = new Date();
                    String dateTime = sdfDate.format(now);

                    //String dateTime = DATE();
                    String sql = "";

                    if (time_history == null) {
                        sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "' AND o.hfc_cd='" + hfc + "' AND DATE(o.encounter_date) = CURDATE()";
                    } else if (time_history.equals("Viewby")) {
                        sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "' AND o.hfc_cd='" + hfc + "' AND DATE(o.encounter_date) = CURDATE()";
                    } else if (time_history.equals("Today")) {
                        sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "' AND o.hfc_cd='" + hfc + "' AND DATE(o.encounter_date) = CURDATE()";
                    } else if (time_history.equals("Yesterday")) {
                        sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "' AND o.hfc_cd='" + hfc + "' AND DATE(o.encounter_date) = SUBDATE('" + dateTime + "',1)";
                    } else if (time_history.equals("7 Days")) {
                        sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "' AND o.hfc_cd='" + hfc + "' AND DATE(o.encounter_date) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "'";
                    } else if (time_history.equals("30 Days")) {
                        sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "' AND o.hfc_cd='" + hfc + "' AND DATE(o.encounter_date) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'";
                    } else if (time_history.equals("60 Days")) {
                        sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "' AND o.hfc_cd='" + hfc + "' AND DATE(o.encounter_date) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "'";
                    } else if (time_history.equals("Select_date")) {
                        String startDate = request.getParameter("startDate");
                        String toDate = request.getParameter("toDate");
                        sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "' AND o.hfc_cd='" + hfc + "' AND DATE(o.encounter_date) BETWEEN '" + startDate + "' AND '" + toDate + "'";
                    }
                    //out.print(hfc + " ----- " + pmino + " ----- " + episodeDate + " ------ " + user_id);
                    Conn conn = new Conn();

                    //out.print(datetime1);
                    DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    DateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
                    DateFormat outputFormat1 = new SimpleDateFormat("KK:mm a");
                    ArrayList<ArrayList<String>> q2 = conn.getData(sql);

                    if (q2.size() > 0) {

                        for (int i = 0; i < q2.size(); i++) {
                            String dateTime_i = q2.get(i).get(0);
                            session.setAttribute("datetime", dateTime_i);
                            //String datetime1 = session.getAttribute("datetime").toString();

        %>
        <tr>
            <td style="text-align: center;">
                <div class="radio radio-primary" style="display: inline;">
                       <input type="radio" name="selected" value="<%=dateTime_i%>" <%
                        if (i == 0) {%> checked="checked"<%}%> id="t-observe-0<%=i + 1%>">
                    <label for="t-observe-0<%=i + 1%>">
                        &nbsp;
                    </label>
                </div>



            </td>
            <td><%=outputFormat.format(inputFormat.parse(dateTime_i))%></td>
            <td><%=outputFormat1.format(inputFormat.parse(dateTime_i))%></td>
            <td><%if (q2.get(i).get(1) == null) {
                    out.print("");
                } else {
                    out.print(q2.get(i).get(1));
                }%></td>
            <td><%if (q2.get(i).get(2) == null) {
                    out.print("");
                } else {
                    out.print(q2.get(i).get(2));
                }%></td>
            <td>
                <span style="font-weight: 500; padding-right: 5px;">Systolic:</span><%if (q2.get(i).get(4) == null) {
                        out.print("");
                    } else {
                        out.print(q2.get(i).get(4));
                    }%>
                <span style="font-weight: 500; padding-left: 15px; padding-right: 5px;">Diastolic:</span><%if (q2.get(i).get(5) == null) {
                        out.print("");
                    } else {
                        out.print(q2.get(i).get(5));
                    }%>
                <span style="font-weight: 500; padding-left: 15px; padding-right: 5px;">Pulse:</span><%if (q2.get(i).get(6) == null) {
                        out.print("");
                    } else {
                        out.print(q2.get(i).get(6));
                    }%>
            </td>
            <td><%if (q2.get(i).get(7) == null) {
                    out.print("");
                } else {
                    out.print(q2.get(i).get(7));
                }%></td>
            <td><%if (q2.get(i).get(8) == null) {
                    out.print("");
                } else {
                    out.print(q2.get(i).get(8));
                }%></td>
            <td><%if (q2.get(i).get(9) == null) {
                    out.print("");
                } else {
                    out.print(q2.get(i).get(9));
                }%></td>
            <td><%if (q2.get(i).get(10) == null) {
                    out.print("");
                } else {
                    out.print(q2.get(i).get(10));
                }%></td>
            <td>
                <a href="#" class="deleteBtn" id="delete_observation_<%=i%>"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
                <script>
                    $("#delete_observation_<%=i%>").click(function () {

                        //alert("Are you sure to delete the data?");
                        var dateTime = "<%=dateTime_i%>";
                        var r = confirm("Are you sure to delete the data?");
                        if (r == true) {
                            $.ajax({
                                url: "../Ortho-Consultation/modal/action/delete_observation.jsp",
                                type: "post",
                                data: {dateTime: dateTime
                                },
                                timeout: 10000,
                                success: function () {

                                    $.ajax({
                                        url: "../Ortho-Consultation/table/t_observation.jsp",
                                        type: "post",
                                        timeout: 3000,
                                        success: function (returnObservation) {
                                            $('#getNeuObservation').html(returnObservation);
                                            console.log(returnObservation);
                                            $('#getNeuObservation').trigger('contentchanged');
                                            bootbox.alert("Observation record is deleted.");
                                        }
                                    });

                                },
                                error: function (err) {
                                    bootbox.alert("Error update!");
                                }
                            });
                        } else {
                            //txt = "You pressed Cancel!";
                        }
                    });
                </script>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
<%             } else {
                out.print("<br>No data recorded.");
            }
        } catch (Exception e) {
        }

    }
%>
<script>
    $(document).ready(function () {
        $('#table_observe').DataTable({
            language: {
                emptyTable: "No Data Available To Display"
            }
        });
    });
</script>