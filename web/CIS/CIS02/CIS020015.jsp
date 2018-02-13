<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 10:00:06 AM
    Author     : -D-
--%>


<!-- Modal -->
<div class="modal fade" id="CIS020015" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Height and Weight</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="myForm2" method="post">

                    <div class="col-xs-2 col-sm-2 col-md-2"><h4>Height</h4></div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">

                            <input type="text" name="bmiHeightHW" id="bmiHeight" class="form-control input-lg BP-class" placeholder="" tabindex="4">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2"><h4>cm</h4></div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group slider">
                            <div id="bmiHeightSliderHW"></div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-xs-2 col-sm-2 col-md-2"><h4>Weight</h4></div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group">
                                <input type="text" name="bmiWeightHW" id="bmiWeight" class="form-control input-lg BP-class" placeholder="" tabindex="4">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"><h4>kg</h4></div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="form-group slider">
                                <div id="bmiWeightSliderHW"></div>
                            </div>
                        </div>

                    </div>


                </form>
            </div>
        </div>
        <div class="modal-footer" id="updateOS">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                <div class="btn-group" role="group">
                    <button type="submit" class="btn btn-success btn-block btn-lg" id="updateHWBtn" role="button">Update</button>
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
                    <button type="submit" class="btn btn-success btn-block btn-lg" id="acceptHWBtn" role="button">Accept</button>
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

<script type="text/javascript">
    $(document).ready(function () {
        $('#updateOS').hide();
        $('#bmiHeightSliderHW').slider({
            value: 0,
            min: 140,
            max: 220,
            step: 1,
            slide: function (event, ui) {
                $('#bmiHeightHW').val(ui.value + "");
            }
        });
        $('#bmiHeightHW').on('change', function (e) {
            var bmiInput = parseInt($('#bmiHeight').val());
            $('#bmiHeightSliderHW').slider("option", "value", bmiInput);
            $('#bmiHeightHW').val(bmiInput + "");
        });
        $('#bmiWeightSliderHW').slider({
            value: 0,
            min: 0,
            max: 150,
            step: 1,
            slide: function (event, ui) {
                $('#bmiWeightHW').val(ui.value + "");
            }
        });
        $('#bmiWeightHW').on('change', function (e) {
            var bmiWInput = parseInt($('#bmiWeightHW').val());
            $('#bmiWeightSliderHW').slider("option", "value", bmiWInput);
            $('#bmiWeightHW').val(bmiWInput + "");
        });
    })
</script>