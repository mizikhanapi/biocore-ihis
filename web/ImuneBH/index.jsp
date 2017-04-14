<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>iHIS | Register Booking for Immunization</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file = "../assets/header.html" %>
    </head>
    <body>

        <div class="container-fluid m-scene">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4" style="margin-top: 2%;">
                            <div class="thumbnail" style="text-align: center;">
                                <a href="." title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                                <a id = "logoutBtn" href="destroySession.jsp" title="Log Out"><i class="fa fa-power-off fa-lg pull-right" style="color: #ccc;"></i></a>
                                <div class="profile-img-card" >
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                                </div>
                                <div class="logo" style="font-size: 32px;">
                                    Butiran Tempahan Imunisasi
                                </div>
                                <form class="form-horizontal" name="myForm2" id="myForm2" style="text-align: left;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">No. KP *</label>
                                                <div class="col-md-12">
                                                    <input id="pname" name="pname" type="text" placeholder="No. KP" class="form-control input-md">
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">Nama Penuh *</label>
                                                <div class="col-md-12">
                                                    <input id="pname" name="pname" type="text" placeholder="Nama Penuh" class="form-control input-md">
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">No. Tel Bimbit *</label>
                                                <div class="col-md-12">
                                                    <input id="pnic" name="pnic" type="text" placeholder="No. Tel Bimbit" class="form-control input-md">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">Cawangan TH.</label>
                                                <div class="col-md-12">
                                                    <input id="poic" name="poic" type="text" placeholder="Cawangan TH." class="form-control input-md">
                                                </div>
                                            </div>

                                            <!-- Select Basic -->
                                            <div class="form-group">
                                                <label class="col-md-12" for="selectbasic">Negeri *</label>
                                                <div class="col-md-12">
                                                    <input id="pit" name="pit" type="text" placeholder="Negeri" class="form-control input-md">
                                                </div>
                                            </div>

                                            <!-- Text input-->
                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">Daerah. *</label>
                                                <div class="col-md-12">
                                                    <input id="pino" name="pino" type="text" placeholder="Daerah" class="form-control input-md">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-12" for="textinput">Klinik Pilihan. *</label>
                                                <div class="col-md-12">
                                                    <input id="pino" name="pino" type="text" placeholder="Klinik Pilihan." class="form-control input-md">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-12" for="selectbasic">Pilihan Vaksin *</label>
                                                <div class="col-md-12">
                                                    <div class="text-center">
                                                        <label for="radios-0">
                                                            <input type="radio" name="radios" id="radios-0" value="Consultant Room">
                                                            Influenza RM***&nbsp;&nbsp;
                                                        </label>
                                                        <label for="radios-1">
                                                            <input type="radio" name="radios" id="radios-1" value="Queue">
                                                            Pneumo RM***&nbsp;&nbsp;
                                                        </label>
                                                        <label for="radios-2">
                                                            <input type="radio" name="radios" id="radios-2" value="Doctor">
                                                            Combo ( A+B) RM***&nbsp;&nbsp;
                                                        </label>
                                                    </div>

                                                    <input id="radios-0" name="pino" type="text" placeholder="Pilihan:" class="form-control input-md">
                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-success btn-block btn-lg " type="button" id="registerQueue"><i class="fa fa-plus"></i> Register</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
