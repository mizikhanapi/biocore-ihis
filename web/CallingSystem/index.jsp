
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Query"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%//@include file="../Entrance/validateSession.jsp"%>

<%
    String gamba = "";
    String nama = "";
    String role = "";
    String filterType = "";
    String namaHfc = "";
    String kodHfc ="";
    String health_facility_code = "";
    Conn conn = new Conn();
    Date dd = new Date();
    
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    String dates =formatter.format(dd);

    if (session.getAttribute("USER_NAME") != null) {

        gamba = session.getAttribute("PICTURE").toString();
        nama = session.getAttribute("USER_NAME").toString();
        role = session.getAttribute("ROLE_NAME").toString();
        namaHfc = session.getAttribute("HFC_NAME").toString();
        kodHfc = (String) session.getAttribute(MySessionKey.HFC_CD);
        health_facility_code = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        filterType = session.getAttribute("CS_PARAM").toString();

    }

    RMIConnector rmic = new RMIConnector();

    String sqlHFC = "SELECT ahd.hfc_cd,ahd.discipline_cd,ahd.subdiscipline_cd,ahf.hfc_name FROM adm_hfc_discipline ahd, adm_health_facility ahf WHERE ahd.hfc_cd = ahf.hfc_cd AND ahf.hfc_name='" + namaHfc + "'";
    ArrayList<ArrayList<String>> dataHFC;
    dataHFC = rmic.getQuerySQL(conn.HOST, conn.PORT, sqlHFC);

    String hfc_cd = "SELECT hfc_cd,logo FROM adm_health_facility WHERE hfc_cd='" + kodHfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd;
    mysqlhfc_cd = rmic.getQuerySQL(conn.HOST, conn.PORT, hfc_cd);

    String sql_dis = "SELECT ad.discipline_cd,ad.discipline_name FROM adm_discipline ad, adm_hfc_discipline ahd WHERE  ahd.discipline_cd = ad.discipline_cd AND ahd.hfc_cd = '" + health_facility_code + "' GROUP BY ad.discipline_cd";
    ArrayList<ArrayList<String>> sql_discipline;
    sql_discipline = rmic.getQuerySQL(conn.HOST, conn.PORT, sql_dis);

    //String sqldiscipline = "SELECT ahd.discipline_cd,ahd.subdiscipline_cd,ad.discipline_name FROM adm_discipline ad, adm_hfc_discipline ahd WHERE ad.discipline_cd = ahd.discipline_cd AND ahd.hfc_cd = '"+mysqlhfc_cd.get(0).get(0)+"'"; 
//    String sql_subDis = "SELECT asd.subdiscipline_cd,asd.subdiscipline_name FROM adm_discipline ad, adm_subdiscipline asd, adm_hfc_discipline ahd WHERE  ahd.discipline_cd = ad.discipline_cd AND ad.discipline_cd = asd.discipline_cd AND ahd.hfc_cd = '" + health_facility_code + "' GROUP BY subdiscipline_name";
//    ArrayList<ArrayList<String>> sql_Subdiscipline;
//    sql_Subdiscipline = rmic.getQuerySQL(conn.HOST, conn.PORT,sql_subDis);
    String hfccd1 = "";
    String discp1 = "";
    String subdi1 = "";
    String lang1 = "";
    String initial1 = "";
    try {

        hfccd1 = dataHFC.get(0).get(0);
        discp1 = dataHFC.get(0).get(1);
        subdi1 = dataHFC.get(0).get(2);

    } catch (Exception e3) {
    }

%>
<script src="assets/js/jquery-3.1.1.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.js" type="text/javascript"></script>
<script src="assets/js/bootbox.min.js"></script>
<!-- header -->
<style type="text/css">
        table {
            width:  100%;
            border-collapse: collapse;
        }
        .scrollingTable {
            overflow-y: auto;
        }
    </style>
    <script type="text/javascript">
        function makeTableScroll() {
            // Constant retrieved from server-side via JSP
            var maxRows = 4;

            var table = document.getElementById('myTable');
            var wrapper = table.parentNode;
            var rowsInTable = table.rows.length;
            var height = 0;
            if (rowsInTable > maxRows) {
                for (var i = 0; i < maxRows; i++) {
                    height += table.rows[i].clientHeight;
                }
                wrapper.style.height = height + "px";
            }
        }
    </script>
