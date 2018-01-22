<%-- 
    Document   : anteNatal-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%
    //   Config.getFile_url(session);
//    Config.getBase_url(request);
    Conn ccconn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
//    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String datee5 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0123' AND hfc_cd = '" + hfc + "' and status ='0'";

    ArrayList<ArrayList<String>> datadatee5;
    datadatee5 = ccconn.getData(datee5);

%>

<!-- Start Modal -->
<div class="modal fade" id="ong-freqObservationChart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h2 class="modal-title" id="freqObservationChartModalTitle"></h2>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <input type="hidden" id="ONGFreqObservationChartPmi" >
                        <input type="hidden" id="ONGFreqObservationChartHfc" >
                        <input type="hidden" id="ONGFreqObservationChartEpisodeDate" >
                        <input type="hidden" id="ONGFreqObservationChartEncounterDate">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Date *</label>
                            <div class="col-md-12">
                                <input type="text" class="form-control input-md" id="freqObservationChartModalDate" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <form autocomplete="off" id="freqObservationChartModalForm">

                    <div class="row">
                        <!--                        <div class="col-md-6">
                                                    <input type="hidden" id="ONGFreqObservationChartPmi" >
                                                    <input type="hidden" id="ONGFreqObservationChartHfc" >
                                                    <input type="hidden" id="ONGFreqObservationChartEpisodeDate" >
                                                    <input type="hidden" id="ONGFreqObservationChartEncounterDate">
                                                     Text input
                                                    <div class="form-group">
                                                        <label class="col-md-12 control-label" for="textinput">Date</label>
                                                        <div class="col-md-12">
                                                            <input type="text" class="form-control input-md" id="freqObservationChartModalDate" readonly>
                                                        </div>
                                                    </div>
                                                </div>-->
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time *</label>
                                <div class="col-md-12">
                                    <!--                                    <input type="text" class="form-control input-md" id="freqObservationChartModalTime" readonly>-->
                                    <select id="freqObservationChartModalTime" class="form-control">
                                        <option value="-" selected="" disabled="">Select Time</option>
                                        <% for (int i = 0; i < datadatee5.size(); i++) {%>
                                        <option value="<%=datadatee5.get(i).get(1)%>"><%=datadatee5.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Temperature</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md decimalNumbersOnly" id="freqObservationChartModalTemperature" maxlength="4">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Pulse</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="freqObservationChartModalPulse" maxlength="3"> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Respiration</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="freqObservationChartModalRespiration" maxlength="3"> 
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">BP (mmHg)</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md singleNumbersOnly" placeholder="Systolic"  id="freqObservationChartModalBPSys" maxlength="3">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md singleNumbersOnly" placeholder="Diastolic" id="freqObservationChartModalBPDia" maxlength="3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Pupil Left</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md singleNumbersOnly" placeholder="React" id="freqObservationChartModalPupilLeftReact" maxlength="2">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md singleNumbersOnly" placeholder="Size" id="freqObservationChartModalPupilLeftSize" maxlength="2">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Pupil Right</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md singleNumbersOnly" placeholder="React" id="freqObservationChartModalPupilRightReact" maxlength="2">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md singleNumbersOnly" placeholder="Size" id="freqObservationChartModalPupilRightSize" maxlength="2">
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Conscious State & Remarks</label>
                                <div class="col-md-12">
                                    <textarea type="text" name="display_name" id="freqObservationChartModalConsiousState" class="form-control input-md" placeholder="Add conscious state & remarks.." maxlength="100"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Search Drug</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md flexdatalist" placeholder="Type to search..." id="freqObservationChartModalDrugGiven"
                                           data-search-by-word="true" 
                                           data-selection-required="true"
                                           > 
                                    <div id="freqObservationChartModalDrugGivenSearchResultDIV" ></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>

            </div>


            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="freqObservationChartModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="freqObservationChartModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->
