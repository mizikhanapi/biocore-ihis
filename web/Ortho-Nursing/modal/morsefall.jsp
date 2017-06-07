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
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="date" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio1" id="radio1" value="option1">
                                        <label for="radio1">
                                            AM
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio1" id="radio2" value="option2">
                                        <label for="radio2">
                                            PM
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio1" id="radio3" value="option3">
                                        <label for="radio3">
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
                                        <td>History of falling</td>
                                        <td>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="radio2" id="falling" value="option1">
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
                                                <input type="radio" name="radio2" id="jatuh" value="option1">
                                                <label for="jatuh">
                                                    25
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Primary Diagnosis</td>
                                    <td>
                                        <div class="radio radio-primary">
                                            <input type="radio" name="radio3" id="Primary" value="option1">
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
                                            <input type="radio" name="radio3" id="Secondary" value="option1">
                                            <label for="Secondary">
                                                15
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Bantuan Pergerakan</td>
                                    <td>
                                        <div class="radio radio-primary">
                                            <input type="radio" name="radio4" id="Pergerakan" value="option1">
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
                                            <input type="radio" name="radio4" id="tongkat" value="option1">
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
                                            <input type="radio" name="radio4" id="troli" value="option1">
                                            <label for="troli">
                                                30
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td rowspan="2">IV Venofix / Syringe Pump</td>
                                    <td>
                                        <div class="radio radio-primary">
                                            <input type="radio" name="radio5" id="Venofix" value="option1">
                                            <label for="Venofix">
                                                0
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="radio radio-primary">
                                            <input type="radio" name="radio5" id="Venofix2" value="option1">
                                            <label for="Venofix2">
                                                20
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Rangka Badan / Pergerakan<br>Normal / rehat di katil / tidak boleh bergerak</td>
                                    <td>
                                        <div class="radio radio-primary">
                                            <input type="radio" name="radio6" id="Badan" value="option1">
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
                                            <input type="radio" name="radio6" id="Lemah" value="option1">
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
                                            <input type="radio" name="radio6" id="Amputation" value="option1">
                                            <label for="Amputation">
                                                20
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Status Mental </td>
                                    <td>
                                        <div class="radio radio-primary">
                                            <input type="radio" name="radio7" id="Mental" value="option1">
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
                                            <input type="radio" name="radio7" id="Delirium" value="option1">
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
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBloodPBtn" role="button">Add Items</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>