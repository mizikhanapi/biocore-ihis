<%-- 
    Document   : neuAssessment
    Created on : Apr 18, 2017, 12:24:40 PM
    Author     : user
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<div id="getNeuAssessment">
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
                String sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.episode_date='"+episodeDate+"' AND hfc_cd='"+hfc+"'";
                ArrayList<ArrayList<String>> q1 = conn.getData(sql);


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
    <%            if (q1.size() > 0) {
                for (int i = 0; i < q1.size(); i++) {
                    DateFormat date_now = new SimpleDateFormat("yyyy-MM-dd");
                    Date current_date = new Date();
                    String now = date_now.format(current_date);
                    out.print(i+1+"  "+q1.get(i).get(48));
            %>
            <a href="#" class="deleteBtn" id="delete_Assessment_<%=i%>"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
                    <script>
                        $("#delete_Assessment_<%=i%>").click(function () {

                            //alert("Are you sure to delete the data?");
                            var dateTime = "<%=q1.get(i).get(48)%>";
                            var r = confirm("Are you sure to delete the data?");
                            if (r == true) {
                                $.ajax({
                                    url: "../Ortho-Consultation/modal/action/delete_assessment.jsp",
                                    type: "post",
                                    data: {dateTime: dateTime
                                    },
                                    timeout: 10000,
                                    success: function () {
                                        alert("Observation record is deleted.");
                                        $("#getNeuAssessment").load("../Ortho-Consultation/neuAssessment.jsp");
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
                    <input type="radio" name="selected_assessment" value="<%=q1.get(i).get(48)%>" <%
                           if(i==0)
                           {%> checked="checked"<%}
                           %>>
    <div class="nota" id="table_assessment">
        <h5></h5>
        <table class="table table-bordered">
            <tr>
                <th colspan="24">Muscle Power</th>
            </tr>
            <tr>
                <th colspan="8">Hip</th>
                <th colspan="4">Knee</th>
                <th colspan="8">Ankle</th>
                <th colspan="4">Toes</th>
            </tr>
            <tr>
                <td colspan="2">SLRT</td>
                <td colspan="2">Extension</td>
                <td colspan="2">Flexion</td>
                <td colspan="2">Abduction</td>
                <td colspan="2">Extension</td>
                <td colspan="2">Flexion</td>
                <td colspan="2">Dorsiflex</td>
                <td colspan="2">Plantarflex</td>
                <td colspan="2">Eversion</td>
                <td colspan="2">Inversion</td>
                <td colspan="2">Dorsiflex</td>
                <td colspan="2">Plantaflex</td>
            </tr>
            <tr>
                <td><%=q1.get(i).get(0)%></td>
                <td><%=q1.get(i).get(1)%></td>
                <td><%=q1.get(i).get(2)%></td>
                <td><%=q1.get(i).get(3)%></td>
                <td><%=q1.get(i).get(4)%></td>
                <td><%=q1.get(i).get(5)%></td>
                <td><%=q1.get(i).get(6)%></td>
                <td><%=q1.get(i).get(7)%></td>
                <td><%=q1.get(i).get(8)%></td>
                <td><%=q1.get(i).get(9)%></td>
                <td><%=q1.get(i).get(10)%></td>
                <td><%=q1.get(i).get(11)%></td>
                <td><%=q1.get(i).get(12)%></td>
                <td><%=q1.get(i).get(13)%></td>
                <td><%=q1.get(i).get(14)%></td>
                <td><%=q1.get(i).get(15)%></td>
                <td><%=q1.get(i).get(16)%></td>
                <td><%=q1.get(i).get(17)%></td>
                <td><%=q1.get(i).get(18)%></td>
                <td><%=q1.get(i).get(19)%></td>
                <td><%=q1.get(i).get(20)%></td>
                <td><%=q1.get(i).get(21)%></td>
                <td><%=q1.get(i).get(22)%></td>
                <td><%=q1.get(i).get(23)%></td>
            </tr>
            <tr>
                <th colspan="24">Sensory</th>
            </tr>
            <tr>
                <td colspan="2">L1</td>
                <td colspan="2">L2</td>
                <td colspan="2">L3</td>
                <td colspan="2">L4</td>
                <td colspan="2">L5</td>
                <td colspan="2">S1</td>
                <td colspan="2">S2</td>
                <td colspan="2">Sacral</td>
                <td colspan="2">Abdominal</td>
                <td colspan="2">Crematenic</td>
                <td colspan="2">Anal</td>
                <td colspan="2">BO</td>
            </tr>
            <tr>
                <td><%=q1.get(i).get(24)%></td>
                <td><%=q1.get(i).get(25)%></td>
                <td><%=q1.get(i).get(26)%></td>
                <td><%=q1.get(i).get(27)%></td>
                <td><%=q1.get(i).get(28)%></td>
                <td><%=q1.get(i).get(29)%></td>
                <td><%=q1.get(i).get(30)%></td>
                <td><%=q1.get(i).get(31)%></td>
                <td><%=q1.get(i).get(32)%></td>
                <td><%=q1.get(i).get(33)%></td>
                <td><%=q1.get(i).get(34)%></td>
                <td><%=q1.get(i).get(35)%></td>
                <td><%=q1.get(i).get(36)%></td>
                <td><%=q1.get(i).get(37)%></td>
                <td><%=q1.get(i).get(38)%></td>
                <td><%=q1.get(i).get(39)%></td>
                <td><%=q1.get(i).get(40)%></td>
                <td><%=q1.get(i).get(41)%></td>
                <td><%=q1.get(i).get(42)%></td>
                <td><%=q1.get(i).get(43)%></td>
                <td><%=q1.get(i).get(44)%></td>
                <td><%=q1.get(i).get(45)%></td>
                <td><%=q1.get(i).get(46)%></td>
                <td><%=q1.get(i).get(47)%></td>
            </tr>
        </table>
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
