<%-- 
    Document   : procedure_modal
    Created on : May 10, 2017, 6:31:03 PM
    Author     : user
--%>

<!--Modal Detail--> 
<!-- Add Modal Start -->
<div class="modal fade" id="PRO2_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="PRO2_modal_title"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="PRO2_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group" id="PRO2_div_level1">
                        <label class="col-md-4 control-label" for="textinput">Level 2 Code*</label>
                        <div class="col-md-8">
                            <input id="PRO2_level1_name"  type="text" placeholder="Search level 2 procedure code" class="form-control input-md" maxlength="30">
                            <input type="hidden" id="PRO2_level1_code">
                            <div id="PRO2_match" class="search-drop">
                                
                            </div>

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group" id="PRO2_div_insert">
                        <label class="col-md-4 control-label" >Level 3 Code*</label>
                        <div class="col-md-8 input-group">
                            <input id="PRO2_level2_code_front" type="text" class="form-control" style="text-align:right;" placeholder="Auto" size="1" disabled>
                            <span class="input-group-addon" style="border: 0px; background-color: white; width: 0.15px">.</span>
                            <input id="PRO2_level2_code_ins"  type="text" placeholder="Insert level 3 procedure code " class="form-control input-md code-input" maxlength="10">

                        </div>
                    </div>
                    
                    <div class="form-group" id="PRO2_div_update">
                        <label class="col-md-4 control-label">Level 3 Code*</label>
                        <div class="col-md-8 input-group">
                            <input id="PRO2_level2_code_upd"  type="text" placeholder="Insert level 3 procedure code" class="form-control input-md" disabled>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Name*</label>
                        <div class="col-md-8">
                            <input id="PRO2_Name"  type="text" placeholder="Insert procedure name" class="form-control input-md" maxlength="199">

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="PRO2_status">
                                <option  value="Active" >Active</option>
                                <option  value="Inactive" >Inactive</option>
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="PRO2_div_btnAdd_or_update">
                        <!--<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO2_btnAdd">Add</button>-->
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="PRO2_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<!-- Modal -->
<script type="text/javascript">
    
    //---------------- search level 1 procedure -----------------------------------
    
    $('#PRO2_level1_name').on('keyup', function(){
        var input = $(this).val();
        
        $('#PRO2_level2_code_front').val('');
        
        if(input.length > 0){
            var data = {
                key: input,
                process: 'level2'
            };
            $('#PRO2_match').html('<img src="img/ajax-loader.gif">');
            
            
            $.ajax({
                type: 'POST',
                url: "procedure_controller/search_porcedure.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    
                        $('#PRO2_match').html(data);
                        $('#PRO_match_list li').on('click', function(){
                            $('#PRO2_level1_name').val($(this).text());
                            $('#PRO2_level2_code_front').val($(this).data('code'));
                           
                            $('#PRO2_match').html('');      
                            
                        });
                        
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        $('#PRO2_match').html(errorThrown);
                    }
            });
            
        }
        else{
            $('#PRO2_match').html('');            
            
        }
        
    });
    
    //=========================================================================
</script>

