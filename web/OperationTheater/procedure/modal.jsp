<%-- 
    Document   : modal
    Created on : Jul 21, 2017, 4:16:39 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<!-- Add Modal Start -->
<div class="modal fade" id="PRO_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true" >
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="PRO_modal_title"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="PRO_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category*</label>
                        <div class="col-md-8">
                            <input id="PRO_category_name"  type="text" class="form-control input-md"  readonly>

                        </div>
                    </div>

                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Code*</label>
                        <div class="col-md-8">
                            <div class="col-md-3">
                                <input type="text" placeholder="Auto" class="form-control" readonly id="PRO_proCode1">
                            </div>
                            <label class="col-md-1 control-label" for="textinput">-</label>
                            <div class="col-md-8">
                                <input type="text" placeholder="Insert last 4 character of code" class="form-control" maxlength="27" id="PRO_proCode2">
                            </div>                           
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Name(abbreviation)*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Insert procedure name" class="form-control" maxlength="220" id="PRO_proNameShort">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Name(complete)*</label>
                        <div class="col-md-8">
                            <textarea placeholder="Insert procedure name" class="form-control" maxlength="450" id="PRO_proNameLong"></textarea>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Buying Price (RM)*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Insert procedure buying price" class="form-control" maxlength="9" id="PRO_buyPrice">
                            <p id="PRO_buyPrice_err" style="color: red"></p>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Selling Price (RM)*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Insert procedure selling price" class="form-control" maxlength="9" id="PRO_sellPrice">
                            <p id="PRO_sellPrice_err" style="color: red"></p>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Quantity*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Insert quantity of available procedure" class="form-control" maxlength="9" id="PRO_quantity">
                            <p id="PRO_quantity_err" style="color: red"></p>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="PRO_status">
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="div_PRO_btnAdd">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnAdd">Add Procedure</button>
                    </div>
                    <div class="btn-group" role="group" id="div_PRO_btnUpdate">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnUpdate">Update Procedure</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="PRO_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  

<!-- Clone Modal Start -->
<div class="modal fade" id="PRO_clone_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Clone Procedure Level 1</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="PRO_clone_form" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <br>
                            <label>Select procedure level 1 to be cloned</label>
                            <br><br>
                            <span>
                                <a href="#" class="btn btn-default" id="PRO_clone_select_all">&nbsp; Select all &nbsp;</a>
                                &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
                                <a href="#" class="btn btn-default" id="PRO_clone_deselect_all">Deselect all</a>
                            </span>
                            <br><br>
                            <div>
                                <select id="PRO_clone_select_list" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="PRO_btnClone"><i class=" fa fa-check"></i> Clone</button>
            </div>
        </div>
    </div>
</div>
<!-- Clone Modal End -->   