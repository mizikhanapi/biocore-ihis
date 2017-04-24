<%-- 
    Document   : cartaPemerhatian
    Created on : Apr 17, 2017, 9:32:58 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carta Pemerhatian</title>
        <%@include file="../assets/header.html"%>
        <link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="thumbnail">
                    <form role="form" id="BloodPressureForm">
                        <input type="hidden" id="BPid">
                        <div class="form-group">
                            <h4>Carta Pemerhatian</h4>
                            <hr class="pemisah" />
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="textinput">B/P</label>
                                    <input type="number" name="sitS" id="sitS" class="form-control input-lg col-md-6" placeholder="mmHg" tabindex="4">
                                </div>
                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="textinput">PR</label>
                                    <input type="number" name="sitS" id="sitS" class="form-control input-lg col-md-6" placeholder="/min" tabindex="4">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="textinput">RR</label>
                                    <input type="number" name="sitS" id="sitS" class="form-control input-lg col-md-6" placeholder="/min" tabindex="4">
                                </div>
                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="textinput">SpO<sub>2</sub></label>
                                    <input type="number" name="sitS" id="sitS" class="form-control input-lg col-md-6" placeholder="%" tabindex="4">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Tahap Kesakitan</label>
                                    <input type="text" name="sitS" id="sitS" class="form-control input-lg col-md-6" placeholder="" tabindex="4">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-6 control-label" for="textinput">Keputusan</label>
                                    <div id="slider" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content col-md-6">
                                        <div class="ui-slider-range ui-corner-all ui-widget-header ui-slider-range-min" style="width: 36.3636%;"></div>
                                        <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 36.3636%;"></span>
                                    </div>
                                    <input type="number" name="sitS" id="sitS" class="form-control input-lg col-md-3" placeholder="eg: Moderate" tabindex="4">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <label class="col-md-12 control-label" for="textinput">Tahap Kesakitan</label>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div id="slider" class="col-md-11 ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
                                        <div class="ui-slider-range ui-corner-all ui-widget-header ui-slider-range-min" style="width: 36.3636%;"></div>
                                        <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 36.3636%;"></span>
                                    </div>
                                    <div class="col-md-1">
                                        <p>6</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group row">
                                    <label class="col-md-6 control-label" for="textinput">Keputusan</label>
                                    <input type="text" name="sitS" id="sitS" class="form-control input-lg col-md-12" placeholder="eg: Moderate" tabindex="4">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <img src="pain_scale.jpg" style="width: 100%; padding: 2%">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <textarea type="text" name="display_name" id="PEComment" class="form-control input-lg" placeholder="Catatan/Tindakan Kejururawatan" tabindex="3"></textarea>
                                </div>
                            </div>
                        </div>


                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
