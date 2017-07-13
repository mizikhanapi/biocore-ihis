<%-- 
    Document   : neurosurgical
    Created on : Apr 18, 2017, 12:20:37 PM
    Author     : user
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<div id="getNeuObservation">
    <%

        if (session.getAttribute("patientPMINo") == null || session.getAttribute("patientPMINo").equals(" ")) {
            out.print("<br>No data recorded.");
        } else {
            try {

                String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                String pmino = session.getAttribute("patientPMINo").toString();
                String user_id = session.getAttribute("USER_ID").toString();
                String episodeDate = session.getAttribute("episodeDate").toString();

                //out.print(hfc + " ----- " + pmino + " ----- " + episodeDate + " ------ " + user_id);
                Conn conn = new Conn();
                String sql = "SELECT o.encounter_date,o.result,o.points,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "'";
                ArrayList<ArrayList<String>> q2 = conn.getData(sql);

                

                if (q2.size() > 0) {
                    

    %>
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>

        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control">
                    <option>View by</option>
                    <option>Today</option>
                    <option>Yesterday</option>
                    <option>7 Days</option>
                    <option>30 Days</option>
                    <option>60 Days</option>
                    <option>Select date</option>
                </select>
            </div>
        </div>
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="exampleInputName2" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
                </div>
                <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>
    
    <table class="table table-striped">
        <thead style="text-transform: uppercase;" >
            <tr>
                <th rowspan="2">Check</th>
                <th rowspan="2">Date</th>
                <th rowspan="2">Time</th>
                <th colspan="2" style="text-align: center;">Coma Scale</th>
                <th rowspan="2">Blood Presure</th>
                <th colspan="2" style="text-align: center;">Pupil</th>
                <th colspan="2" style="text-align: center;">Limb</th>
                <th rowspan="2">Action</th>
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
            for (int i = 0; i < q2.size(); i++) {
                String dateTime_i = q2.get(i).get(0);
                session.setAttribute("datetime", dateTime_i);
                //String datetime1 = session.getAttribute("datetime").toString();

                //out.print(datetime1);
                DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                DateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
                DateFormat outputFormat1 = new SimpleDateFormat("KK:mm a");
            %>
            <tr>
                <td><input type="radio" name="selected" value="<%=dateTime_i%>" <%
                           if(i==0)
                           {%> checked="checked"<%}
                           %>></td>
                <td><%=outputFormat.format(inputFormat.parse(dateTime_i))%></td>
                <td><%=outputFormat1.format(inputFormat.parse(dateTime_i))%></td>
                <td><%=q2.get(i).get(1)%></td>
                <td><%=q2.get(i).get(2)%></td>
                <td>Systolic:&nbsp;<%=q2.get(i).get(4)%>&nbsp;&nbsp;&nbsp;&nbsp; Diastolic:&nbsp;<%=q2.get(i).get(5)%>&nbsp;&nbsp;&nbsp;&nbsp; Pulse:&nbsp;<%=q2.get(i).get(6)%></td>
                <td><%=q2.get(i).get(7)%></td>
                <td><%=q2.get(i).get(8)%></td>
                <td><%=q2.get(i).get(9)%></td>
                <td><%=q2.get(i).get(10)%></td>
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
                                        alert("Observation record is deleted.");
                                        $("#getNeuObservation").load("../Ortho-Consultation/neuObservation.jsp");
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
</div>
