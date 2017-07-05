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

    if (session.getAttribute("patientPMINo") == null|| session.getAttribute("patientPMINo").equals(" ")) {
        out.print("<br>No patient selected.");
    } else {
        try {

            String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            String pmino = session.getAttribute("patientPMINo").toString();
            String user_id = session.getAttribute("USER_ID").toString();
            String episodeDate = session.getAttribute("episodeDate").toString();

            //out.print(hfc + " ----- " + pmino + " ----- " + episodeDate + " ------ " + user_id);

            Conn conn = new Conn();
            String sql = "SELECT o.encounter_date,o.eye_opening,o.verbal_response,o.motor_response,o.systolic,o.diastolic,o.pulse,o.on_left,o.on_right,o.arm,o.legs FROM lhr_ort_neu_observation_chart o WHERE o.pmi_no='" + pmino + "'";
            ArrayList<ArrayList<String>> q2 = conn.getData(sql);

            String dateTime = q2.get(0).get(0);
            
            DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            DateFormat outputFormat1 = new SimpleDateFormat("KK:mm a");

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
            <th rowspan="2">Date</th>
            <th rowspan="2">Time</th>
            <th colspan="3" style="text-align: center;">Coma Scale</th>
            <th rowspan="2">Blood Presure</th>
            <th colspan="2" style="text-align: center;">Pupil</th>
            <th colspan="2" style="text-align: center;">Limb</th>
            <th rowspan="2">Action</th>
        </tr>
        <tr>
            <th>Eye Opening</th>
            <th>Verbal Response</th>
            <th>Motor Response</th>
            <th>Left</th>
            <th>Right</th>
            <th>Arm</th>
            <th>Legs</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%=outputFormat.format(inputFormat.parse(dateTime))%></td>
            <td><%=outputFormat1.format(inputFormat.parse(dateTime))%></td>
            <td>4</td>
            <td>3</td>
            <td>6</td>
            <td>Systolic:34 Diastolic:186 Pulse:60</td>
            <td><%=q2.get(0).get(7)%></td>
            <td><%=q2.get(0).get(8)%></td>
            <td><%=q2.get(0).get(9)%></td>
            <td><%=q2.get(0).get(10)%></td>
            <td>
                <a data-toggle="modal" href="" class="updateBtnCCN" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block; color: #337ab7;"></i></a> 
                &nbsp;&nbsp; 
                <a href="#" class="deleteBtn" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
            </td>
        </tr>
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
