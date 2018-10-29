<%-- 
    Document   : patientGetAllVitalSigns
    Created on : Oct 27, 2018, 4:36:25 AM
    Author     : Shammugam
--%>

<%@page import="ADM_helper.LookupHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();

    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String pmi_no = request.getParameter("patientPMINo");

    LookupHelper lookH = new LookupHelper(hfc_cd);

    String sql = "";
    String selectSame = " date_format(date(episode_date), '%d/%m/%Y'), date_format(encounter_date, '%H:%i'), hfc_cd ";

    //================================ vital signs =============================================================================
    //              0 1 2               3               4                   5               6                   7               8               9                   10              11          12 
    sql = "SELECT " + selectSame + ", systolic_sitting, diastolic_sitting, sitting_pulse, systolic_standing, diastolic_standing, standing_pulse, systolic_supine, diastolic_supine, supine_pulse, date_format(encounter_date, '%d/%m/%Y %H:%i') FROM lhr_bp WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataBP = con.getData(sql);

    sql = "select " + selectSame + ", temperature_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') from lhr_temperature where pmi_no = '" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataTemper = con.getData(sql);

    sql = "SELECT " + selectSame + ", blood_glucose_level, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_blood_glucose WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataGlucose = con.getData(sql);

    sql = "SELECT " + selectSame + ", spo2_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_spo2 WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataSPO = con.getData(sql);

    sql = "SELECT " + selectSame + ", weight_reading, height_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_weight_height WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataHtWt = con.getData(sql);

    sql = "SELECT " + selectSame + ", gcs_point, date_format(encounter_date,'%d/%m/%Y %H:%i'), gcs_result FROM lhr_gcs WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataGCS = con.getData(sql);

    sql = "SELECT " + selectSame + ", pgcs_point, date_format(encounter_date,'%d/%m/%Y %H:%i'), pgcs_result FROM lhr_pgcs WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataPGCS = con.getData(sql);

    sql = "SELECT " + selectSame + ", point, date_format(encounter_date,'%d/%m/%Y %H:%i'), result FROM lhr_pain_scale WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataPain = con.getData(sql);

    sql = "SELECT " + selectSame + ", rate, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_respiratory_rate WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataRespiratory = con.getData(sql);

    sql = "SELECT " + selectSame + ", circumference_size, date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_head_circumference WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataHead = con.getData(sql);

    sql = "SELECT " + selectSame + ", total_cholesterol,total_unit,"
            + "ldl_cholesterol,ldl_unit,"
            + "hdl_cholesterol,hdl_unit"
            + ",triglycerides,triglycerides_unit"
            + ",non_hdl_c,non_hdl_c_unit"
            + ",tg_to_hdl,tg_to_hdl_ratio_unit"
            + ", date_format(encounter_date,'%d/%m/%Y %H:%i') FROM lhr_cholesterol WHERE pmi_no='" + pmi_no + "' order by encounter_date desc limit 5;";
    ArrayList<ArrayList<String>> dataCholesterol = con.getData(sql);

    // ================================================================== end vital signs ================================================================== //
    boolean isVtsExist = (dataBP.size() > 0 || dataSPO.size() > 0 || dataTemper.size() > 0 || dataHtWt.size() > 0 || dataGlucose.size() > 0 || dataGCS.size() > 0
            || dataPGCS.size() > 0 || dataPain.size() > 0 || dataRespiratory.size() > 0 || dataHead.size() > 0 || dataCholesterol.size() > 0);

    if (isVtsExist) {

%>

<div class="row table-guling" id="ANL_viewDiv" style="max-height: 500px; width: 100%; overflow-y: auto; overflow-style: panner;">

    <table class="table table-bordered">

        <tbody id="detailbyepisode">


            <%         //end vital sign
                if (dataBP.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Blood Pressure</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphBP" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataBP.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="50%">Blood Pressure</td>
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
            <%            }//end BP

                if (dataTemper.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Temperature (&#8451;)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataTemper.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="50%">Temperature</td>
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
            <%            }//end temperature

                if (dataSPO.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Oxygen Saturation (%)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataSPO.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="50%">Oxygen Saturation</td>
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
            <%            }//end spo

                if (dataGlucose.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Blood Glucose Level(mmol/L)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataGlucose.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="50%">Glucose level</td>
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
            <%            }//end glucose

                if (dataHtWt.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Height & Weight</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphHtWt" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataHtWt.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="25%">Weight(kg)</td>
                                    <td width="25%">Height(cm)</td>
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
            <%            }//end height weight

                if (dataGCS.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Glasgow Coma Scale</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataGCS.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="25%">Point</td>
                                    <td width="25%">Result</td>
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
            <%            }//end gcs

                if (dataPGCS.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Pediatric Glasgow Coma Scale</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataPGCS.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="25%">Point</td>
                                    <td width="25%">Result</td>
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
            <%            }//end pgcs

                if (dataPain.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Pain Scale</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataPain.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="25%">Point</td>
                                    <td width="25%">Result</td>
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
            <%            }//end pain scale

                if (dataRespiratory.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Respiratory Rate(bpm)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataRespiratory.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="50%">Rate</td>
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
            <%            }//end respiratory

                if (dataHead.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span class="hidden" id="ANL_chartTitle">Head Circumference(cm)</span> &nbsp; <button class="btn btn-default btn-sm" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataHead.size(); i++) {

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
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="50%">Size</td>
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
            <%            }//end head
                if (dataCholesterol.size() > 0) {

            %>
            <tr class="bg-info summary text-center">
                <td>
                    <span id="ANL_chartTitle">Cholesterol History</span>

                </td>
            </tr>

            <tr data-status="pagado">
                <td>
                    <div style="overflow-x: auto;">
                        <table class="table table-bordered" style="width:100%; text-align: center;">
                            <thead>
                                <tr>
                                    <td width="10%">Date</td>
                                    <td width="10%">Time</td>
                                    <td width="10%">Venue</td>
                                    <td width="10%">Total Cholesterol</td>
                                    <td width="10%">LDL Cholesterol</td>
                                    <td width="10%">HDL Cholesterol</td>
                                    <td width="10%">Triglycerides</td>
                                    <td width="10%">Non HDL-C</td>
                                    <td width="10%">TG to HDL Ratio</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%            for (int i = 0; i < dataCholesterol.size(); i++) {

                                %>
                                <tr>
                                    <td style="width: 7%;"><%=dataCholesterol.get(i).get(0)%></td>
                                    <td style="width: 5%;"><%=dataCholesterol.get(i).get(1)%></td>
                                    <td style="width: 10%;"><%=lookH.getHFCName(dataCholesterol.get(i).get(2))%></td>
                                    <td><%=dataCholesterol.get(i).get(3) + " " + dataCholesterol.get(i).get(4)%></td>
                                    <td><%=dataCholesterol.get(i).get(5) + " " + dataCholesterol.get(i).get(6)%></td>
                                    <td><%=dataCholesterol.get(i).get(7) + " " + dataCholesterol.get(i).get(8)%></td>
                                    <td><%=dataCholesterol.get(i).get(9) + " " + dataCholesterol.get(i).get(10)%></td>
                                    <td><%=dataCholesterol.get(i).get(11) + " " + dataCholesterol.get(i).get(12)%></td>
                                    <td><%=dataCholesterol.get(i).get(13) + " " + dataCholesterol.get(i).get(14)%></td>
                                </tr>
                                <%
                                    }// end for

                                %>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            <%            }//end cholesterol
                //===================================================================== end vital sign ==========================================================================

            %>

        </tbody>
    </table>
</div>  


<%} else {
        out.print("There is no record of vital sign !!!!");
    }%>

