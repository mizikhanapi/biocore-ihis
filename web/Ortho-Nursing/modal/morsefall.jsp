<%-- 
    Document   : morsefall
    Created on : Jun 6, 2017, 4:16:43 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="morse1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Morse Fall Scale Assessment Chart</h4>
            </div>
            <div class="modal-body">
                <form id="morseForm">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="Pick a date(dd/mm/yyyy)" id="morseDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="morseTime" id="morseTime1" value="AM">
                                        <label for="morseTime1">
                                            AM
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="morseTime" id="morseTime2" value="PM">
                                        <label for="morseTime2">
                                            PM
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="morseTime" id="morseTime3" value="Noon">
                                        <label for="morseTime3">
                                            Noon
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">

                        <div class="col-md-12">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td>
                                            <b>History of falling</b>
                                            <p>Tiada sejarah jatuh</p>
                                        </td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_fall" id="falling" value="0">
                                                <label for="falling">
                                                    0
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Baru jatuh / jatuh dalam masa 3 bulan</td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_fall" id="jatuh" value="25">
                                                <label for="jatuh">
                                                    25
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td>
                                            <b>Diagnosis</b>
                                            <p>Primary Diagnosis</p>
                                        </td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_diagnos" id="Primary" value="0">
                                                <label for="Primary">
                                                    0
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Secondary Diagnosis</td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_diagnos" id="Secondary" value="15">
                                                <label for="Secondary">
                                                    15
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td>
                                            <b>Bantuan Pergerakan</b>
                                            <p>Rehat di katil atau dibantu</p>
                                        </td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_pergerakan" id="Pergerakan" value="0">
                                                <label for="Pergerakan">
                                                    0
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Walking frame / tongkat</td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_pergerakan" id="tongkat" value="15">
                                                <label for="tongkat">
                                                    15
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Memegang katil / kerusi semasa berjalan.<br>Pesakit di atas troli / kerusi roda</td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_pergerakan" id="troli" value="30">
                                                <label for="troli">
                                                    30
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td rowspan="2"><b>IV Venofix / Syringe Pump</b></td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_venofix" id="Venofix" value="0">
                                                <label for="Venofix">
                                                    0
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_venofix" id="Venofix2" value="20">
                                                <label for="Venofix2">
                                                    20
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td><b>Rangka Badan / Pergerakan</b>
                                            <br>Normal / rehat di katil / tidak boleh bergerak
                                        </td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_badan" id="Badan" value="0">
                                                <label for="Badan">
                                                    0
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lemah</td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_badan" id="Lemah" value="10">
                                                <label for="Lemah">
                                                    10
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Kurang upaya / OKU / Post-Amputation</td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_badan" id="Amputation" value="20">
                                                <label for="Amputation">
                                                    20
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td>
                                            <b>Status Mental</b>
                                            <p>Sedar dan waras</p>
                                        </td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_mental" id="Mental" value="0">
                                                <label for="Mental">
                                                    0
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ingatan terhad / pelupa / Delirium / Psychiatic Patient</td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="rad_mental" id="Delirium" value="15">
                                                <label for="Delirium">
                                                    15
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="morse_btnAdd_div">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="morse_btnAdd" role="button">Add Assessment</button>
                    </div>
                    <div class="btn-group" role="group" id="morse_btnUpdate_div">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="morse_btnUpdate" role="button">Update Assessment</button>
                    </div>
                    <!--                    <div class="btn-group btn-delete hidden" role="group">
                                            <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                                        </div>-->
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('#morseDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+5'
    });
    

</script>