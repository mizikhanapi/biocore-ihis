<%-- 
    Document   : PIRAssessment
    Created on : Apr 18, 2017, 12:25:09 PM
    Author     : user
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<div id="getPIRAssessment">
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
                String sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "'";
                ArrayList<ArrayList<String>> q3 = conn.getData(sql);

                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
                DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");

                String dateTime = q3.get(0).get(0);

                DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                DateFormat date = new SimpleDateFormat("dd-MM-yyyy");
                DateFormat time = new SimpleDateFormat("KK:mm a");
    %>

    <div class="row" id="PIR_Assessment">
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
    <% if (q3.size() > 0) {
            for (int i = 0; i < q3.size(); i++) {
    %>
    <a href="#" class="deleteBtn" id="delete_PIR_<%=i%>"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
    <script>
        $("#delete_PIR_<%=i%>").click(function () {

            //alert("Are you sure to delete the data?");
            var dateTime = "<%=q3.get(i).get(0)%>";
            var r = confirm("Are you sure to delete the data?");
            if (r == true) {
                $.ajax({
                    url: "../Ortho-Consultation/modal/action/delete_PIR.jsp",
                    type: "post",
                    data: {dateTime: dateTime
                    },
                    timeout: 10000,
                    success: function () {
                        alert("Data recorded is deleted.");
                        $("#getPIRAssessment").load("../Ortho-Consultation/PIRAssessment.jsp");
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
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-3">
                    <dt style="font-size: 18px;">Assessment Type: Re assessment</dt>
                    <dt><%=date.format(inputFormat.parse(dateTime))%> | <%=time.format(inputFormat.parse(dateTime))%></dt>
                    <dd>Name of Assessor: <strong><%=q3.get(i).get(11)%></strong></dd>

                </div>
                <div class="col-xs-3">
                    <dt style="font-size: 18px;">Skin Integrity</dt>
                    <dd>Evidence of pressure ulcer: <strong><%=q3.get(i).get(2)%></strong></dd>
                    <dd>Source: <strong><%=q3.get(i).get(3)%></strong></dd>
                </div>
                <div class="col-xs-3">
                    <dt style="font-size: 18px;">Mobility Assessment</dt>
                    <dd>Why patient unable to move himself/herself?: </dd>
                    <dd><strong><%=q3.get(i).get(4)%></strong></dd>
                </div>
                <div class="col-xs-3">
                    <dt style="font-size: 18px;">Intervention</dt>
                    <dd>Surface: <strong><%=q3.get(i).get(5)%></strong></dd>
                    <dd>Mobility: <strong><%=q3.get(i).get(6)%></strong></dd>
                    <dd>Nutrition: <strong><%=q3.get(i).get(7)%></strong></dd>
                    <dd>Skin Care:</dd>
                    <dd style="padding-left: 15px;">Barrier product: <strong><%=q3.get(i).get(8)%></strong></dd>
                    <dd style="padding-left: 15px;">Maintain moisture: <strong><%=q3.get(i).get(9)%></strong></dd>
                    <dd style="padding-left: 15px;">Incontinence management: <strong><%=q3.get(i).get(10)%></strong></dd>
                </div>
            </div>  
        </div>
    </div>

    <%             }
                } else {
                    out.print("<br>No data recorded.");
                }
            } catch (Exception e) {
            }

        }
    %>   
</div>

