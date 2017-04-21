<!DOCTYPE html>
<html lang="en">
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>iHIS | Screen Name</title>

        <!-- header -->
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       

                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.html" %>
                <!-- menu side -->	

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">

                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->

                    <div class="row">
                        <div class="col-md-2">
                            <div class="thumbnail">
                                <div class="text-center">
                                    <div class="bed-booking-title">First Class | WARD 01</div>
                                    <span class="bed-booking-total">123</span>
                                    <div>
                                        <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;12</span> 
                                        <span class="bed-booking-p"><i class="fa fa-square"></i>&nbsp;10</span>
                                        <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;2</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="thumbnail">
                                <div class="text-center">
                                    <div class="bed-booking-title">First Class | WARD 01</div>
                                    <span class="bed-booking-total">123</span>
                                    <div>
                                        <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;12</span> 
                                        <span class="bed-booking-p"><i class="fa fa-square"></i>&nbsp;10</span>
                                        <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;2</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="thumbnail">
                                <div class="text-center">
                                    <div class="bed-booking-title">First Class | WARD 01</div>
                                    <span class="bed-booking-total">123</span>
                                    <div>
                                        <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;12</span> 
                                        <span class="bed-booking-p"><i class="fa fa-square"></i>&nbsp;10</span>
                                        <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;2</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h4>
                                    Pop-Up
                                </h4>
                                <div class="row">
                                    <div class="col-md-12">

                                        <button class="btn btn-info btn-lg" data-toggle="modal" data-target="#squarespaceModal1">Pop-up with Action Button</button>
                                        <button class="btn btn-info btn-lg" data-toggle="modal" data-target="#squarespaceModal2">Pop-up with NO Action Button</button>


                                    </div>


                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <br/>
                                        <div class="text-center">
                                            <button id="button1id" name="button1id" class="btn btn-default"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                                            <button id="button1id" name="button1id" class="btn btn-default"><i class="fa fa-pencil-square-o fa-lg"></i>&nbsp; Update</button>
                                            <button id="button1id" name="button1id" class="btn btn-default"><i class="fa fa-times fa-lg"></i>&nbsp; Delete</button>
                                            <button id="button2id" name="button2id" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Start Panel -->
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="generic">
                            <%@include file = "cis/panel-generic.jsp" %>
                        </div>
                        <div class="tab-pane fade" id="orthopedic">
                            <%@include file = "cis/panel-orthopedic.jsp" %>
                        </div>
                    </div>


                    <!-- End Panel -->

                </div>
                <!-- main -->		

            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="squarespaceModal1" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa fa-info fa-lg" style="font-size: 88px; margin: 20px 0px;"></i>
                            <h2>Are you sure?</h2>
                            <p>Content Goes Here</p>
                        </div>
                        <div class="text-center margin-bottom-10px">
                            <button type="button" class="btn btn-default ">Cancel</button>
                            <button type="button" class="btn btn-primary">Save</button>
                        </div>


                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="squarespaceModal2" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span><i class="fa fa-times fa-lg" ></i></span></button>
                        <h3 class="modal-title" id="lineModalLabel">Complaint Form</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->
                        <p>Content Goes Here</p>

                    </div>
                </div>
            </div>
        </div>



        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script>
            $('a[class="panelito"]').on('shown.bs.tab', function (e) {
                var target = $(this).attr('href');

                $(target).css('left', '' + $(window).width() + 'px');
                var left = $(target).offset().left;
                $(target).css({left: left}).animate({"left": "0px"}, "10");
            })
        </script>


    </body></html>