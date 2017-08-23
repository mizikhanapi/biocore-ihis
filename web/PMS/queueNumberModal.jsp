<%-- 
    Document   : queueNumberModal
    Created on : Aug 23, 2017, 11:08:17 AM
    Author     : shay
--%>

<!-- Modal -->
<div class="modal fade" id="queueNumberModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body" >
                <div class="thumbnail" id="maintainQN">
                    <h3>Queue Number Information</h3>
                    <div class="form-group" id="divQueueNo">
                        <p id="klinik" style="text-align: left; font-size: 30px;"><%=session.getAttribute("HFC_NAME").toString()%></p>
                        <p id="noAnda" style="text-align: left;  font-size: 15px;">NO ANDA :</p>
                        <p id="noSekarang" style="text-align: left;font-size: 15px;" >NO SEKARANG:</p> 
                        <p id="tarikh" style="text-align: left;  font-size: 10px;">TARIKH : </p>
                    </div>
                    <div class="text-center">
                        <button id="queueNumberPrint" name="queueNumberPrint" class="btn btn-primary" data-dismiss="modal" role="button"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Print</button>
                        <button id="queueNumberClose" name="queueNumberClose" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban fa-lg"></i>&nbsp; Close</button>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>