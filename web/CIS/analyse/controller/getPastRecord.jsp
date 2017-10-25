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
    String selectSame=" date(episode_date), date_format(encounter_date, '%H:%i'), hfc_cd ";
    
    String whenCondition="";
    
    if (!intervalDay.equalsIgnoreCase("all") && !intervalDay.equalsIgnoreCase("x")) {
        whenCondition = " and (date(episode_date) between curdate()- interval " + intervalDay + " day and curdate()) ";
    } else if (intervalDay.equalsIgnoreCase("x")) {
        dateFrom = FormatTarikh.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
        dateTo = FormatTarikh.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
        whenCondition = " and (date(episode_date) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
    }
    //               0 1 2              3           4           5
    sql = "SELECT "+selectSame+", symptom_name,severity_desc, comment FROM lhr_signs where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataChiefComplaint = con.getData(sql);
    sql="SELECT symptom_cd, symptom_name, count(symptom_name) as jumlah FROM lhr_signs where pmi_no = '" + pmi_no + "' "+whenCondition+" group by symptom_cd order by jumlah desc;";
    ArrayList<ArrayList<String>> dataChiefComplaintGraph = con.getData(sql);
    
    //out.println(sql);
    sql = "select "+selectSame+", icd10_description, comment from lhr_family_history where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataFamHis = con.getData(sql);
    sql = "select icd10_cd, icd10_description, count(icd10_cd) as jumlah from lhr_family_history where pmi_no = '" + pmi_no + "' "+whenCondition+" group by icd10_description order by jumlah desc;";
    ArrayList<ArrayList<String>> dataFamHisGraph = con.getData(sql);

    sql = "select "+selectSame+", icd10_description, comment from lhr_past_medical_history where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPastMed = con.getData(sql);
    sql = "select icd10_cd, icd10_description, count(icd10_cd) as jumlah from lhr_past_medical_history where pmi_no = '" + pmi_no + "' "+whenCondition+" group by icd10_cd order by jumlah desc;";
    ArrayList<ArrayList<String>> dataPastMedGraph = con.getData(sql);

    sql = "select "+selectSame+", icd10_description, comment from lhr_immunisation where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataImmun = con.getData(sql);

    sql = "select "+selectSame+", leave_type, comment from lhr_med_leave where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataMedLeav = con.getData(sql);
    
    //                0 1 2        3            4               5               6
    sql = "select "+selectSame+", drug_name, drug_freq_desc, drug_strength, drug_dosage from lhr_medication where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataMed = con.getData(sql);
    sql="Select drug_cd, drug_name, sum(quantity) as jumlah from lhr_medication where pmi_no = '" + pmi_no + "' "+whenCondition+" group by drug_cd order by jumlah desc;";
    ArrayList<ArrayList<String>> dataMedGraph = con.getData(sql);
    
                        //0             1       2 3 4
    sql = "select "+selectSame+", icd10_description, comment from lhr_diagnosis where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataDiag = con.getData(sql);
    sql = "select icd10_cd, icd10_description, count(icd10_cd) as jumlah from lhr_diagnosis where pmi_no = '" + pmi_no + "' "+whenCondition+" group by icd10_cd order by jumlah desc;";
    ArrayList<ArrayList<String>> dataDiagGraph = con.getData(sql);

    sql = "select "+selectSame+", procedure_name, comment, procedure_outcome from lhr_procedure where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPro = con.getData(sql);

    sql = "select date(episode_date), date_format(encounter_cd, '%H:%i'), hfc_cd, icd10_description, comment  from lhr_allergy where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_cd desc;";
    ArrayList<ArrayList<String>> dataAllergy = con.getData(sql);
    sql = "select allergy_cd, icd10_description, count(icd10_cd) as jumlah  from lhr_allergy where pmi_no = '" + pmi_no + "' "+whenCondition+" group by allergy_cd order by jumlah desc;";
    ArrayList<ArrayList<String>> dataAllergyGraph = con.getData(sql);

    sql = "select "+selectSame+", temperature_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') from lhr_temperature where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
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
    
    sql="SELECT "+selectSame+", soh_name, soh_comment  FROM lhr_social_history WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataSocHis = con.getData(sql);
    sql="SELECT soh_code, soh_name, count(soh_code) as jumlah FROM lhr_social_history WHERE pmi_no='"+pmi_no+"' "+whenCondition+" group by soh_name order by jumlah desc;";
    ArrayList<ArrayList<String>> dataSocHisGraph = con.getData(sql);

    sql="SELECT spo2_reading FROM lhr_spo2 WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataSPO = con.getData(sql);

    sql="SELECT test_name, test_result FROM lhr_test WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataTest = con.getData(sql);

    sql="SELECT weight_reading, height_reading FROM lhr_weight_height WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataHtWt = con.getData(sql);

    sql="SELECT "+selectSame+", details FROM lhr_health_of_present_illness WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
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
        <tr class="bg-primary summary text-center">
            <td>
                <span id="ANL_chartTitle">Diagnosis</span> &nbsp; <button class="btn btn-default" id="ANL_btnGraph" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataDiagGraph.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataDiagGraph.get(i))%></p>
                <%
                    }//end for
                %>
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Diagnosis</td>
                                <td>Comment</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataDiag.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataDiag.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataDiag.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataDiag.get(i).get(2))%></td>
            <td><strong><%=dataDiag.get(i).get(3)%></strong></td>
            <td>Comment: <%=dataDiag.get(i).get(4)%></td>
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
                <span id="ANL_chartTitle">Chief Complaint</span> &nbsp; <button class="btn btn-default" id="ANL_btnGraph" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
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
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Complaint</td>
                                <td>Severity</td>
                                <td>Comment</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataChiefComplaint.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataChiefComplaint.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataChiefComplaint.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataChiefComplaint.get(i).get(2))%></td>
            <td><strong><%=dataChiefComplaint.get(i).get(3)%></strong></td>
            <td>Severity: <%=dataChiefComplaint.get(i).get(4)%></td>
            <td>Comment: <%=dataChiefComplaint.get(i).get(5)%></td>
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
            }//end complaint

            if (dataAllergy.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                <span id="ANL_chartTitle">Allergy</span> &nbsp; <button class="btn btn-default" id="ANL_btnGraph" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataAllergyGraph.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataAllergyGraph.get(i))%></p>
                <%
                    }//end for
                %>
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Allergy</td>
                                <td>Comment</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataAllergy.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataAllergy.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataAllergy.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataAllergy.get(i).get(2))%></td>
            <td><strong><%=dataAllergy.get(i).get(3)%></strong></td>
            <td>Comment: <%=dataAllergy.get(i).get(4)%></td>
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
            }//end allergy

            if (dataMed.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                <span id="ANL_chartTitle">Medication</span> &nbsp; <button class="btn btn-default" id="ANL_btnGraph" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataMedGraph.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataMedGraph.get(i))%></p>
                <%
                    }//end for
                %>
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Drug Name</td>
                                <td>Frequency</td>
                                <td>Strength</td>
                                <td>Dose</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataMed.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataMed.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataMed.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataMed.get(i).get(2))%></td>
            <td><strong><%=dataMed.get(i).get(3)%></strong></td>
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

            if (dataPreIll.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                Present Illness
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Details</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataPreIll.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataPreIll.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataPreIll.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataPreIll.get(i).get(2))%></td>
            <td><strong><%=dataPreIll.get(i).get(3)%></strong></td>
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

            if (dataPastMed.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Past Medical History</span> &nbsp; <button class="btn btn-default" id="ANL_btnGraph" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataPastMedGraph.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataPastMedGraph.get(i))%></p>
                <%
                    }//end for
                %>
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Description</td>
                                <td>Comment</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataPastMed.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataPastMed.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataPastMed.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataPastMed.get(i).get(2))%></td>
            <td><strong><%=dataPastMed.get(i).get(3)%></strong></td>
            <td>Comment: <%=dataPastMed.get(i).get(4)%></td>
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

            if (dataFamHis.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Family History</span> &nbsp; <button class="btn btn-default" id="ANL_btnGraph" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataFamHisGraph.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataFamHisGraph.get(i))%></p>
                <%
                    }//end for
                %>
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Description</td>
                                <td>Comment</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataFamHis.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataFamHis.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataFamHis.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataFamHis.get(i).get(2))%></td>
            <td><strong><%=dataFamHis.get(i).get(3)%></strong></td>
            <td>Comment: <%=dataFamHis.get(i).get(4)%></td>
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
            }//end family history

            if (dataSocHis.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Social History</span> &nbsp; <button class="btn btn-default" id="ANL_btnGraph" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataSocHisGraph.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataSocHisGraph.get(i))%></p>
                <%
                    }//end for
                %>
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Description</td>
                                <td>Comment</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataSocHis.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataSocHis.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataSocHis.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataSocHis.get(i).get(2))%></td>
            <td><strong><%=dataSocHis.get(i).get(3)%></strong></td>
            <td>Comment: <%=dataSocHis.get(i).get(4)%></td>
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
            }//end social history

            if (isVtsExist) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Vital Signs</span>
            </td>
        </tr>    
        <%
            }//end vital sign

            if (dataTemper.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Temperature (&#8451;)</span> &nbsp; <button class="btn btn-default" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataTemper.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataTemper.get(i))%></p>
                <%
                    }//end for
                %>
            </td>
        </tr>
       
        <tr data-status="pagado">
            <td>
                <div style="overflow-x: auto;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>Date</td>
                                <td>Time</td>
                                <td>Venue</td>
                                <td>Temperature</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataTemper.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataTemper.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataTemper.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataTemper.get(i).get(2))%></td>
            <td><strong><%=dataTemper.get(i).get(3)%></strong></td>
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
            }//end social history
        %>
    </tbody>
</table>
                                <%}else{
out.print("0");
}%>