<%@include file = "../assets/header.html" %>
<style>
    html, body {
        height: 100%;
    }
    div#papar table>tbody>tr>td:first-child {
        padding-left: 30px;
    }

    div#papar table>tbody>tr>td:last-child {
        padding-right: 30px;
    }

    div#papar table>tbody>tr>td{
        border-top: 1px solid #ddd;
    }
</style>
<!-- header -->
<body>
<!-- menu top -->
<%//@include file = "libraries/topMenus-dashboard.html" %>
<!-- menu top -->
<div class="sticky-container">
    <div class="button-container">
        <a href="../Entrance/dashboard.jsp" title="Back to Dashboard"><i class="fa fa-home"></i></a>
        <br/>
        <a class="settingCalling" data-toggle="modal" data-target="#callingSetting" title="Settings"><i class="fa fa-cog"></i></a>
    </div>
</div>
<div class="container-fluid">
    <div class="row" style="display: table; height: 100%; width: 100%;">
        <div class="col-lg-3 calling-queueSection">
            <div class="text-center">
                <img src="<%=mysqlhfc_cd.get(0).get(1)%>" style="margin-bottom: 15px; margin-top:15px; width: 160px;" />
                <input type="text" id="hfccd" name="hfccd" value="<%=hfccd1%>" style=" display: none;"> 
                <input type="text" id="lng" name="lng" value="test" style=" display: none;">
            </div>
            <div id="papar" class="scrollingTable"></div>
            <div id="papar2" class="scrollingTable"></div>
        </div>
        <div class="col-lg-9" style="display: table-cell;">
            <div class="row">
                <div class="col-lg-12">
                    <div class="calling-dateTime">
                        <p id="spanTarikh" style="text-align: right; color: #666; display: block; font-weight: 700; font-size: 45px;margin-top: 10px;margin-bottom: 0px; ">
                            <span style="display: block; font-size: 34px; margin-bottom: -10px; font-weight: 300;" >--/--/----</span>
                            --:-- AM/PM
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="calling-panel">
                        <h1>Synth.&nbsp;<span>24.May</span></h1>
                        <p>Retro occupy organic, stumptown shabby chic pour-over roof party DIY normcore. Actually artisan organic occupy, Wes Anderson ugh whatever pour-over gastropub selvage. </p>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="calling-panel">
                        <h1>Bushwick&nbsp;<span>23.May</span></h1>
                        <p>Retro occupy organic, stumptown shabby chic pour-over roof party DIY normcore.</p>
                    </div>
                </div>
            </div>
        </div>

    </div>    
</div>

