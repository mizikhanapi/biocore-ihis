<%-- 
    Document   : CIS030001
    Created on : Feb 18, 2017, 3:09:35 PM
    Author     : -D-
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>


<div class="modal fade" id="CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Diagnosis Form</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->

                <!--                        <div class="form-group">
                                            <div class="form-group">
                                                <input class="form-control input-lg" type="text" name="problem"  id="searchDiag" placeholder="Search..." tabindex="4">
                                                <div id="matchDiag"></div>
                                            </div>   
                                        </div>-->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBDGSCodeType"  id="tCISSUBDGSCodeType"  value="DGS" tabindex="4" readonly="">

                    </div>
                    <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubDGSAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <input type='text' id="tCISSubDGSSearch" placeholder='Type more than 3 character to search diagnosis...' class='form-control input-lg flexdatalist' data-min-length='1' name='country_name_suggestion' data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <input class="form-control input-lg" type="text"  id="tCISSubDGSSearchPersonalised" placeholder="Type to Search Diagnosis Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <div id="tCISSubDGSSearchLoading"></div>
                    </div>   
                </div>

                <div class="form-group">
                    <div class="form-group">


                    </div>   


                </div>
                <div id="divDiag">

                </div>
                <div class="form-group">
                    <input type="hidden" name="DGS" id="dgsCode" class="form-control input-lg"  tabindex="4">
                    <input type="hidden" name="DGS" id="codeDGS" class="form-control input-lg" value="DGS" tabindex="4">
                </div>
                <div class="form-group">
                    <select name="mild" id="TypeDGS" class="form-control input-lg">
                        <option value="1" selected="" disabled="">Type</option>
                        <option value="Final">Final</option>
                        <option value="Provision">Provision</option>
                    </select>
                </div>

                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="date4" id="dateDGS" placeholder="Diagnosis Date">
                </div>



                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <select name="mild" id="SeverityDGS" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Severity [Select]</option>
                                <option value="Mild">Mild</option>
                                <option value="Normal">Normal</option>
                                <option value="Acute">Acute</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <select name="site" id="SiteDGS" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Site [Select]</option>
                                <option value="Right">Right</option>
                                <option value="Left">Left</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <select name="site" id="LateralityDGS" class="form-control input-lg">
                        <option value="1" selected="" disabled="">Laterality [Select]</option>
                        <option value="Right">Right</option>
                        <option value="Left">Left</option>
                    </select>
                </div>

                <div class="form-group">
                    <textarea type="text" name="display_name" id="commentDGS" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnDGS" role="button">Accept</button>
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
<!--End ADD Diagnosis-->

<div class="modal fade" id="update_CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Diagnosis Form</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType_update" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType_update" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBDGSCodeType_update"  id="tCISSUBDGSCodeType_update"  value="DGS" tabindex="4" readonly="">

                    </div>
<!--                    <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubDGSAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>-->
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <input type='text' id="tCISSubDGSSearch_update" placeholder='Type to Search Diagnosis...' class='form-control input-lg' data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <input class="form-control input-lg" type="text"  id="tCISSubDGSSearchPersonalised_update" placeholder="Type to Search Diagnosis Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <div id="tCISSubDGSSearchLoading_update"></div>
                        <!--                                <input class="form-control input-lg" type="text" name="problem"  id="update_searchDiag" placeholder="Search..." tabindex="4">
                                                        <div id="update_matchDiag"></div>-->
                    </div>   
                </div>
                <div class="form-group">
                    <input type="hidden" name="DGS" id="update_dgsCode" class="form-control input-lg"  tabindex="4">
                    <input type="hidden" name="DGS" id="jsonIdDGS" class="form-control input-lg" tabindex="4">
                </div>
                <div class="form-group">
                    <select name="mild" id="update_TypeDGS" class="form-control input-lg">
                        <option value="1" selected="" disabled="">Type</option>
                        <option value="Final">Final</option>
                        <option value="Provision">Provision</option>
                    </select>
                </div>

                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="date4" id="update_dateDGS" placeholder="Diagnosis Date">
                </div>



                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <select name="mild" id="update_SeverityDGS" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Severity [Select]</option>
                                <option value="Mild">Mild</option>
                                <option value="Normal">Normal</option>
                                <option value="Acute">Acute</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <select name="site" id="update_SiteDGS" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Site [Select]</option>
                                <option value="Right">Right</option>
                                <option value="Left">Left</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <select name="site" id="update_LateralityDGS" class="form-control input-lg">
                        <option value="1" selected="" disabled="">Laterality [Select]</option>
                        <option value="Right">Right</option>
                        <option value="Left">Left</option>
                    </select>
                </div>

                <div class="form-group">
                    <textarea type="text" name="display_name" id="update_commentDGS" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnDGS" role="button">Update</button>
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
<!--End ADD Diagnosis-->
<!--End Update Diagnosis-->

<script type="text/javascript" src="jsFunction/CIS030001.js"></script>
