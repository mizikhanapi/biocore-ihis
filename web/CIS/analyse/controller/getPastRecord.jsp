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
    String pmi_no = request.getParameter("pmiNo").trim();
    String intervalDay = request.getParameter("day").trim();
    String dateFrom = request.getParameter("from").trim();
    String dateTo = request.getParameter("to").trim();
    
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
    
    //=================================== LHR general =====================================================================
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
    
     sql="SELECT "+selectSame+", concat(bld_type, ', ', rhesus_type), bld_comment FROM lhr_blood_type_g6pd WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataBloType = con.getData(sql);
    
    sql="SELECT "+selectSame+", icd10_description, `DAB_comment` FROM lhr_disability WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataDisable = con.getData(sql);

    sql="SELECT "+selectSame+", `signDesc`, comment FROM lhr_physical_examination WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPhyExam = con.getData(sql);

    sql="SELECT "+selectSame+", progress_notes FROM lhr_progress_notes WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataProg = con.getData(sql);

    sql="SELECT "+selectSame+", investigation_name, report_notes FROM lhr_radiology_result WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataRad = con.getData(sql);
    
    sql="SELECT "+selectSame+", soh_name, soh_comment  FROM lhr_social_history WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataSocHis = con.getData(sql);
    sql="SELECT soh_code, soh_name, count(soh_code) as jumlah FROM lhr_social_history WHERE pmi_no='"+pmi_no+"' "+whenCondition+" group by soh_name order by jumlah desc;";
    ArrayList<ArrayList<String>> dataSocHisGraph = con.getData(sql);
    
    sql="SELECT "+selectSame+", test_name, test_result FROM lhr_test WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataTest = con.getData(sql);
    
    sql="SELECT "+selectSame+", details FROM lhr_health_of_present_illness WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPreIll = con.getData(sql);

    //================================== end LHR general ===================================================================
   
    //================================ vital signs =============================================================================
    //              0 1 2               3               4                   5               6                   7               8               9                   10              11          12 
    sql="SELECT "+selectSame+", systolic_sitting, diastolic_sitting, sitting_pulse, systolic_standing, diastolic_standing, standing_pulse, systolic_supine, diastolic_supine, supine_pulse, date_format(encounter_date, '%d/%m/%Y %H:%i') FROM lhr_bp WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataBP = con.getData(sql);
    
    sql = "select "+selectSame+", temperature_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') from lhr_temperature where pmi_no = '" + pmi_no + "' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataTemper = con.getData(sql);
    
    sql="SELECT "+selectSame+", blood_glucose_level, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_blood_glucose WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataGlucose = con.getData(sql);
    
    sql="SELECT "+selectSame+", spo2_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_spo2 WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataSPO = con.getData(sql);

    sql="SELECT "+selectSame+", weight_reading, height_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_weight_height WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataHtWt = con.getData(sql);
    
    sql="SELECT "+selectSame+", gcs_point, date_format(encounter_date,'%d/%m/%Y %H:%i'), gcs_result FROM lhr_gcs WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataGCS = con.getData(sql);
    
    sql="SELECT "+selectSame+", pgcs_point, date_format(encounter_date,'%d/%m/%Y %H:%i'), pgcs_result FROM lhr_pgcs WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPGCS = con.getData(sql);
    
    sql="SELECT "+selectSame+", point, date_format(encounter_date,'%d/%m/%Y %H:%i'), result FROM lhr_pain_scale WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataPain = con.getData(sql);
    
    sql="SELECT "+selectSame+", rate, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_respiratory_rate WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataRespiratory = con.getData(sql);
    
    sql="SELECT "+selectSame+", circumference_size, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_head_circumference WHERE pmi_no='"+pmi_no+"' "+whenCondition+" order by encounter_date desc;";
    ArrayList<ArrayList<String>> dataHead = con.getData(sql);
    
    //========================================= end vital signs ==================================================================
    
    boolean isVtsExist = (dataBP.size()>0 || dataSPO.size()>0 || dataTemper.size()>0 || dataHtWt.size()>0 || dataGlucose.size()>0 || dataGCS.size()>0 || dataPGCS.size()>0 || dataPain.size()>0
            || dataRespiratory.size()>0 || dataHead.size()>0);
    
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

