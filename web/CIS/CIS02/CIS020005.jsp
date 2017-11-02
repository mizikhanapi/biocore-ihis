<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 10:00:06 AM
    Author     : -D-
--%>


    <!-- Modal -->
    <div class="modal fade" id="CIS020005" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Oxygen Saturation</h3>
                </div>
                           <div class="modal-body">

                    <!-- content goes here -->
                    <form role="form" id="myForm2" method="post">

                        <div class="form-group">
                            <h4>Oxygen Saturation</h4>
                        </div>


      
                        <div class="form-group">
                            <input type="number" min="0" max="99.9" step="0.1" name="OSat" id="OSat" class="form-control input-lg" placeholder="Oxygen Saturation" tabindex="4" >
                            <input type="hidden" name="idOS" id="idOS" class="form-control input-lg" tabindex="4">
                        </div>


                     </form>
                </div>
                <div class="modal-footer" id="updateOS">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-success btn-block btn-lg" id="updateOSBtn"role="button">Update</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                    
                </div>
                
                <div class="modal-footer" id="actionOS">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="submit" class="btn btn-success btn-block btn-lg" id="acceptOSBtn" role="button">Accept</button>
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
            $('#updateOS').hide();
            $("#OSat").on('keyup keydown',function(){
                 if ($(this).val().length > 4){
                    bootbox.alert("Enter the correct Oxygen saturation");
                    $(this).val('');
                }
                else if(this.validity.stepMismatch){
                    bootbox.alert("Enter number with one decimal place only.");
                    $(this).val('');
                }
                else if(!this.checkValidity()){
                    bootbox.alert(this.validationMessage);
                    $(this).val('');
                }
                
            });
        })
        </script>