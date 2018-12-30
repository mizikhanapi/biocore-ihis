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
    String sqlGraph = "";
    String selectSame = " date_format(date(episode_date), '%d/%m/%Y'), date_format(encounter_date, '%H:%i'), hfc_cd ";

    //================================ vital signs =============================================================================
    //              0 1 2               3               4                   5               6                   7               8               9                   10              11          12 
    sqlGraph = "SELECT " + selectSame + ", systolic_sitting, diastolic_sitting, sitting_pulse, systolic_standing, diastolic_standing, standing_pulse, systolic_supine, diastolic_supine, supine_pulse, date_format(encounter_date, '%d/%m/%Y %H:%i') "
            + " FROM (SELECT * FROM lhr_bp WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7) "
            + " SUB ORDER BY episode_date ASC; ";
    //              0 1 2               3               4                   5               6                   7               8               9                   10              11          12 
    sql = "SELECT " + selectSame + ", systolic_sitting, diastolic_sitting, sitting_pulse, systolic_standing, diastolic_standing, standing_pulse, systolic_supine, diastolic_supine, supine_pulse, date_format(encounter_date, '%d/%m/%Y %H:%i') "
            + " FROM lhr_bp WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7; ";
    ArrayList<ArrayList<String>> dataBP = con.getData(sql);
    ArrayList<ArrayList<String>> dataBPGraph = con.getData(sqlGraph);

    //                  0 1 2           3                   4
    sqlGraph = "SELECT " + selectSame + ", rate, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM (SELECT * FROM lhr_respiratory_rate WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7) "
            + " SUB ORDER BY episode_date ASC; ";
    //                  0 1 2           3                   4
    sql = "SELECT " + selectSame + ", rate, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM lhr_respiratory_rate WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7; ";
    ArrayList<ArrayList<String>> dataRespiratory = con.getData(sql);
    ArrayList<ArrayList<String>> dataRespiratoryGraph = con.getData(sqlGraph);

    //                  0 1 2               3                           4
    sqlGraph = "SELECT " + selectSame + ", spo2_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM (SELECT * FROM lhr_spo2 WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7) "
            + " SUB ORDER BY episode_date ASC; ";
    //                  0 1 2               3                           4
    sql = "SELECT " + selectSame + ", spo2_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM lhr_spo2 WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7; ";
    ArrayList<ArrayList<String>> dataSPO = con.getData(sql);
    ArrayList<ArrayList<String>> dataSPOGraph = con.getData(sqlGraph);

    //                  0 1 2                   3                           4
    sqlGraph = "select " + selectSame + ", temperature_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM (SELECT * FROM lhr_temperature where pmi_no = '" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7) "
            + " SUB ORDER BY episode_date ASC; ";
    //                  0 1 2                   3                           4
    sql = "select " + selectSame + ", temperature_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM lhr_temperature where pmi_no = '" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7; ";
    ArrayList<ArrayList<String>> dataTemper = con.getData(sql);
    ArrayList<ArrayList<String>> dataTemperGraph = con.getData(sqlGraph);

    //                  0 1 2               3                               4
    sqlGraph = "SELECT " + selectSame + ", blood_glucose_level, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM (SELECT * FROM lhr_blood_glucose WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7) "
            + " SUB ORDER BY episode_date ASC; ";
    //                  0 1 2               3                               4
    sql = "SELECT " + selectSame + ", blood_glucose_level, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM lhr_blood_glucose WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7; ";
    ArrayList<ArrayList<String>> dataGlucose = con.getData(sql);
    ArrayList<ArrayList<String>> dataGlucoseGraph = con.getData(sqlGraph);

    //                  0 1 2               3               4                                 5
    sqlGraph = "SELECT " + selectSame + ", weight_reading, height_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM (SELECT * FROM lhr_weight_height WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7) "
            + " SUB ORDER BY episode_date ASC; ";
    //                  0 1 2               3               4                                 5
    sql = "SELECT " + selectSame + ", weight_reading, height_reading, date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM lhr_weight_height WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7; ";
    ArrayList<ArrayList<String>> dataHtWt = con.getData(sql);
    ArrayList<ArrayList<String>> dataHtWtGraph = con.getData(sqlGraph);

    sqlGraph = "SELECT " + selectSame + ", total_cholesterol,total_unit,"
            + "ldl_cholesterol,ldl_unit,"
            + "hdl_cholesterol,hdl_unit"
            + ",triglycerides,triglycerides_unit"
            + ",non_hdl_c,non_hdl_c_unit"
            + ",tg_to_hdl,tg_to_hdl_ratio_unit"
            + ", date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM (SELECT * FROM lhr_cholesterol WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7) "
            + " SUB ORDER BY episode_date ASC; ";
    sql = "SELECT " + selectSame + ", total_cholesterol,total_unit,"
            + "ldl_cholesterol,ldl_unit,"
            + "hdl_cholesterol,hdl_unit"
            + ",triglycerides,triglycerides_unit"
            + ",non_hdl_c,non_hdl_c_unit"
            + ",tg_to_hdl,tg_to_hdl_ratio_unit"
            + ", date_format(encounter_date,'%d/%m/%Y %H:%i') "
            + " FROM lhr_cholesterol WHERE pmi_no='" + pmi_no + "' ORDER BY encounter_date DESC LIMIT 7; ";
    ArrayList<ArrayList<String>> dataCholesterol = con.getData(sql);
    ArrayList<ArrayList<String>> dataCholesterolGraph = con.getData(sqlGraph);

    // ================================================================== end vital signs ================================================================== //
    boolean isVtsExist = (dataBP.size() > 0 || dataSPO.size() > 0 || dataTemper.size() > 0 || dataHtWt.size() > 0 || dataGlucose.size() > 0
            || dataRespiratory.size() > 0 || dataCholesterol.size() > 0);

    if (isVtsExist) {

%>

<div class="row table-guling" id="ANL_viewDiv" style="max-height: 500px; width: 100%; overflow-y: auto; overflow-style: panner;">

    <table class="table table-bordered">

        <tbody id="detailbyepisode">


            <%         //end vital sign
                if (dataBP.size() > 0) {

            %>
            <tr class="bg-default summary text-center">
                <td>
                    <span id="ANL_chartTitle" class="pull-left">Blood Pressure</span> &nbsp; <button class="btn btn-default btn-sm pull-right" id="ANL_btnGraphBP" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataBP.size(); i++) {

                        %>
                    <p class="hidden"><%=String.join("|", dataBPGraph.get(i))%></p>
                    <%
                        }//end for
                    %>
                </td>
            </tr>

            <tr data-status="pagado">
                <td>
                    <div style="overflow-x: auto;">
                        <table class="table table-bordered" style="width:100%; text-align: left;">
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
                                <tr style="text-align: left;">
                                    <td style="width: 7%;"><%=dataBP.get(i).get(0)%></td>
                                    <td style="width: 5%;"><%=dataBP.get(i).get(1)%></td>
                                    <td style="width: 10%;"><%=lookH.getHFCName(dataBP.get(i).get(2))%></td>
                                    <td>
                                        <div class="table-guling">
                                            <table class="table table-bordered" style="width: 50%; max-width: 400px;">
                                                <tr style="text-align: left;">
                                                    <td></td>
                                                    <td>Systolic(mmHg)</td>
                                                    <td>Diastolic(mmHg)</td>
                                                    <td>Pulse(bpm)</td>
                                                </tr>
                                                <tr style="text-align: left;">
                                                    <td>Sitting</td>
                                                    <td><%=dataBP.get(i).get(3)%></td>
                                                    <td><%=dataBP.get(i).get(4)%></td>
                                                    <td><%=dataBP.get(i).get(5)%></td>
                                                </tr>
                                                <tr style="text-align: left;">
                                                    <td>Standing</td>
                                                    <td><%=dataBP.get(i).get(6)%></td>
                                                    <td><%=dataBP.get(i).get(7)%></td>
                                                    <td><%=dataBP.get(i).get(8)%></td>
                                                </tr>
                                                <tr style="text-align: left;">
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
            <tr class="bg-default summary text-center">
                <td>
                    <span id="ANL_chartTitle" class="pull-left">Temperature (&#8451;)</span> &nbsp; <button class="btn btn-default btn-sm  pull-right" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataTemper.size(); i++) {

                        %>
                    <p class="hidden"><%=String.join("|", dataTemperGraph.get(i))%></p>
                    <%
                        }//end for
                    %>
                </td>
            </tr>

            <tr data-status="pagado">
                <td>
                    <div style="overflow-x: auto;">
                        <table class="table table-bordered" style="width:100%; text-align: left;">
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
                                <tr style="text-align: left;">
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
            <tr class="bg-default summary text-center">
                <td>
                    <span id="ANL_chartTitle" class="pull-left">Oxygen Saturation (%)</span> &nbsp; <button class="btn btn-default btn-sm  pull-right" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataSPO.size(); i++) {

                        %>
                    <p class="hidden"><%=String.join("|", dataSPOGraph.get(i))%></p>
                    <%
                        }//end for
                    %>
                </td>
            </tr>

            <tr data-status="pagado">
                <td>
                    <div style="overflow-x: auto;">
                        <table class="table table-bordered" style="width:100%; text-align: left;">
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
                                <tr style="text-align: left;">
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
            <tr class="bg-default summary text-center">
                <td>
                    <span id="ANL_chartTitle" class="pull-left">Blood Glucose Level(mmol/L)</span> &nbsp; <button class="btn btn-default btn-sm  pull-right" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataGlucose.size(); i++) {

                        %>
                    <p class="hidden"><%=String.join("|", dataGlucoseGraph.get(i))%></p>
                    <%
                        }//end for
                    %>
                </td>
            </tr>

            <tr data-status="pagado">
                <td>
                    <div style="overflow-x: auto;">
                        <table class="table table-bordered" style="width:100%; text-align: left;">
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
                                <tr style="text-align: left;">
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
            <tr class="bg-default summary text-center">
                <td>
                    <span id="ANL_chartTitle" class="pull-left">Weight</span> &nbsp; <button class="btn btn-default btn-sm  pull-right" id="ANL_btnGraphHtWt" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataHtWt.size(); i++) {

                        %>
                    <p class="hidden"><%=String.join("|", dataHtWtGraph.get(i))%></p>
                    <%
                        }//end for
                    %>
                </td>
            </tr>

            <tr data-status="pagado">
                <td>
                    <div style="overflow-x: auto;">
                        <table class="table table-bordered" style="width:100%; text-align: left;">
                            <thead>
                                <tr>
                                    <td width="15%">Date</td>
                                    <td width="15%">Time</td>
                                    <td width="20%">Venue</td>
                                    <td width="25%">Weight(kg)</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int i = 0; i < dataHtWt.size(); i++) {

                                %>
                                <tr style="text-align: left;">
                                    <td style="width: 7%;"><%=dataHtWt.get(i).get(0)%></td>
                                    <td style="width: 5%;"><%=dataHtWt.get(i).get(1)%></td>
                                    <td style="width: 10%;"><%=lookH.getHFCName(dataHtWt.get(i).get(2))%></td>
                                    <td><strong><%=dataHtWt.get(i).get(3)%></strong></td>
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

                if (dataRespiratory.size() > 0) {

            %>
            <tr class="bg-default summary text-center">
                <td>
                    <span id="ANL_chartTitle" class="pull-left">Respiratory Rate(bpm)</span> &nbsp; <button class="btn btn-default btn-sm  pull-right" id="ANL_btnGraphLine" title="Show Graph"><i class="fa fa-line-chart fa-lg" aria-hidden="true"></i></button>
                        <%                    for (int i = 0; i < dataRespiratory.size(); i++) {

                        %>
                    <p class="hidden"><%=String.join("|", dataRespiratoryGraph.get(i))%></p>
                    <%
                        }//end for
                    %>
                </td>
            </tr>

            <tr data-status="pagado">
                <td>
                    <div style="overflow-x: auto;">
                        <table class="table table-bordered" style="width:100%; text-align: left;">
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
                                <tr style="text-align: left;">
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

                if (dataCholesterol.size() > 0) {

            %>
            <tr class="bg-default summary text-center">
                <td>
                    <span id="ANL_chartTitle" class="pull-left">Cholesterol History</span>

                </td>
            </tr>

            <tr data-status="pagado">
                <td>
                    <div style="overflow-x: auto;">
                        <table class="table table-bordered" style="width:100%; text-align: left;">
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
                                <tr style="text-align: left;">
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
        out.print("There is no record of vital sign");
    }%>

