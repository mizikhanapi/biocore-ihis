<%-- 
    Document   : CIS030001
    Created on : Feb 18, 2017, 3:09:35 PM
    Author     : -D-
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>


<div class="modal fade" id="CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width:70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Diagnosis Form</h3>
            </div>
            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Search From : </label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType" value="P" >Favourite Term</label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType" value="CT" checked="">All Term</label>
                                            <input class="form-control input-lg" type="hidden" name="tCISSUBDGSCodeType"  id="tCISSUBDGSCodeType"  value="DGS" tabindex="4" readonly="">

                                        </div>
                                    </div>

                                    <hr>

                                    <div class="row">
                                        <div class="col-md-8">
                                            <label>Search Diagnosis</label>
                                            <div class="form-group">
                                                <input type='text' id="tCISSubDGSSearch" placeholder='Type more than 3 character to search diagnosis...' class='form-control input-lg flexdatalist' data-min-length='1' name='country_name_suggestion' data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <input class="form-control input-lg" type="text"  id="tCISSubDGSSearchPersonalised" placeholder="Type to search favourite diagnosis..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <div id="tCISSubDGSSearchLoading"></div>
                                                <input type="hidden" name="DGS" id="dgsCode" class="form-control input-lg"  tabindex="4">
                                                <input type="hidden" name="DGS" id="codeDGS" class="form-control input-lg" value="DGS" tabindex="4">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Diagnosis Date</label>
                                            <div class="form-group">
                                                <input class="form-control input-lg" type="text" name="date4" id="dateDGS" placeholder="DD/MM/YYYY" autocomplete="off"  placeholder="Diagnosis Date" readonly>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Type</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="TypeDGS" name="TypeDGS" value="Final">Final</label>
                                                <label class="radio-inline"><input type="radio" id="TypeDGS" name="TypeDGS" value="Provision">Provision</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Severity</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="SeverityDGS" name="SeverityDGS" value="Mild">Mild</label>
                                                <label class="radio-inline"><input type="radio" id="SeverityDGS" name="SeverityDGS" value="Normal">Normal</label>
                                                <label class="radio-inline"><input type="radio" id="SeverityDGS" name="SeverityDGS" value="Acute">Acute</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Site</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="SiteDGS" name="SiteDGS" value="Right">Right</label>
                                                <label class="radio-inline"><input type="radio" id="SiteDGS" name="SiteDGS" value="Left">Left</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Laterality</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="LateralityDGS" name="LateralityDGS" value="Right">Right</label>
                                                <label class="radio-inline"><input type="radio" id="LateralityDGS" name="LateralityDGS" value="Left">Left</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <textarea type="text" name="display_name" id="commentDGS" class="form-control input-lg" placeholder="Notes.." tabindex="3" autocomplete="off"></textarea> 
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="text-right">
                                    <button class="btn btn-primary" id="btnCISSubDGSAddPersonalised" style="padding-left: 10px;"><i class="fa fa-star" aria-hidden="true"></i>&nbsp; Add to personalized</button>
                                    &nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-success" id="acceptBtnDGS" role="button" autocomplete="off">Add Diagnosis</button>
                                </div>
                                <br>

                                <div class="row">
                                    <div class="col-md-12" id="SOAPDiagnosisTableDIV" >
                                        <table class="table table-striped table-bordered" id="SOAPDiagnosisTable">
                                            <thead>
                                                <tr>
                                                    <th style="display: none;">JSON</th>
                                                    <th style="display: none;">Code</th>
                                                    <th>Diagnosis</th>
                                                    <th>Type</th>
                                                    <th>Date</th>
                                                    <th>Severity</th>
                                                    <th>Site</th>
                                                    <th>Laterality</th>
                                                    <th>Notes</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id="SOAPDiagnosisTableIniialRecord">
                                                    <td colspan="8" align="center">Please Insert New Diagnosis</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
            </div>  
            <div class="modal-footer" id="SOAPChiefComplaintAcceptDiagnosis">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-block btn-lg" id="SOAPChiefComplaintAcceptDiagnosisBtn" >Accept Diagnosis</a>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Diagnosis-->

<div class="modal fade" id="update_CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width:70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Diagnosis Form Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                                                <form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Search From : </label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType_update" value="P" >Favourite Term</label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType_update" value="CT" checked="">All Term</label>
                                            <input class="form-control input-lg" type="hidden" name="tCISSUBDGSCodeType_update"  id="tCISSUBDGSCodeType"  value="DGS" tabindex="4" readonly="">

                                        </div>
                                    </div>

                                    <hr>

                                    <div class="row">
                                        <div class="col-md-8">
                                            <label>Search Diagnosis</label>
                                            <div class="form-group">
                                                <input type='text' id="tCISSubDGSSearch_update" placeholder='Type more than 3 character to search diagnosis...' class='form-control input-lg flexdatalist' data-min-length='1' name='country_name_suggestion' data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <input class="form-control input-lg" type="text"  id="tCISSubDGSSearchPersonalised_update" placeholder="Type to search favourite diagnosis..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <div id="tCISSubDGSSearchLoading_update"></div>
                                                <input type="hidden" name="DGS" id="update_dgsCode" class="form-control input-lg"  tabindex="4">
                                                <input type="hidden" name="DGS" id="jsonIdDGS" class="form-control input-lg" value="DGS" tabindex="4">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Diagnosis Date</label>
                                            <div class="form-group">
                                                <input class="form-control input-lg" type="text" name="date4" id="update_dateDGS" placeholder="DD/MM/YYYY" autocomplete="off"  placeholder="Diagnosis Date" readonly>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Type</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="update_TypeDGS" name="update_TypeDGS" value="Final">Final</label>
                                                <label class="radio-inline"><input type="radio" id="update_TypeDGS" name="update_TypeDGS" value="Provision">Provision</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Severity</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="update_SeverityDGS" name="update_SeverityDGS" value="Mild">Mild</label>
                                                <label class="radio-inline"><input type="radio" id="update_SeverityDGS" name="update_SeverityDGS" value="Normal">Normal</label>
                                                <label class="radio-inline"><input type="radio" id="update_SeverityDGS" name="update_SeverityDGS" value="Acute">Acute</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Site</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="update_SiteDGS" name="update_SiteDGS" value="Right">Right</label>
                                                <label class="radio-inline"><input type="radio" id="update_SiteDGS" name="update_SiteDGS" value="Left">Left</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Laterality</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="update_LateralityDGS" name="update_LateralityDGS" value="Right">Right</label>
                                                <label class="radio-inline"><input type="radio" id="update_LateralityDGS" name="update_LateralityDGS" value="Left">Left</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <textarea type="text" name="display_name" id="update_commentDGS" class="form-control input-lg" placeholder="Notes.." tabindex="3" autocomplete="off"></textarea> 
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="text-right">
                                    <button type="button" class="btn btn-success" id="updateBtnDGS" role="button" autocomplete="off">Update Diagnosis</button>
                                </div>
                                <br>

            </div>     
        </div>
    </div>
</div>
<!--End ADD Diagnosis-->
<!--End Update Diagnosis-->

<script type="text/javascript" src="jsFunction/CIS030001.js"></script>
