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
                sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "' AND r.episode_date='" + episodeDate + "' AND r.hfc_cd='" + hfc + "' AND DATE(r.encounter_date) = CURDATE()";
            } else if (time_history.equals("Viewby")) {
                sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "' AND r.episode_date='" + episodeDate + "' AND r.hfc_cd='" + hfc + "' AND DATE(r.encounter_date) = CURDATE()";
            }else if (time_history.equals("Today")) {
                sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "' AND r.episode_date='" + episodeDate + "' AND r.hfc_cd='" + hfc + "' AND DATE(r.encounter_date) = CURDATE()";
            } else if (time_history.equals("Yesterday")) {
                sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "' AND r.episode_date='" + episodeDate + "' AND r.hfc_cd='" + hfc + "' AND DATE(r.encounter_date) = SUBDATE('" + datetime + "',1)";
            } else if (time_history.equals("7 Days")) {
                sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "' AND r.episode_date='" + episodeDate + "' AND r.hfc_cd='" + hfc + "' AND DATE(r.encounter_date) between SUBDATE('" + datetime + "',7) and '" + datetime + "'";
            } else if (time_history.equals("30 Days")) {
                sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "' AND r.episode_date='" + episodeDate + "' AND r.hfc_cd='" + hfc + "' AND DATE(r.encounter_date) between SUBDATE('" + datetime + "',30) and '" + datetime + "'";
            } else if (time_history.equals("60 Days")) {
                sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "' AND r.episode_date='" + episodeDate + "' AND r.hfc_cd='" + hfc + "' AND DATE(r.encounter_date) between SUBDATE('" + datetime + "',90) and '" + datetime + "'";
            }else if (time_history.equals("Select_date")) {
                String startDate = request.getParameter("startDate");
                String toDate = request.getParameter("toDate");
                sql = "SELECT r.encounter_date,r.assessment_type,r.si_pressure_ulcer,r.si_source,r.mobility_assessment,r.int_surface,r.int_mobility,r.int_nutrition,r.int_sc_barrier_product,r.int_sc_maintain_moisture,r.int_sc_incontinence_management,r.assessmen_by FROM lhr_ort_neu_press_injury_risk r  WHERE r.pmi_no='" + pmino + "' AND r.episode_date='" + episodeDate + "' AND r.hfc_cd='" + hfc + "' AND DATE(r.encounter_date) BETWEEN '"+startDate+"' AND '"+toDate+"'";
            }
            

            //out.print(hfc + " ----- " + pmino + " ----- " + episodeDate + " ------ " + user_id);
            Conn conn = new Conn();
            ArrayList<ArrayList<String>> q3 = conn.getData(sql);

            String dateTime = q3.get(0).get(0);

            DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateFormat date = new SimpleDateFormat("dd-MM-yyyy");
            DateFormat time = new SimpleDateFormat("KK:mm a");

            if (q3.size() > 0) {
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

                    $.ajax({
                        url: "../Ortho-Consultation/table/t_PIR_assessment.jsp",
                        type: "post",
                        timeout: 3000,
                        success: function (returnObservation) {
                            $('#getPIRAssessment').html(returnObservation);
                            console.log(returnObservation);
                            $('#getPIRAssessment').trigger('contentchanged');
                            alert("Data recorded is deleted.");
                        }
                    });
//                    alert("Data recorded is deleted.");
//                    $("#getPIRAssessment").load("../Ortho-Consultation/PIRAssessment.jsp");
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
