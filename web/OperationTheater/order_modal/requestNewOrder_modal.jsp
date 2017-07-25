<%-- 
    Document   : requestNewOrder_modal
    Created on : May 10, 2017, 11:24:05 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>

<!-- Modal Detail -->
<!-- Add Modal Start -->
<div class="modal fade" id="modal_requestNewOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="RNO_modalTitle"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="RNO_addForm" autocomplete="off">

                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure*</label>
                        <div class="col-md-8">
                            <div class="input-group">
                                <input type="text" placeholder="Search procedure " class="form-control" maxlength="330" id="RNO_proName">
                                <div class="input-group-btn" id="RNO_div_redo">
                                    <button class="btn btn-default btn-sm" title="Redo" id="RNO_btnRedo"><i class="fa fa-times"></i></button>
                                </div>
                            </div>
                            
                            <div id="RNO_pro_match" class="search-drop">
                                <!--search result-->
                            </div>
                        </div>
                    </div>
                   
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Instruction</label>
                       <div class="col-md-8">
                           <textarea id="RNO_instruction" placeholder="Write your instruction here (Optional)" class="form-control input-md" maxlength="500" rows="4"></textarea>
                        </div>
                    </div>

                   
                </form>
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
