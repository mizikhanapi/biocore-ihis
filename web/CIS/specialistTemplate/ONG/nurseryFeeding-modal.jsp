<%-- 
    Document   : anteNatal-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    Conn cccconn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String datee52 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0123' AND hfc_cd = '" + hfc + "' and status ='0'";

    String methodfedd5 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0124' AND hfc_cd = '" + hfc + "' and status ='0'";
    String aspi5 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0125' AND hfc_cd = '" + hfc + "' and status ='0'";
    ArrayList<ArrayList<String>> datamethodfedd5, dataaspi5, datadate52;
    datamethodfedd5 = cccconn.getData(methodfedd5);
    dataaspi5 = cccconn.getData(aspi5);
    datadate52 = cccconn.getData(datee52);

%>
<!-- Start Modal -->
<div class="modal fade" id="ong-nurseryFeedingChart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h2 class="modal-title" id="nurseryFeedingChartModalTitle"></h2>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <input type="hidden" id="ONGNurseryFeedingChartPmi" >
                        <input type="hidden" id="ONGNurseryFeedingChartHfc" >
                        <input type="hidden" id="ONGNurseryFeedingChartEpisodeDate" >
                        <input type="hidden" id="ONGNurseryFeedingChartEncounterDate">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-12 control-label" for="textinput">Date</label>
                            <div class="col-md-12">
                                <input type="text" class="form-control input-md" id="nurseryFeedingChartModalDate" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <form autocomplete="off" id="nurseryFeedingChartModalForm">

                    <div class="row">
                        <!--                        <div class="col-md-6">
                                                    <input type="hidden" id="ONGNurseryFeedingChartPmi" >
                                                    <input type="hidden" id="ONGNurseryFeedingChartHfc" >
                                                    <input type="hidden" id="ONGNurseryFeedingChartEpisodeDate" >
                                                    <input type="hidden" id="ONGNurseryFeedingChartEncounterDate">
                                                     Text input
                                                    <div class="form-group">
                                                        <label class="col-md-12 control-label" for="textinput">Date</label>
                                                        <div class="col-md-12">
                                                            <input type="text" class="form-control input-md" id="nurseryFeedingChartModalDate" readonly>
                                                        </div>
                                                    </div>
                                                </div>-->
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <!--                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalTime" readonly>-->
                                    <select id="nurseryFeedingChartModalTime" class="form-control">
                                        <option value="null" selected="" disabled="">Select Time</option>
                                        <% for (int i = 0; i < datadate52.size(); i++) {%>
                                        <option value="<%=datadate52.get(i).get(1)%>"><%=datadate52.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Method Of Feeding</label>
                                <div class="col-md-12">
                                    <!--                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalFeedingMethod" maxlength="50">-->
                                    <select id="nurseryFeedingChartModalFeedingMethod" class="form-control">
                                        <option value="null" selected="" disabled="">Select Method Of Feeding</option>
                                        <% for (int i = 0; i < datamethodfedd5.size(); i++) {%>
                                        <option value="<%=datamethodfedd5.get(i).get(2)%>"><%=datamethodfedd5.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group" id="susupower">
                                <label class="col-md-12 control-label" for="textinput">Strength Of Milk (ml)</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" placeholder="1 to 999" id="nurseryFeedingChartModalMilkStrength" maxlength="3">
                                </div>
                            </div>
                        </div>

                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Aspirate Vomit</label>
                                <div class="col-md-12">
                                    <!--                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalAspirateVomit" maxlength="50">-->
                                    <select id="nurseryFeedingChartModalAspirateVomit" class="form-control">
                                        <option value="null" selected="" disabled="">Select Aspirate Vomit</option>
                                        <% for (int i = 0; i < dataaspi5.size(); i++) {%>
                                        <option value="<%=dataaspi5.get(i).get(2)%>"><%=dataaspi5.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Temperature</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md decimalNumbersOnly" id="nurseryFeedingChartModalTemperature" maxlength="4">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Respiration</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="nurseryFeedingChartModalRespiration" maxlength="3">
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Parsing Urine (PU)</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalPU" maxlength="10">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Bowel Open (BO)</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalBO" maxlength="10">
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
                                    <textarea type="text" name="display_name" id="nurseryFeedingChartModalRemark" class="form-control input-md" placeholder="Add conscious state & remarks.." maxlength="100"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="nurseryFeedingChartModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="nurseryFeedingChartModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->
