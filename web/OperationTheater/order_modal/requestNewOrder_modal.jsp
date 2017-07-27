<%-- 
    Document   : requestNewOrder_modal
    Created on : May 10, 2017, 11:24:05 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>

<!-- Modal Detail -->
<!-- Add Modal Start -->
<div class="modal fade" id="modal_requestNewOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="RNO_modalTitle"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form id="RNO_addForm" autocomplete="off">
                    <!--text inpput-->
                    <div class="row">                 
                        <div class="col-md-12">
                            <div class="form-group form-horizontal">
                                <label class="col-md-2 control-label" for="textinput">Category</label>
                                <div class="col-md-10">
                                    <input id="RNO_categoryName" class="form-control flexdatalist" type="text" placeholder="Search Surgical Category... You can skip this but it may take longer time to search for the procedure." 
                                           data-search-by-word="true"
                                           data-selection-required="true">

                                    <div id="RNO_cat_match" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group form-horizontal">
                                <label class="col-md-2 control-label" for="textinput">Procedure*</label>
                                <div class="col-md-10">
                                    <input type="text" placeholder="Search procedure... For faster result, please search the category first." class="form-control flexdatalist" maxlength="330" id="RNO_proName"
                                           data-search-by-word="true"
                                           data-selection-required="true">
                                  <div id="RNO_pro_match" class="search-drop">
                                        <!--search result-->
                                    </div>
                                </div>
                            </div>
                        </div>    
                    </div>
                    
                      <!-- Text input-->
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group form-horizontal col-md-6">
                                <label class="col-md-2 control-label" for="textinput">Start*</label>
                                <div class="col-md-10">
                                    <input type="text" placeholder="Expected start dd/mm/yyyy hh:mm " class="form-control" maxlength="330" id="RNO_start">
                                </div>
                            </div>
                            <div class="form-group form-horizontal col-md-6">
                                <label class="col-md-2 control-label" for="textinput">End*</label>
                                <div class="col-md-10">
                                    <input type="text" placeholder="Expected end dd/mm/yyyy hh:mm " class="form-control" maxlength="330" id="RNO_end">
                                </div>
                            </div>
                        </div>    
                    </div>
                    
                    <!--text inpput-->
                    <br>
                    <div class="row">                 
                        <div class="col-md-12">
                            <div class="form-group form-horizontal">
                                <label class="col-md-2 control-label" for="textinput">Consultant*</label>
                                <div class="col-md-10">
                                    <input id="RNO_consultant" class="form-control flexdatalist" type="text" placeholder="Search consultant..." 
                                           data-search-by-word="true"
                                           data-selection-required="true">

                                    <div id="RNO_consul_match" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!--text inpput-->
                    <br>
                    <div class="row">                 
                        <div class="col-md-12">
                            <div class="form-group form-horizontal">
                                <label class="col-md-2 control-label" for="textinput">Operation Theater*</label>
                                <div class="col-md-10">
                                    <input id="RNO_room" class="form-control flexdatalist" type="text" placeholder="Search operation room..." 
                                           data-search-by-word="true"
                                           data-selection-required="true">

                                    <div id="RNO_room_match" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <!-- Text input-->
                    <br>
                    <div class="row">
                        <div class="form-group form-horizontal">
                            <label class="col-md-2 control-label" for="textinput">Comment*</label>
                           <div class="col-md-10">
                               <textarea id="RNO_comment" placeholder="Write your comments here (Optional)" class="form-control input-md" maxlength="480" rows="4"></textarea>
                            </div>
                        </div>
                    </div>

                   
                </form>
                
                <div class="col-md-12">
                    <br>
                    <div class="text-center">
                        <button id="RNO_btnConsul" class="btn btn-default" title="View doctor's schedule"><i class="fa fa-user-md fa-lg" style="color: #2B82C9"></i>&nbsp;</button>
                        <button id="RNO_btnRoom" class="btn btn-default" title="View room's schedule"><i class="fa fa-bed fa-lg" style="color: #F26797"></i>&nbsp;</button>
                        <button id="RNO_btnPatient" class="btn btn-default" title="View patient's schedule"><i class="fa fa-user fa-lg" style="color: #00dd1c"></i>&nbsp;</button>
                        <p id="RNO_err" style="color: red"></p>
                    </div>
                </div>
                
                <!--table for consultant schedule-->
                <div id="RNO_div_schedule" class="col-md-12 table-guling" style="height: 100%; max-height: 300px; overflow: auto;padding: 10px;"></div>
                <!--table for consultant schedule-->
               
                
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="RNO_div_btnAdd_or_update">
                        <!--<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="RNO_btnAdd">Add</button>-->
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="RNO_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<!-- Modal -->
