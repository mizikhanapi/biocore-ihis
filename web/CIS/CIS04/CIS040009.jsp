<%-- 
    Document   : CIS040009
    Created on : 03-Apr-2017, 14:03:49
    Author     : shay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String referralPriority = "select Detail_Reference_code,Description from adm_lookup_detail where Master_Reference_code = '0101' AND hfc_cd = '" + hfc_cd + "' order by priority_indicator ASC";
    ArrayList<ArrayList<String>> dataRPriority = Conn.getData(referralPriority);

    String referralType = "select Detail_Reference_code,Description from adm_lookup_detail where Master_Reference_code = '0102' AND hfc_cd = '" + hfc_cd + "' order by priority_indicator ASC";
    ArrayList<ArrayList<String>> dataRType = Conn.getData(referralType);

    String referralDisposition = "select Detail_Reference_code,Description from adm_lookup_detail where Master_Reference_code = '0103' AND hfc_cd = '" + hfc_cd + "' order by priority_indicator ASC";
    ArrayList<ArrayList<String>> dataRDisposition = Conn.getData(referralDisposition);

    String referralCategory = "select Detail_Reference_code,Description from adm_lookup_detail where Master_Reference_code = '0104' AND hfc_cd = '" + hfc_cd + "' order by priority_indicator ASC";
    ArrayList<ArrayList<String>> dataRCategory = Conn.getData(referralCategory);

    String referralReason = "select Detail_Reference_code,Description from adm_lookup_detail where Master_Reference_code = '0105' AND hfc_cd = '" + hfc_cd + "' order by priority_indicator ASC";
    ArrayList<ArrayList<String>> dataRReason = Conn.getData(referralReason);

