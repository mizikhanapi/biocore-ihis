
<%@page import="java.util.ArrayList"%>
<%@page import="models.Query"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%//@include file="../Entrance/validateSession.jsp"%>

<%
    String gamba = "";
    String nama = "";
    String role = "";
    String namaHfc = "";
    Conn conn = new Conn();

    if (session.getAttribute("USER_NAME") != null) {

        gamba = session.getAttribute("PICTURE").toString();
        nama = session.getAttribute("USER_NAME").toString();
        role = session.getAttribute("ROLE_NAME").toString();
        namaHfc = session.getAttribute("HFC_NAME").toString();

    }

    RMIConnector rmic = new RMIConnector();

    String sqlHFC = "SELECT ahd.hfc_cd,ahd.discipline_cd,ahd.subdiscipline_cd,ahf.hfc_name FROM adm_hfc_discipline ahd, adm_health_facility ahf WHERE ahd.hfc_cd = ahf.hfc_cd AND ahf.hfc_name='" + namaHfc + "'";
    ArrayList<ArrayList<String>> dataHFC = conn.getData(sqlHFC);

    String hfc_cd = "SELECT hfc_cd,logo FROM adm_health_facility WHERE hfc_name='" + namaHfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);

    String sql_dis = "SELECT ad.discipline_cd,ad.discipline_name FROM adm_discipline ad, adm_hfc_discipline ahd WHERE  ahd.discipline_cd = ad.discipline_cd AND ahd.hfc_cd = '" + mysqlhfc_cd.get(0).get(0) + "' GROUP BY ad.discipline_cd";
    ArrayList<ArrayList<String>> sql_discipline = conn.getData(sql_dis);

    //String sqldiscipline = "SELECT ahd.discipline_cd,ahd.subdiscipline_cd,ad.discipline_name FROM adm_discipline ad, adm_hfc_discipline ahd WHERE ad.discipline_cd = ahd.discipline_cd AND ahd.hfc_cd = '"+mysqlhfc_cd.get(0).get(0)+"'"; 
    String sql_subDis = "SELECT asd.subdiscipline_cd,asd.subdiscipline_name FROM adm_discipline ad, adm_subdiscipline asd, adm_hfc_discipline ahd WHERE  ahd.discipline_cd = ad.discipline_cd AND ad.discipline_cd = asd.discipline_cd AND ahd.hfc_cd = '" + mysqlhfc_cd.get(0).get(0) + "' GROUP BY subdiscipline_name";
    ArrayList<ArrayList<String>> sql_Subdiscipline = conn.getData(sql_subDis);

    String hfccd1 = "";
    String discp1 = "";
    String subdi1 = "";
    try {

        hfccd1 = dataHFC.get(0).get(0);
        discp1 = dataHFC.get(0).get(1);
        subdi1 = dataHFC.get(0).get(2);

    } catch (Exception e3) {
    }

%>

<!-- header -->
<%@include file = "../assets/header.html" %>
<style>
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

<!-- menu top -->
<%@include file = "libraries/topMenus-dashboard.html" %>
<!-- menu top -->

<div class="container-fluid m-scene">
    <div class="row">       

        <!-- main -->		
        <div class="col-md-12 main-dashboard" style="background: #f2f4f8;">

            <div class="row">
                <div class="col-md-12">

                    <div class="thumbnail" style="padding: 30px 0px; padding: 30px 0px;height: 90vh;overflow: hidden;">
                        <div style="position: absolute; text-align: center; display: inline-block; top: 50%; width: 100%; color: #ffffff; opacity: 0.2;">
                            <img src="<%=mysqlhfc_cd.get(0).get(1)%>" /> 
                        </div>
                        <div class="nav navbar-nav dashboard" style="display: block; top: 30px;">
                            <div style=" display: block; font-size: 22px; text-align: center;">
                                <span style="font-size: 22px; font-weight: 300;"><i class="fa fa-hospital-o fa-lg" style="color: #999; font-size: 45px;"></i></span>
                            </div>
                        </div>
                        <h2 style="font-weight: 300; text-transform: uppercase; margin-top: 50px; padding:0px 30px; text-align: center;">
                            Welcome to <span style="font-weight: 500; color: #2196f3;"><%= namaHfc%></span>
                            <ul id="menu-content" class="soap-content nav" style="float: right;">
                                <li data-toggle="collapse" data-target="#filter" class="soap-select collapsed" aria-expanded="false">
                                    <i class="fa fa-ellipsis-v fa-lg filter" style="cursor: pointer; color: #ccc; float: right;"></i>                                    
                                </li>
                            </ul>
                        </h2>
                        <input type="text" id="hfccd" name="hfccd" value="<%=hfccd1%>" style=" display: none;">  
                        <hr class="pemisah" />
                        <ul class="collapse" id="filter" aria-expanded="false" style="height: 0px; padding-left: 0px;">
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
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Search Sub-Discipline</label>
                                    <div class="col-md-4">
                                        <select id="subdi" class="form-control">
                                            <option value="">-- Select sub-discipline --</option>
                                            <%
                                                if (sql_Subdiscipline.size() > 0) {
                                                    for (int i = 0; i < sql_Subdiscipline.size(); i++) {

                                            %>
                                            <option value="<%=sql_Subdiscipline.get(i).get(0)%>"><%=sql_Subdiscipline.get(i).get(1)%></option>
                                            <%}
                                                }%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success" id="tapis"><i class="fa fa-filter"></i>&nbsp; Filter</button>
                                <button class="btn btn-default" id="clear">Clear</button>
                            </div>
                            <hr class="pemisah" />
                        </ul>

                        <div id="papar">
                            <p>.. Preparing ...</p>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- main -->

    </div>
</div>

<script src="assets/js/jquery-3.1.1.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.js" type="text/javascript"></script>
<script>
    function ulangPanggil(hfccd, discp, subdi) {
        $.ajax({
            url: "caller.jsp",
            type: 'POST',
            data: {
                hfccd: hfccd,
                discp: discp,
                subdi: subdi
            },
            timeout: 60000,
            success: function (data) {
                $("#papar").html(data);
                var t = setTimeout("ulangPanggil('" + hfccd + "', '" + discp + "', '" + subdi + "')", 8000);
            },
            error: function (err) {
                $("#papar").html("Error viewing data!");
                var t = setTimeout("ulangPanggil('" + hfccd + "', '" + discp + "', '" + subdi + "')", 8000);
            }
        });
    }
    $(document).ready(function () {

    <%
        try {
            hfccd1 = request.getParameter("hfccd");
            discp1 = request.getParameter("discp");
            subdi1 = request.getParameter("subdi");
    %>
        ulangPanggil('<%=hfccd1%>', '<%=discp1%>', '<%=subdi1%>');
    <%
        } catch (Exception e2) {
        }
    %>

        $("#tapis").click(function () {

            var hfccd = $("#hfccd").val();
            var discp = $("#discp").val();
            var subdi = $("#subdi").val();

            location.href = 'index.jsp?hfccd=' + hfccd + '&discp=' + discp + '&subdi=' + subdi;
        });

        $("#clear").click(function () {
            location.href = 'index.jsp';
        });
    });
</script>