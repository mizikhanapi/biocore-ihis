<%-- 
    Document   : CIS020017
    Created on : Sep 13, 2018, 10:37:19 AM
    Author     : shay
--%>

<!-- Modal -->
    <div class="modal fade" id="CIS020017" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Cholesterol</h3>
                </div>
                
                <div class="modal-body">

                    <!-- content goes here -->
                    <form role="form" id="formCholesterol" method="post">
                        <input type="hidden" name="cholesterolId" id="cholesterolId" class="form-control input-lg" placeholder="cm" tabindex="4">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4"><h4>Total Cholesterol</h4></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="cholesterolTotal" id="cholesterolTotal" class="form-control input-lg num-3-1" placeholder="" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <select class="form-control input-lg" id="totalCUnit">
                                    <option value="mg/dL">mg/dL</option>
                                    <option value="mmol/dL">mmol/dL</option>
                                </select>
                            </div>                       
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4"><h4>LDL Cholesterol</h4></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="cholesterolLDL" id="cholesterolLDL" class="form-control input-lg num-3-1" placeholder="" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <select class="form-control input-lg" id="LDLCunit">
                                    <option value="mg/dL">mg/dL</option>
                                    <option value="mmol/dL">mmol/dL</option>
                                </select>
                            </div>                       
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4"><h4>HDL Cholesterol</h4></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="cholesterolHDL" id="cholesterolHDL" class="form-control input-lg num-3-1" placeholder="" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <select class="form-control input-lg" id="HDLCunit">
                                    <option value="mg/dL">mg/dL</option>
                                    <option value="mmol/dL">mmol/dL</option>
                                </select>
                            </div>                       
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4"><h4>Triglycerides</h4></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="cholesterolTrigly" id="cholesterolTrigly" class="form-control input-lg num-3-1" placeholder="" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <select class="form-control input-lg" id="TriCunit">
                                    <option value="mg/dL">mg/dL</option>
                                    <option value="mmol/dL">mmol/dL</option>
                                </select>
                            </div>                       
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4"><h4>non-HDL-C</h4></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="cholesterolNonHDL" id="cholesterolNonHDL" class="form-control input-lg num-3-1" placeholder="" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <select class="form-control input-lg" id="nonHDLCunit">
                                    <option value="mg/dL">mg/dL</option>
                                    <option value="mmol/dL">mmol/dL</option>
                                </select>
                            </div>                       
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4"><h4>TG to HDL ratio</h4></div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="cholesterolRatio" id="cholesterolRatio" class="form-control input-lg num-3-1" placeholder="" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <select class="form-control input-lg" id="RatioCunit">
                                    <option value="mg/dL">mg/dL</option>
                                    <option value="mmol/dL">mmol/dL</option>
                                </select>
                            </div>                       
                        </div> 
                    </form>    
                </div>
                
                
                <div class="modal-footer" id="updateCholesterol">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-primary btn-block btn-lg" id="updateCholesterolBtn" role="button">Update</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                    
                </div>
                
                <div class="modal-footer" id="actionCholesterol">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-primary btn-block btn-lg"id="acceptCholesterolBtn" role="button">Accept</button>
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
    <script type="text/javascript">
          $(document).ready(function(){
              $('#updateCholesterol').hide();
              
            $(".num-3-1").on('keyup keydown',function(){
                var input = this; 
                                
                if ($(this).val().length > 4){
                    bootbox.alert("Enter the specific value");
                    $(this).val('');
                    $(this).blur();
                }
                else if(input.validity.stepMismatch || isNaN(this.value)){
                    bootbox.alert("Enter number with one decimal number only");
                    $(this).val(''); 
                    $(this).blur();
                }
                else if(!input.checkValidity()){
                    bootbox.alert(input.validationMessage);
                    $(this).val('');
                    $(this).blur();
                }
                else{
                    if(input.value.length > 0){
                       var number = input.value;
                       var rounded = Math.round( number * 10 ) / 10;
                       $(this).val(rounded); 
                    }                    
                }

            });

   
          });
        </script>
  
    
