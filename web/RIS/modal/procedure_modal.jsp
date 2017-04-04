<%-- 
    Document   : procedure_modal
    Created on : Apr 3, 2017, 6:57:24 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    
    String query = "Select detail_reference_code from adm_lookup_detail where master_reference_code = '0094' AND description like '%radiology%' order by created_date desc limit 1";
    
    ArrayList<ArrayList<String>> dataRadiologyCode = conn.getData(query);
    String code = "5";
    
    if(dataRadiologyCode.size()>0){
        code = dataRadiologyCode.get(0).get(0);
    }
%>

<!-- Modal Detail -->
<!-- Add Modal Start -->
<div class="modal fade" id="PRO_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="PRO_modal_title"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="PRO_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Clinical Discipline Code*</label>
                        <div class="col-md-8">
                            <input id="PRO_clinical"  type="text" class="form-control input-md"  readonly value="<%= code%>">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Body System Name*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="PRO_bodySystem">
                                <option  value="" >-- Select Body System --</option>
                            </select>

                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Modality Name*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="PRO_modality">
                                <option  value="" >-- Select Modality --</option>
                            </select>

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
                        <label class="col-md-4 control-label" for="textinput">Procedure Name*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Insert radiology procedure name" class="form-control" maxlength="300" id="PRO_proName">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Buying Price (RM)*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Insert radiology procedure buying price" class="form-control" maxlength="9" id="PRO_buyPrice">
                            <p id="PRO_buyPrice_err" style="color: red"></p>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Selling Price (RM)*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Insert radiology procedure selling price" class="form-control" maxlength="9" id="PRO_sellPrice">
                            <p id="PRO_sellPrice_err" style="color: red"></p>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Quantity*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Insert quantity of available radiology procedure" class="form-control" maxlength="9" id="PRO_quantity">
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
                    <div class="btn-group" role="group" id="PRO_div_btnAdd_or_update">
                        <!--<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnAdd">Add</button>-->
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
<!-- Modal -->