<div class="modal fade" id="callingSetting" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Calling Settings</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Search Discipline</label>
                        <div class="col-md-4">
                            <select id="discp" class="form-control">
                                <option value="">-- Select discipline --</option>
                                <%
                                    if (sql_discipline.size() > 0) {
                                        for (int i = 0; i < sql_discipline.size(); i++) {

                                %>
                                <option value="<%=sql_discipline.get(i).get(0)%>"><%=sql_discipline.get(i).get(1)%></option>
                                <%}
                                    }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="divSubDis">
                        <label class="col-md-4 control-label" for="selectbasic">Search Sub-Discipline</label>
                        <div class="col-md-4" id="divSelectSub">
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary" id="tapis"><i class="fa fa-filter"></i>&nbsp; Filter</button>
                    <button class="btn btn-default" id="clear">Clear</button>
                </div>
                <hr/>
                <form>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-4 control-label text-right" for="textinput">Initial Counter:</label>
                                <div class="col-md-8">
                                    <input type="text" id="initial" name="initial" value="0" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 style="padding: 0px;">Select Language: </h4>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group form-inline">
                                <div class="radio radio-primary" >
                                    <input type="radio" id="BM" class="setting" name="lang" value="BM" onclick="my_function(this)" checked="checked">
                                    <label for="BM">
                                        Bahasa Malaysia
                                    </label>
                                </div>

                                <div class="radio radio-primary">
                                    <input type="radio" id="BI" class="setting" name="lang" value="BI" onclick="my_function(this)">
                                    <label for="BI">
                                        English
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h4 style="padding: 0px;">Select Sound: </h4>
                    <div class="row"  id="hideshow">
                        <div class="col-md-12">
                            <div class="form-group form-inline">

                                <div class="radio radio-primary" id="L1">
                                    <input type="radio" id="1" class="setting" value="1" name="pilih" checked="chacked">
                                    <label for="1">
                                        Queue No. / No. Giliran
                                    </label>
                                </div>&nbsp;
                                <div class="radio radio-primary" id="L2">
                                    <input type="radio" id="2" class="setting" value="2" name="pilih" >
                                    <label for="2">
                                        Name of patient
                                    </label>
                                </div>&nbsp;
                                <div class="radio radio-primary" id="L3">
                                    <input type="radio" id="3" class="setting" value="3" name="pilih" >
                                    <label for="3">
                                        Queue No & Name of patient
                                    </label>
                                </div>

                            </div>
                        </div>
                    </div>

                </form>
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary btn-block btn-lg" id="acceptSettingBtn" role="button">Save</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#L2').hide();
    $('#L3').hide();
    function my_function(elm)
    {
        if (elm === document.getElementById('BM'))
        {
            //document.getElementById('my_div').style.visibility = "hidden";
//            document.getElementById('2').style.display = "none";
//            document.getElementById('L2').style.display = "none";
//            document.getElementById('3').style.display = "none";
//            document.getElementById('L3').style.display = "none";
            $('#L2').hide();
            $('#L3').hide();
        } else if (elm === document.getElementById('BI'))
        {
            //document.getElementById('my_div').style.visibility = "visible";
            //document.getElementById('hideshow').style.display = "block";
//            document.getElementById('2').style.display = "block";
            $('#L2').show();
            $('#L3').show();
//            document.getElementById('L2').style.display = "block";
//            document.getElementById('3').style.display = "block";
//            document.getElementById('L3').style.display = "block";
        }
    }
</script>

