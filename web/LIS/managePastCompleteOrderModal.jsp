<%-- 
    Document   : managePastCompleteOrderModal
    Created on : Feb 1, 2018, 6:04:36 PM
    Author     : Shammugam
--%>

<!--modal change logo-->
<div class="modal fade" id="OD_modalResult" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Exam Result</h3>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="VR_form">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Result No. * </label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly disabled id="VR_ResultNo">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Specimen No. * </label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly disabled id="VR_SpecimenNo">
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Item Name. * </label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly disabled id="VR_ItemName">
                        </div>
                    </div>



                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput" id="hfcLabel">Image</label>

                        <div class="col-md-12" align="center">
                            <img src="" id="VR_gamba" alt="Exam Result" class="img-responsive" style="height: 100%; width: 100%">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Result</label>
                        <div class="col-md-8">
                            <textarea id="VR_Result" class="form-control input-md" maxlength="500" rows="2" readonly></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Remark</label>
                        <div class="col-md-8">
                            <textarea id="VR_Remark" class="form-control input-md" maxlength="500" rows="2" readonly></textarea>
                        </div>
                    </div>

                </form>


                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Close <span class="fa fa-check" aria-hidden="true" style="display: inline-block;" ></span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Update Part End -->


