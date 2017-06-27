<%-- 
    Document   : manageReportDailyModal
    Created on : Jun 27, 2017, 12:49:09 PM
    Author     : Shammugam
--%>


<!-- Modal Invoice Start -->
<div class="modal fade" id="DailySalesDetaileModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" align="center"> Sales Details </h2>
            </div>
            <div class="modal-body">
                
                <br><br>


                <div id="manageReportDailySalesDetailsTableDiv" class="form-group table-guling">
                    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="manageReportDailySalesDetailsTable">
                        <thead>
                        <th>Item Code</th>
                        <th>Item Name</th>
                        <th>Item Amount (RM)</th>
                        <th>Item Quantity Dispensed (PRICE/UNIT)</th>
                        <th>Total (RM)</th>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>

            </div>
            <div class="modal-footer">
                <div class="btn-group" role="group">
                    <button type="reset" id="deleveryOrderInvoiceCloseBtn" class="btn btn-success btn-block btn-lg" data-dismiss="modal" role="button"><i class="fa fa-times-circle-o" aria-hidden="true"></i>&nbsp;&nbsp;Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Invoice End -->
