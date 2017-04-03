<%-- 
    Document   : CIS040009
    Created on : 03-Apr-2017, 14:03:49
    Author     : shay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Modal ADD Referral-->
<div class="modal fade" id="CIS040009" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Referral</h3>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="hidden" name="POS" id="codeREF" class="form-control input-lg"  tabindex="4">
                </div>
                <div class="form-group">
                    <h4 class="modal-title modalTextLabel">Health Facility Name :</h4>
                    <input class="form-control input-lg" type="text" name="problem"  id="REF" tabindex="4" placeholder="if other,please specify">
                    <div id="matchREF"></div>
                </div>


                <div class="form-group">
                    <h4 class="modal-title">Discipline :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="disREF" placeholder="if other,please specify">
                    <div id="matchREFD"></div>
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Doctor referred to :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="docREF" placeholder="if other,please specify">
                    <div id="matchREFDOC"></div>
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Appointment :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="appREF" >
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Medical History Notes :</h4>
                    <textarea id="medicalHisREF" class="form-control input-lg"></textarea>
                </div>



            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptMCTS" role="button">Accept</button>
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
<!--End ADD Referral-->


<div class="modal fade" id="update_CIS040009" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Referral</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="POS" id="codeREF" class="form-control input-lg"  tabindex="4">
                </div>
                <div class="form-group">
                    <h4 class="modal-title modalTextLabel">Health Facility Name :</h4>
                    <input class="form-control input-lg" type="text" name="problem"  id="UREF" tabindex="4" placeholder="if other,please specify">
                    <div id="UmatchREF"></div>
                </div>


                <div class="form-group">
                    <h4 class="modal-title">Discipline :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="UdisREF" placeholder="if other,please specify">
                    <div id="UmatchREFD"></div>
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Doctor referred to :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="UdocREF" placeholder="if other,please specify">
                    <div id="UmatchREFDOC"></div>
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Appointment :</h4>
                    <input class="form-control input-lg" type="text" name="pro" id="UappREF" >
                </div>

                <div class="form-group">
                    <h4 class="modal-title">Medical History Notes :</h4>
                    <textarea id="UmedicalHisREF" class="form-control input-lg"></textarea>
                </div>

            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateROSProcedure" role="button">Update</button>
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