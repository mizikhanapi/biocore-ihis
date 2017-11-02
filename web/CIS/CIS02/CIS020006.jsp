<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 10:00:06 AM
    Author     : -D-
--%>

<!-- Modal -->
<div class="modal fade" id="CIS020006" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Body Temperature</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="myForm2" method="post">

                    <div class="form-group">
                        <input type="text"  id="BTemp" class="form-control input-lg" placeholder="Body Temperature" tabindex="4"  >
                        <input type="hidden"  id="BTid" class="form-control input-lg" placeholder="Body Temperature" tabindex="4" readonly >
                    </div>
                    <div class="form-group">
                        <div id="slider"></div>
                    </div>




            </div>
            <div class="modal-footer" id="updateBT">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBTBtn" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer" id="actionBT">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBTBtn" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function ascii(a) {
        return String.fromCharCode(a);
    }
    $(document).ready(function () {
        $('#updateBT').hide();
        $("#slider").slider({
            range: "min",
            value: 1,
            step: 1,
            min: 1,
            max: 100,
            slide: function (event, ui) {
                $("#BTemp").val(ui.value +" "+ ascii(176) + "C");
            }
        });


        $("#BTemp").change(function () {
            var value = this.value.substring(1);
            
            $("#slider").slider("value", parseInt(value));
        });
        
        $('#BTemp').on('keyup',function(){
            var intNum = parseInt(this.value);
            var value = $(this).val();
             if(value.length > 3){
                bootbox.alert("Please enter the correct Body Temperature");
                $(this).val('');
             }
             else if(intNum<0 || intNum>100){
                 bootbox.alert("Value for temperature must be within the range 0 - 100");
                 $(this).val('');
             }
             else{
                  $("#slider").slider("value", parseInt(value));
             }
           
        
        });
     
     

    })
</script>