//-------------------------------------------------------- vital sign ------------------------------------------------------------
            if (isVtsExist) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Vital Signs</span>
            </td>
        </tr>    
        <%
            }//end vital sign
            
            if (dataBP.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Blood Pressure</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphBP" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataBP.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataBP.get(i))%></p>
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
                                <td>Blood Pressure</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataBP.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataBP.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataBP.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataBP.get(i).get(2))%></td>
            <td>
                <div class="table-guling">
                     <table class="table table-bordered" style="width: 50%; max-width: 400px;">
                            <tr>
                                <td></td>
                                <td>Systolic(mmHg)</td>
                                <td>Diastolic(mmHg)</td>
                                <td>Pulse(bpm)</td>
                            </tr>
                            <tr>
                                <td>Sitting</td>
                                <td><%=dataBP.get(i).get(3)%></td>
                                <td><%=dataBP.get(i).get(4)%></td>
                                <td><%=dataBP.get(i).get(5)%></td>
                            </tr>
                            <tr>
                                <td>Standing</td>
                                <td><%=dataBP.get(i).get(6)%></td>
                                <td><%=dataBP.get(i).get(7)%></td>
                                <td><%=dataBP.get(i).get(8)%></td>
                            </tr>
                            <tr>
                                <td>Supine</td>
                                <td><%=dataBP.get(i).get(9)%></td>
                                <td><%=dataBP.get(i).get(10)%></td>
                                <td><%=dataBP.get(i).get(11)%></td>
                            </tr>
                        </table>
                </div>
            </td>
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
            }//end BP

            if (dataTemper.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Temperature (&#8451;)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
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
            }//end temperature

            if (dataSPO.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Oxygen Saturation (%)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataSPO.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataSPO.get(i))%></p>
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
                                <td>Oxygen Saturation</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataSPO.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataSPO.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataSPO.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataSPO.get(i).get(2))%></td>
            <td><strong><%=dataSPO.get(i).get(3)%></strong></td>
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
            }//end spo

            if (dataGlucose.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Blood Glucose Level(mmol/L)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataGlucose.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataGlucose.get(i))%></p>
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
                                <td>Glucose level</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataGlucose.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataGlucose.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataGlucose.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataGlucose.get(i).get(2))%></td>
            <td><strong><%=dataGlucose.get(i).get(3)%></strong></td>
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
            }//end glucose

            if (dataHtWt.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Height & Weight</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphHtWt" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataHtWt.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataHtWt.get(i))%></p>
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
                                <td>Weight(kg)</td>
                                <td>Height(cm)</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataHtWt.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataHtWt.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataHtWt.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataHtWt.get(i).get(2))%></td>
            <td><strong><%=dataHtWt.get(i).get(3)%></strong></td>
            <td><strong><%=dataHtWt.get(i).get(4)%></strong></td>
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
            }//end height weight

            if (dataGCS.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Glasgow Coma Scale</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataGCS.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataGCS.get(i))%></p>
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
                                <td>Point</td>
                                <td>Result</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataGCS.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataGCS.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataGCS.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataGCS.get(i).get(2))%></td>
            <td><strong><%=dataGCS.get(i).get(3)%></strong></td>
            <td><%=dataGCS.get(i).get(5)%></td>
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
            }//end gcs
            
            if (dataPGCS.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Pediatric Glasgow Coma Scale</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataPGCS.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataPGCS.get(i))%></p>
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
                                <td>Point</td>
                                <td>Result</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataPGCS.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataPGCS.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataPGCS.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataPGCS.get(i).get(2))%></td>
            <td><strong><%=dataPGCS.get(i).get(3)%></strong></td>
            <td><%=dataPGCS.get(i).get(5)%></td>
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
            }//end pgcs

            if (dataPain.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Pain Scale</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataPain.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataPain.get(i))%></p>
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
                                <td>Point</td>
                                <td>Result</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataPain.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataPain.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataPain.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataPain.get(i).get(2))%></td>
            <td><strong><%=dataPain.get(i).get(3)%></strong></td>
            <td><%=dataPain.get(i).get(5)%></td>
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
            }//end pain scale

            if (dataRespiratory.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Respiratory Rate(bpm)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataRespiratory.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataRespiratory.get(i))%></p>
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
                                <td>Rate</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataRespiratory.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataRespiratory.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataRespiratory.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataRespiratory.get(i).get(2))%></td>
            <td><strong><%=dataRespiratory.get(i).get(3)%></strong></td>
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
            }//end respiratory

            if (dataHead.size() > 0) {
                
        %>
        <tr class="bg-info summary text-center">
            <td>
                 <span id="ANL_chartTitle">Head Circumference(cm)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                <%
                    for(int i=0; i<dataHead.size(); i++){
                
                %>
                <p class="hidden"><%=String.join("|", dataHead.get(i))%></p>
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
                                <td>Size</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataHead.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataHead.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataHead.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataHead.get(i).get(2))%></td>
            <td><strong><%=dataHead.get(i).get(3)%></strong></td>
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
            }//end head