<script>
    function ulangPanggil(hfccd, discp, subdi, lang, initial) {
        $.ajax({
            url: "caller.jsp",
            type: 'POST',
            data: {
                hfccd: hfccd,
                discp: discp,
                subdi: subdi,
                lang: lang,
                initial: initial
            },
            timeout: 60000,
            success: function (data) {
                
                $("#papar").html(data);
                var t = setTimeout("ulangPanggil('" + hfccd + "', '" + discp + "', '" + subdi + "', '" + lang + "', '" + initial + "')", 9000);
                makeTableScroll();
                
            },
            error: function (err) {
                $("#papar").html("Error viewing data!");
                var t = setTimeout("ulangPanggil('" + hfccd + "', '" + discp + "', '" + subdi + "', '" + lang + "', '" + initial + "')", 9000);
            }
        });
    }
    function ulangPanggil2(hfccd, discp, subdi, lang, initial) {
        $.ajax({
            url: "caller2.jsp",
            type: 'POST',
            data: {
                hfccd: hfccd,
                discp: discp,
                subdi: subdi,
                lang: lang,
                initial: initial
            },
            timeout: 60000,
            success: function (data) {
                $("#papar2").html(data);
                var t = setTimeout("ulangPanggil2('" + hfccd + "', '" + discp + "', '" + subdi + "', '" + lang + "', '" + initial + "')", 16000);
                makeTableScroll();
            },
            error: function (err) {
                $("#papar2").html("Error viewing data!");
                var t = setTimeout("ulangPanggil2('" + hfccd + "', '" + discp + "', '" + subdi + "', '" + lang + "', '" + initial + "')", 16000);
            }
        });
    }
    $(document).ready(function () {

    <%
        try {
            hfccd1 = request.getParameter("hfccd");
            discp1 = request.getParameter("discp");
            subdi1 = request.getParameter("subdi");
            lang1 = request.getParameter("lang");
            initial1 = request.getParameter("initial");
    %>
        ulangPanggil('<%=hfccd1%>', '<%=discp1%>', '<%=subdi1%>', '<%=lang1%>', '<%=initial1%>');
        ulangPanggil2('<%=hfccd1%>', '<%=discp1%>', '<%=subdi1%>', '<%=lang1%>', '<%=initial1%>');

    <%
        } catch (Exception e2) {
        }
    %>

        $("#tapis").click(function () {

            var hfccd = $("#hfccd").val();
            var discp = $("#discp").val();
            var subdi = $("#subdi").val();
            var lang = document.querySelector('input[name="pilih"]:checked').value;
            var initial = $("#initial").val();

            location.href = 'index.jsp?hfccd=' + hfccd + '&discp=' + discp + '&subdi=' + subdi + '&lang=' + lang + '&initial=' + initial;

        });

        $("#acceptSettingBtn").click(function () {
            $("#callingSetting").hide();
            $(".modal-backdrop").hide();
        });

        var filterType = "<%=filterType%>";
        console.log(filterType);
        if (filterType === "1") {
            $('#divSubDis').hide();
        } else if (filterType === "0") {
            $('#divSubDis').show();
        }
    });
    $("#discp").on('change', function () {

        var hfc = "<%=health_facility_code%>";
        var dis = $(this).val();
        var data = {"hfc": hfc,
            "discipline": dis};
        $.ajax({
            type: "post",
            url: "findSub.jsp",
            data: data,
            success: function (databack) {
                $("#divSelectSub").html(databack);
            }
        });
        console.log(data);
    });
    
    
</script>
<script>
		    flag = true;
			timer = '';
			setInterval(function(){phpJavascriptClock();},1000);

			function phpJavascriptClock()
			{
//				if ( flag ) {
//					timer =1000;
//				}
				var d = new Date();
				months = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec');

				month_array = new Array('January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'Augest', 'September', 'October', 'November', 'December');

				currentYear = d.getFullYear();
				month = d.getMonth();
				var currentMonth = months[month];
				var currentMonth1 = month_array[month];
				var currentDate = d.getDate();
				currentDate = currentDate < 10 ? '0'+currentDate : currentDate;

				var hours = d.getHours();
				var minutes = d.getMinutes();
				var seconds = d.getSeconds();

				var ampm = hours >= 12 ? 'PM' : 'AM';
				hours = hours % 12;
				hours = hours ? hours : 12; // the hour ?0' should be ?12'
				minutes = minutes < 10 ? '0'+minutes : minutes;
				seconds = seconds < 10 ? '0'+seconds : seconds;
				var strTime = hours + ':' + minutes+ ':' + seconds + ' ' + ampm;
//				document.getElementById("demo").innerHTML= currentMonth+' ' + currentDate+' , ' + currentYear + ' ' + strTime ;
//
//				document.getElementById("demo1").innerHTML= currentMonth1+' ' + currentDate+' , ' + currentYear + ' ' + strTime ;
//
//				document.getElementById("demo2").innerHTML= currentDate+':' +month+':' +currentYear + ' ' + strTime ;
//
//				document.getElementById("demo3").innerHTML= strTime ;
                                
                                var msg = "<span style='display: block; font-size: 34px; margin-bottom: -10px; font-weight: 300;' >"+currentDate+"/"+currentMonth1+"/"+currentYear+"</span>"+strTime;
                                $('#spanTarikh').html(msg);
                                console.log($.now());
				flag = false;
				timer = timer + 1000;
			}

</script>
</body>