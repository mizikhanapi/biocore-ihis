<%-- 
    Document   : mcModal
    Created on : Oct 31, 2018, 11:10:00 PM
    Author     : Shammugam
--%>

<div class="modal fade" id="mcDisplayModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">

    <div class="modal-dialog modal-lg">

        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title">Sijil Cuti Sakit</h3>
            </div>

            <div class="modal-body">
                <div id="mcDisplayModalPrintContent"></div>
            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <input name="b_print" id="mcDisplayModalPrintBtn" type="button" class="btn btn-success btn-lg" value="Print">        
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Close</button>     
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>