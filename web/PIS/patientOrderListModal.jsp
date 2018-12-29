<%-- 
    Document   : patientOrderListModal
    Created on : Oct 27, 2018, 4:29:47 AM
    Author     : Shammugam
--%>

<!-- Modal Invoice Start -->
<div class="modal fade" id="patientOrderDetailsVitalSignModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" align="left"> Vital Signs </h2>
            </div>
            <div class="modal-body">
                <div id="patientOrderDetailsVitalSignContent">
                    Loading........
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Invoice End -->


<!-- Modal Invoice Start -->
<div class="modal fade" id="patientOrderDetailsVitalSignGrafhModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" align="center"> Vital Signs Graph </h2>
            </div>
            <div class="modal-body">
                <div id="patientOrderDetailsVitalSignContent">
                    <div class="row" id="ANL_viewTable" style="height: 100%; width: 100%;">
                        <div class="chart-container" style="height: 100%; width: 100%;">
                            <canvas id="ANL_canvas" ></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Invoice End -->