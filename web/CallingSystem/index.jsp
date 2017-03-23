
<%@page import="java.util.ArrayList"%>
<%@page import="models.Query"%>

<%
    String sqlx1 = "SELECT * FROM health_facility_code";
    Query qx1 = new Query();
    ArrayList<ArrayList<String>> dx1 = qx1.getQuery(sqlx1);

    String sqlx2 = "SELECT * FROM discipline_code";
    Query qx2 = new Query();
    ArrayList<ArrayList<String>> dx2 = qx2.getQuery(sqlx2);

    String sqlx3 = "SELECT * FROM sub_discipline_code";
    Query qx3 = new Query();
    ArrayList<ArrayList<String>> dx3 = qx3.getQuery(sqlx3);

    String hfccd1 = "";
    String discp1 = "";
    String subdi1 = "";
    try {
        hfccd1 = request.getParameter("hfccd");
        discp1 = request.getParameter("discp");
        subdi1 = request.getParameter("subdi");
    } catch (Exception e3) {
    }
%>

<!-- header -->
<%@include file = "../assets/header.html" %>
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

                    <div class="thumbnail">
                        <h4>
                            Calling System Lists
                            <ul id="menu-content" class="soap-content nav" style="float: right;">
                                <li data-toggle="collapse" data-target="#filter" class="soap-select collapsed" aria-expanded="false">
                                    <i class="fa fa-filter fa-lg filter" style="cursor: pointer; color: #ccc; float: right; padding: 0 10px;"></i>
                                </li>
                            </ul>
                        </h4>
                        <hr/>
                        <ul class="collapse" id="filter" aria-expanded="false" style="height: 0px;">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Search Health Facility</label>
                                    <div class="col-md-4">
                                        <select id="hfccd" class="form-control">
                                            <option value="">-- Select health facility --</option>
                                            <% for (int i = 0; i < dx1.size(); i++) {%>
                                            <option value="<%=dx1.get(i).get(0)%>" <% try {
                                                    if (hfccd1.equals(dx1.get(i).get(0))) {
                                                        out.print("selected");
                                                    }
                                                } catch (Exception ef1) {
                                                }%>><%=dx1.get(i).get(1)%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Search Discipline</label>
                                    <div class="col-md-4">
                                        <select id="discp" class="form-control">
                                            <option value="">-- Select discipline --</option>
                                            <% for (int i = 0; i < dx2.size(); i++) {%>
                                            <option value="<%=dx2.get(i).get(0)%>" <% try {
                                                    if (discp1.equals(dx2.get(i).get(0))) {
                                                        out.print("selected");
                                                    }
                                                } catch (Exception ef2) {
                                                }%>><%=dx2.get(i).get(1)%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Search Sub-Discipline</label>
                                    <div class="col-md-4">
                                        <select id="subdi" class="form-control">
                                            <option value="">-- Select sub-discipline --</option>
                                            <% for (int i = 0; i < dx3.size(); i++) {%>
                                            <option value="<%=dx3.get(i).get(0)%>" <% try {
                                                    if (subdi1.equals(dx3.get(i).get(0))) {
                                                        out.print("selected");
                                                    }
                                                } catch (Exception ef3) {
                                                }%>><%=dx3.get(i).get(1)%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success" id="tapis"><i class="fa fa-filter"></i>&nbsp; Filter</button>
                                <button class="btn btn-default" id="clear">Clear</button>
                            </div>
                            <hr/>
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
                var t = setTimeout("ulangPanggil('" + hfccd + "', '" + discp + "', '" + subdi + "')", 1000);
            },
            error: function (err) {
                $("#papar").html("Error viewing data!");
                var t = setTimeout("ulangPanggil('" + hfccd + "', '" + discp + "', '" + subdi + "')", 1000);
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