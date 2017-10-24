<%-- 
    Document   : getPastRecord
    Created on : Oct 24, 2017, 8:54:24 AM
    Author     : user
--%>

<%@page import="ADM_helper.LookupHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String pmi_no = request.getParameter("pmiNo");
    String intervalDay = request.getParameter("day");
    String dateFrom = request.getParameter("from");
    String dateTo = request.getParameter("to");
    
    LookupHelper lookH = new LookupHelper(hfc_cd);
    
    String sql="";
    String selectSame=" ,date(episode_date), date_format(encounter_date, '%H:%i'), hfc_cd ";
    
    String whenCondition="";
    
    if (!intervalDay.equalsIgnoreCase("all") && !intervalDay.equalsIgnoreCase("x")) {
        whenCondition = " and (date(episode_date) between curdate()- interval " + intervalDay + " day and curdate()) ";
    } else if (intervalDay.equalsIgnoreCase("x")) {
        dateFrom = FormatTarikh.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
        dateTo = FormatTarikh.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
        whenCondition = " and (date(episode_date) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
    }
    //                  0           1            2       3 4 5
    sql = "SELECT symptom_name,severity_desc, comment "+selectSame+" FROM lhr_signs where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataChiefComplaint = con.getData(sql);
    sql="SELECT symptom_cd, symptom_name, count(symptom_name) FROM lhr_signs where pmi_no = '" + pmi_no + "' "+whenCondition+" group by symptom_cd;";
    ArrayList<ArrayList<String>> dataChiefComplaintGraph = con.getData(sql);
    
    //out.println(sql);
    sql = "select icd10_description, comment "+selectSame+" from lhr_family_history where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataFamHis = con.getData(sql);

    sql = "select icd10_description, comment "+selectSame+" from lhr_past_medical_history where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPastMed = con.getData(sql);

    sql = "select icd10_description, comment "+selectSame+" from lhr_immunisation where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataImmun = con.getData(sql);

    sql = "select leave_type, comment "+selectSame+" from lhr_med_leave where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataMedLeav = con.getData(sql);
    
    //                0        1 2 3            4               5               6
    sql = "select drug_name "+selectSame+", drug_freq_desc, drug_strength, drug_dosage from lhr_medication where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataMed = con.getData(sql);
                        //0             1       2 3 4
    sql = "select icd10_description, comment "+selectSame+" from lhr_diagnosis where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataDiag = con.getData(sql);

    sql = "select procedure_name, comment, procedure_outcome "+selectSame+" from lhr_procedure where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPro = con.getData(sql);

    sql = "select icd10_description, comment  from lhr_allergy where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataAllergy = con.getData(sql);

    sql = "select temperature_reading, comment from lhr_temperature where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataTemper = con.getData(sql);
    
    sql="SELECT blood_glucose_level FROM lhr_blood_glucose WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataGlucose = con.getData(sql);
    
    sql="SELECT concat(bld_type, ', ', rhesus_type), bld_comment FROM lhr_blood_type_g6pd WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataBloType = con.getData(sql);

    sql="SELECT systolic_sitting, diastolic_sitting, sitting_pulse, systolic_standing, diastolic_standing, standing_pulse, systolic_supine, diastolic_supine, supine_pulse FROM lhr_bp WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataBP = con.getData(sql);

    sql="SELECT icd10_description, `DAB_comment` FROM lhr_disability WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataDisable = con.getData(sql);

    sql="SELECT `signDesc`, comment FROM lhr_physical_examination WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPhyExam = con.getData(sql);

    sql="SELECT progress_notes FROM lhr_progress_notes WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataProg = con.getData(sql);

    sql="SELECT investigation_name, report_notes FROM lhr_radiology_result WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataRad = con.getData(sql);
    
    sql="SELECT soh_name, soh_comment  FROM lhr_social_history WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataSocHis = con.getData(sql);

    sql="SELECT spo2_reading FROM lhr_spo2 WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataSPO = con.getData(sql);

    sql="SELECT test_name, test_result FROM lhr_test WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataTest = con.getData(sql);

    sql="SELECT weight_reading, height_reading FROM lhr_weight_height WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataHtWt = con.getData(sql);

    sql="SELECT details FROM lhr_health_of_present_illness WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPreIll = con.getData(sql);
    
    boolean isVtsExist = (dataBP.size()>0 || dataSPO.size()>0 || dataTemper.size()>0 || dataHtWt.size()>0 || dataGlucose.size()>0);
    
    boolean isLHRExist = (dataDiag.size()>0 || dataChiefComplaint.size()>0 || dataMed.size()>0 || dataPreIll.size()>0 || dataPastMed.size()>0 || dataFamHis.size()>0 || dataImmun.size()>0
            || dataMedLeav.size()>0 || dataAllergy.size()>0 || dataDisable.size()>0 || dataProg.size()>0 || dataPro.size()>0 || dataBloType.size()>0 || dataPhyExam.size()>0 || dataRad.size()>0
            || dataSocHis.size()>0 || dataTest.size()>0);
    
    if(isVtsExist || isLHRExist){

%>
<table class="table table-bordered">
    
    <tbody id="detailbyepisode">
        <%
            if (dataDiag.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center"><td>Diagnosis</td></tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <tbody>
        <%    
             for (int i = 0; i < dataDiag.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataDiag.get(i).get(2)%></td>
            <td style="width: 5%;"><%=dataDiag.get(i).get(3)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataDiag.get(i).get(4))%></td>
            <td><strong><%=dataDiag.get(i).get(0)%></strong></td>
            <td>Comment: <%=dataDiag.get(i).get(1)%></td>
        </tr>
        <%
            }// end for
                
        %>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        <%
            }//end diag

            if (dataChiefComplaint.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                Chief Complaint &nbsp; <button class="btn btn-default" id="ANL_btnGraph" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataChiefComplaintGraph.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataChiefComplaintGraph.get(i))%></p>
                <%
                    }//end for
                %>
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <tbody>
        <%    
             for (int i = 0; i < dataChiefComplaint.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataChiefComplaint.get(i).get(3)%></td>
            <td style="width: 5%;"><%=dataChiefComplaint.get(i).get(4)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataChiefComplaint.get(i).get(5))%></td>
            <td><strong><%=dataChiefComplaint.get(i).get(0)%></strong></td>
            <td>Severity: <%=dataChiefComplaint.get(i).get(1)%></td>
            <td>Comment: <%=dataChiefComplaint.get(i).get(2)%></td>
        </tr>
        <%
            }// end for
                
        %>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        <%
            }//end diag

            if (dataMed.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center"><td>Medication</td></tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <tbody>
        <%    
             for (int i = 0; i < dataMed.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataMed.get(i).get(1)%></td>
            <td style="width: 5%;"><%=dataMed.get(i).get(2)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataMed.get(i).get(3))%></td>
            <td><strong><%=dataMed.get(i).get(0)%></strong></td>
            <td>Frequency: <%=dataMed.get(i).get(4)%></td>
            <td>Strength: <%=dataMed.get(i).get(5)%></td>
            <td>Dose: <%=dataMed.get(i).get(6)%></td>
        </tr>
        <%
            }// end for
                
        %>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
        <%
            }//end diag
        %>
    </tbody>
</table>
                                <%}else{
out.print("0");
}%>