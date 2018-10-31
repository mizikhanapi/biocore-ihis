<%-- 
    Document   : tsModal
    Created on : Nov 1, 2018, 3:52:52 AM
    Author     : Shammugam
--%>

<div class="modal fade" id="tsDisplayModal" tabindex="-1" role="dialog" aria-labelledby="tsDisplayModal" aria-hidden="true">
    
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title">Time Slip</h3>
            </div>
            
            <div class="modal-body">
                <div id="tsDisplayModalPrintContent"></div>
            </div>
            
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <input name="b_print" id="tsDisplayModalPrintBtn" type="button" class="btn btn-success btn-lg" value="Print">        
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Close</button>     
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    
</div>