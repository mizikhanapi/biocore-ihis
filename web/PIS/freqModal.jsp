<%-- 
    Document   : freqModal
    Created on : Sep 6, 2017, 6:37:57 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String hfcNameSupplier = session.getAttribute("HFC_NAME").toString();
%>


<!-- Add Button End -->
<div class="modal fade" id="freqModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="freqModalTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="freqForm">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Drug Frequency Code *</label>
                        <div class="col-md-8">
                            <input id="freqCode" name="freqCode" type="text" placeholder="Insert Frequency Code" class="form-control input-md" maxlength="30" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Drug Frequency Description *</label>
                        <div class="col-md-8">
                            <textarea id="freqDesc" name="freqDesc" class="form-control" rows="4" placeholder="Insert Frequency Description" maxlength="100" required></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Drug Frequency Value *</label>
                        <div class="col-md-8">
                            <input id="freqValue" name="freqValue" type="text" placeholder="Insert Frequency Value" class="form-control input-md decimalNumbersOnly" maxlength="6" required>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Select Status *</label>
                        <div class="col-md-8">
                            <select id="freqStatus" name="freqStatus" class="form-control">
                                <option value="-" disabled>No Status</option>
                                <option value="1" selected>Active</option>
                                <option value="0">Inactive</option>     
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="freq_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="freqReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Supplier End -->
<!-- Add Part End -->