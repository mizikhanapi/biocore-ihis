<!DOCTYPE html>
<html lang="en">
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>iHIS | Screen Name</title>

        <!-- header -->
        <%@include file = "../assets/header.html" %>

        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>

        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <script src="../assets/js/Chart.js"></script>

        <style type="text/css" media="print">
            @page 
            {
                /*                size:  auto;
                                margin: 0mm;*/
            }

        </style>

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
                        <div class="col-md-4">
                            <div class="thumbnail">
                                <h3>BAR CHART</h3>
                                <canvas id="bar" height="300" width="470" style="width: 470px; height: 300px;"></canvas>
                                <script>
                                    var barChartData = {
                                        labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Mon"],
                                        datasets: [
                                            {
                                                fillColor: "#2bbfba",
                                                strokeColor: "#2bbfba",
                                                data: [65, 59, 90, 81, 56, 55, 40]
                                            },
                                            {
                                                fillColor: "#5dd0fb",
                                                strokeColor: "#5dd0fb",
                                                data: [25, 35, 45, 50, 50, 65, 80]
                                            },
                                            {
                                                fillColor: "#5dd0fb",
                                                strokeColor: "#5dd0fb",
                                                data: [25, 35, 45, 50, 50, 65, 80]
                                            }
                                        ]
                                
                                    };
                                    new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
                                </script>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumbnail">
                                <div class="area_chart_left_main lineasd">
                                    <div class="area_chart_left_l">
                                        <h3>LINE CHART</h3>
                                    </div>
                                    <div class="area_chart_left_r">
                                        <ul style="float: left">
                                            <li class="lab1">Label 1</li>
                                            <li class="lab2">Label 2</li>
                                        </ul>
                                    </div>
                                    <div class="clear"> </div>
                                </div>
                                <!--graph-->
                                <link rel="stylesheet" href="../assets/css/graph.css">
                                <script src="../assets/js/jquery.flot.min.js"></script>
                                <!--//graph-->
                                <script>
                                    $(document).ready(function () {

                                        // Graph Data ##############################################
                                        var graphData = [{
                                                // Returning Visits
                                                data: [[4, 4500], [5, 3500], [6, 6550], [7, 7600], [8, 4500], [9, 3500], [10, 6550], ],
                                                color: '#2bbfba',
                                                points: {radius: 7, fillColor: '#5dd0fb'}
                                            },
                                            {
                                                // Returning Visits
                                                data: [[4, 4570], [5, 3590], [6, 4550], [7, 2600], [8, 4500], [9, 3500], [10, 6550], ],
                                                color: '#333333',
                                                points: {radius: 7, fillColor: '#5dd0fb'}
                                            }
                                        ];

                                        // Lines Graph #############################################
                                        $.plot($('#graph-lines'), graphData, {
                                            series: {
                                                points: {
                                                    show: true,
                                                    radius: 1
                                                },
                                                lines: {
                                                    show: true
                                                },
                                                shadowSize: 0
                                            },
                                            grid: {
                                                color: '#2bbfba',
                                                borderColor: 'transparent',
                                                borderWidth: 10,
                                                hoverable: true
                                            },
                                            xaxis: {
                                                tickColor: 'transparent',
                                                tickDecimals: false
                                            },
                                            yaxis: {
                                                tickSize: 1200
                                            }
                                        });

                                        // Graph Toggle ############################################
                                        $('#graph-bars').hide();

                                        $('#lines').on('click', function (e) {
                                            $('#bars').removeClass('active');
                                            $('#graph-bars').fadeOut();
                                            $(this).addClass('active');
                                            $('#graph-lines').fadeIn();
                                            e.preventDefault();
                                        });

                                        $('#bars').on('click', function (e) {
                                            $('#lines').removeClass('active');
                                            $('#graph-lines').fadeOut();
                                            $(this).addClass('active');
                                            $('#graph-bars').fadeIn().removeClass('hidden');
                                            e.preventDefault();
                                        });

                                    });
                                </script>
                                <div id="graph-wrapper">
                                    <div class="graph-container">
                                        <div id="graph-lines"> </div>
                                        <div id="graph-bars"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumbnail">
                                <h3>AREA CHART</h3>
                                <canvas id="line" height="300" width="470" style="width: 470px; height: 300px;"></canvas>
                                <script>
                                    var lineChartData = {
                                        labels: ["induk", "bandar", "Industri", "Thu", "Fri", "Sat", "Mon"],
                                        datasets: [
                                            {
                                                fillColor: "#92dcda",
                                                strokeColor: "#2bbfba",
                                                pointColor: "#00aced",
                                                pointStrokeColor: "#fff",
                                                data: [20, 35, 45, 50, 50, 65, 12]
                                            }
                                        ]

                                    };
                                    new Chart(document.getElementById("line").getContext("2d")).Line(lineChartData);
                                </script>
                            </div>
                        </div>

                    </div>
                    <!-- End Panel -->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <table id="report1" class="table table-filter table-striped table-bordered dataTable no-footer" cellspacing="0" width="100%" role="grid" aria-describedby="example_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 136px;">Name</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 216px;">Position</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 102px;">Office</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 42px;">Age</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 92px;">Start date</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 79px;">Salary</th></tr>
                                    </thead>
                                    <tfoot>
                                        <tr><th rowspan="1" colspan="1">Name</th><th rowspan="1" colspan="1">Position</th><th rowspan="1" colspan="1">Office</th><th rowspan="1" colspan="1">Age</th><th rowspan="1" colspan="1">Start date</th><th rowspan="1" colspan="1">Salary</th></tr>
                                    </tfoot>
                                    <tbody>
                                        <tr role="row" class="odd">
                                            <td class="sorting_1">Airi Satou</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>33</td>
                                            <td>2008/11/28</td>
                                            <td>$162,700</td>
                                        </tr>
                                        <tr role="row" class="even">
                                            <td class="sorting_1">Angelica Ramos</td>
                                            <td>Chief Executive Officer (CEO)</td>
                                            <td>London</td>
                                            <td>47</td>
                                            <td>2009/10/09</td>
                                            <td>$1,200,000</td>
                                        </tr>
                                        <tr role="row" class="odd">
                                            <td class="sorting_1">Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                            <td>$86,000</td>
                                        </tr>
                                        <tr role="row" class="even">
                                            <td class="sorting_1">Bradley Greer</td>
                                            <td>Software Engineer</td>
                                            <td>London</td>
                                            <td>41</td>
                                            <td>2012/10/13</td>
                                            <td>$132,000</td>
                                        </tr>
                                        <tr role="row" class="odd">
                                            <td class="sorting_1">Brenden Wagner</td>
                                            <td>Software Engineer</td>
                                            <td>San Francisco</td>
                                            <td>28</td>
                                            <td>2011/06/07</td>
                                            <td>$206,850</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <input name="b_print" type="button" class="btn btn-success"  onClick="printdiv('div_print');" value=" Print ">
                                <div id="div_print">
                                    <h3>BAR CHART</h3>
                                    alkhflkjsahgkjahfglkjdfg;d
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- main -->		

            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="squarespaceModal1" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span><i class="fa fa-times fa-lg"></i></span></button>
                        <h3 class="modal-title" id="lineModalLabel">Complaint Form</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->
                        <p>Content Goes Here</p>

                    </div>
                    <div class="modal-footer">
                        <button type="button" id="saveImage" class="btn btn-clear btn-lg" data-dismiss="modal" role="button">Close</button><button type="submit" class="btn btn-success btn-lg" role="button">Accept</button><div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="" role="group">

                            </div>

                            <div class="" role="group">

                            </div>
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
        <!--data table-->
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        <script>
                                        $(document).ready(function () {
                                            $('#report1').DataTable({
                                                dom: 'Bfrtip',
                                                buttons: [
                                                    {
                                                        extend: 'print',
                                                        message: 'This print was produced using the Print button for DataTables',
                                                        customize: function (win) {
                                                            $(win.document.body)
                                                                    .css('font-size', '10pt')
                                                                    .prepend(
                                                                            '<img src="http://datatables.net/media/images/logo-fade.png" style="position:absolute; top:0; left:0;" />'
                                                                            );

                                                            $(win.document.body).find('table')
                                                                    .addClass('compact')
                                                                    .css('font-size', 'inherit');
                                                        }
                                                    }
                                                ]
                                            });
                                        });
        </script>

        <script language="javascript">
            function printdiv(printpage)
            {
                var headstr = "<html><head><title></title></head><body>";
                var footstr = "</body>";
                var newstr = document.all.item(printpage).innerHTML;
                var oldstr = document.body.innerHTML;
                document.body.innerHTML = headstr + newstr + footstr;
                window.print();
                document.body.innerHTML = oldstr;
                return false;
            }
        </script>

    </body>
</html>