%>
<!--Modal ADD Referral-->
<div class="modal fade" id="CIS040009" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Referral</h3>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" name="POS" id="codeREF" class="form-control input-lg"  tabindex="4">
                </div>
                <div class="form-group">
                    <label class="col-md-6 control-label" for="textinput">Refer to Health Facility :</label>
                    <div class="col-md-12">
                        <input class="form-control input-lg" type="text" name="problem"  id="tCIS_PRIHFCreferFrom" tabindex="4" placeholder="Start typing to search...">
                        <input type="hidden" id="hfcREFcode"></input>
                        <input type="hidden" id="hfcOrderDetailPRI"></input>
                        <input type="hidden" id="hfcProviderDetailPRI"></input>
                        <div id="tCIS_PRIHFCreferFromLoading"></div> 
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-6 control-label" for="textinput">Refer to Discipline :</label>
                    <div class="col-md-12">
                        <input class="form-control input-lg" type="text" name="pro" id="disREF" placeholder="Start typing to search...">
                        <input type="hidden" id="disREFcode"></input>
                        <div id="disREFcodeLoading" class="search-drop"></div>
                    </div>
                </div>
                               
                <div class="form-group">
                    <label class="col-md-6 control-label" for="textinput">Doctor to be referred :</label>
                    <div class="col-md-12">
                        <input class="form-control input-lg" type="text" name="pro" id="docREF" placeholder="Start typing to search...">
                        <input type="hidden" id="docREFcode"></input>
                        <div id="docREFLoading" class="search-drop" hidden></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="col-md-6 control-label" for="textinput">Priority :</label>
                        <div class="col-md-12">

                            <select id="tCIS_PRIPriority" class="form-control input-lg">
                                <option disabled="" >Please select Priority...</option>
                                <%   if (dataRPriority.size() > 0) {
                                        for (int i = 0; i < dataRPriority.size(); i++) {
                                %>
                                <option value="<%out.print(dataRPriority.get(i).get(0));%>"><%out.print(dataRPriority.get(i).get(1));%></option>
                                <%
                                        }
                                    }%>

                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="col-md-6 control-label" for="textinput">Type :</label>
                        <div class="col-md-12">
                            <select id="tCIS_PRIType" class="form-control input-lg">
                                <option disabled="" >Please select Type...</option>
                                <%   if (dataRType.size() > 0) {
                                        for (int i = 0; i < dataRType.size(); i++) {
                                %>
                                <option value="<%out.print(dataRType.get(i).get(0));%>"><%out.print(dataRType.get(i).get(1));%></option>
                                <%
                                        }
                                    }%>

                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="col-md-6 control-label" for="textinput">Disposition :</label>
                        <div class="col-md-12">
                            <select id="tCIS_PRIDisposition" class="form-control input-lg">
                                <option disabled="" >Please select Disposition...</option>
                                <%   if (dataRDisposition.size() > 0) {
                                        for (int i = 0; i < dataRDisposition.size(); i++) {
                                %>
                                <option value="<%out.print(dataRDisposition.get(i).get(0));%>"><%out.print(dataRDisposition.get(i).get(1));%></option>
                                <%
                                        }
                                    }%>

                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="col-md-6 control-label" for="textinput">Category :</label>
                        <div class="col-md-12">
                            <select id="tCIS_PRICategory" class="form-control input-lg">
                                <option disabled="" >Please select Category...</option>
                                <%   if (dataRCategory.size() > 0) {
                                        for (int i = 0; i < dataRCategory.size(); i++) {
                                %>
                                <option value="<%out.print(dataRCategory.get(i).get(0));%>"><%out.print(dataRCategory.get(i).get(1));%></option>
                                <%
                                        }
                                    }%>

                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-6">
                        <label class="col-md-6 control-label" for="textinput">Reason :</label>
                        <div class="col-md-12">
                            <select id="tCIS_PRIReason" class="form-control input-lg">
                                <option disabled="" >Please select Reason...</option>
                                <%   if (dataRReason.size() > 0) {
                                        for (int i = 0; i < dataRReason.size(); i++) {
                                %>
                                <option value="<%out.print(dataRReason.get(i).get(0));%>"><%out.print(dataRReason.get(i).get(1));%></option>
                                <%
                                        }
                                    }%>

                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Appointment :</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="pro" id="appREF" >
                            </div>
                        </div>

                    </div>
                </div>



                <div class="form-group">
                    <label class="col-md-6 control-label" for="textinput">Medical History Notes :</label>
                    <div class="col-md-12">
                        <textarea id="medicalHisREF" class="form-control input-lg"></textarea>
                    </div>
                </div>


            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnCIS_OE_PRI_SUBMIT" role="button">Submit</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Referral-->


<div class="modal fade" id="update_CIS040009" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Referral</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="POS" id="codeREF" class="form-control input-lg"  tabindex="4">
                    <input type="hidden" name="POS" id="jsonId" class="form-control input-lg"  tabindex="4">

                </div>
                <div class="form-group">
                    <h4 class="modal-title modalTextLabel">Health Facility Name :</h4>
                    <input class="form-control input-lg" type="text" name="problem"  id="UREF" tabindex="4" placeholder="if other,please specify">
                    <input type="hidden" name="POS" id="UhfcREFcode" class="form-control input-lg"  tabindex="4">

                    <div id="UmatchREF"></div>
                </div>


                <div class="form-group">
                    <h4 class="modal-title">Discipline :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="UdisREF" placeholder="if other,please specify">
                    <input type="hidden" name="POS" id="UdisREFcode" class="form-control input-lg"  tabindex="4">

                    <div id="UmatchREFD"></div>
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Doctor referred to :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="UdocREF" placeholder="if other,please specify">
                    <div id="UmatchREFDOC"></div>
                    <input type="hidden" id="UdocREFcode"></input>
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Appointment :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="UappREF" >
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Medical History Notes :</h4>
                    <textarea id="UmedicalHisREF" class="form-control input-lg"></textarea>
                </div>

            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateREF" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="jsFunction/CIS040009.js" type="text/javascript"></script>