//===================================================================== end vital sign ==========================================================================
        
             if (dataBloType.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Blood Type</span> 
                
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
                                <td>Blood & Rhesus</td>
                                <td>Comment</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataBloType.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataBloType.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataBloType.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataBloType.get(i).get(2))%></td>
            <td><strong><%=dataBloType.get(i).get(3)%></strong></td>
            <td>Comment: <%=dataBloType.get(i).get(4)%></td>
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
            }//end blood type

            if (dataDisable.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Disability</span> 
                
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
                                <td>Disability</td>
                                <td>Comment</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataDisable.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataDisable.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataDisable.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataDisable.get(i).get(2))%></td>
            <td><strong><%=dataDisable.get(i).get(3)%></strong></td>
            <td>Comment: <%=dataDisable.get(i).get(4)%></td>
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
            }//end disability

            if (dataPhyExam.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Physical Exam</span> 
                
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
             for (int i = 0; i < dataPhyExam.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataPhyExam.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataPhyExam.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataPhyExam.get(i).get(2))%></td>
            <td><strong><%=dataPhyExam.get(i).get(3)%></strong></td>
            <td>Comment: <%=dataPhyExam.get(i).get(4)%></td>
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
            }//end physical exam

            if (dataProg.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Progress Notes</span> 
                
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
                                <td>Notes</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataProg.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataProg.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataProg.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataProg.get(i).get(2))%></td>
            <td><strong><%=dataProg.get(i).get(3)%></strong></td>
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
            }//end progress

            if (dataRad.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Radiology Result</span> 
                
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
                                <td>Investigation Name</td>
                                <td>Notes</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataRad.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataRad.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataRad.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataRad.get(i).get(2))%></td>
            <td><strong><%=dataRad.get(i).get(3)%></strong></td>
            <td><%=dataRad.get(i).get(4)%></td>
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
            }//end radiology result

            if (dataPro.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Procedure</span> 
                
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
                                <td>Procedure</td>
                                <td>Comment</td>
                                <td>Outcome</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataPro.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataPro.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataPro.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataPro.get(i).get(2))%></td>
            <td><strong><%=dataPro.get(i).get(3)%></strong></td>
            <td><%=dataPro.get(i).get(4)%></td>
            <td><%=dataPro.get(i).get(5)%></td>
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
            }//end procedure

            if (dataTest.size() > 0) {
                
        %>
        <tr class="bg-primary summary text-center">
            <td>
                 <span id="ANL_chartTitle">Lab Result</span> 
                
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
                                <td>Test Name</td>
                                 <td>Outcome</td>
                            </tr>
                        </thead>
                        <tbody>
        <%    
             for (int i = 0; i < dataTest.size(); i++) {

        %>
        <tr>
            <td style="width: 7%;"><%=dataTest.get(i).get(0)%></td>
            <td style="width: 5%;"><%=dataTest.get(i).get(1)%></td>
            <td style="width: 10%;"><%=lookH.getHFCName(dataTest.get(i).get(2))%></td>
            <td><strong><%=dataTest.get(i).get(3)%></strong></td>
            <td><%=dataTest.get(i).get(4)%></td>
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
            }//end test
        %>
    </tbody>
</table>
                                <%}else{
out.print("0");
}%>