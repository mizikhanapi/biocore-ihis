<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 10:00:06 AM
    Author     : -D-
--%>


<!-- Modal -->
<div class="modal fade" id="CIS020003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Blood Pressure</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="BloodPressureForm" >
                    <input type="hidden" id="BPid">
                    <div class="form-group">
                        <h4 id="BP_setting">Blood Pressure Sitting</h4>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <h5>Systolic</h5>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <h5>Diastolic</h5>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <h5>Pulse</h5>

                            </div>
                        </div>
                    </div>
                    <div class="row lineSeperator">
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input type="number" name="sitS" id="sitS" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" >
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input type="number" name="sitD" id="sitD" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" >
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input type="number" name="sitP" id="sitP" class="form-control input-lg BP-class" placeholder="bpm" tabindex="4"  >

                            </div>
                        </div>
                    </div>
                    <div id="bloodPressure">
                        <div class="form-group">
                            <h4>Blood Pressure Standing</h4>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Systolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Diastolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Pulse</h5>

                                </div>
                            </div>
                        </div>
                        <div class="row lineSeperator">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="standS" id="standS" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" >
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="standD" id="standD" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" >
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="standP" id="standP" class="form-control input-lg BP-class" placeholder="bpm" tabindex="4" >

                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <h4>Blood Pressure Lying</h4>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Systolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Diastolic</h5>
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <h5>Pulse</h5>

                                </div>
                            </div>
                        </div>
                        <div class="row lineSeperator">
                            <div class="col-xs-4 col-sm-4 col-md-4">

                                <div class="form-group">
                                    <input type="number" name="lyingS" id="lyingS" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4">
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="lyingD" id="lyingD" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" >
                                </div>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4">
                                <div class="form-group">
                                    <input type="number" name="lyingP" id="lyingP" class="form-control input-lg BP-class" placeholder="bpm" tabindex="4" >
                                </div>
                            </div>
                        </div>
                    </div>
             </form>            

            </div>
            <div class="modal-footer" id="updateBloodP">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBloodPBtn" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>

            </div>
            <div class="modal-footer" id="actionBloodP">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnCIS_O_VTS_BP_ACCEPT" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
               
            </div>
            <div class="modal-footer" id="ortho_actionBloodP">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="ortho_acceptBloodPBtn" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="ortho_delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="ortho_saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#updateBloodP').hide();
               
        $(".BP-class").on('keyup keydown',function(){
            var input = this; 
            if ($(this).val().length > 3){
                bootbox.alert("Enter the specific value");
                $(this).val('');
            }
            else if(input.validity.stepMismatch || isNaN(this.value)){
                bootbox.alert("Enter whole number only.");
                $(this).val(''); 
            }
            else if(!input.checkValidity()){
                bootbox.alert(input.validationMessage);
                $(this).val('');
            }
            else{
                var intNum = parseInt(this.value.replace(/[^0-9\.]/g, ''), 10);
                $(this).val(intNum);
            }
           
        });

    });
    

</script>