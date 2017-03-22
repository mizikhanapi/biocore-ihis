
<%@page import="java.util.ArrayList"%>
<%@page import="models.Query"%>
<script src="assets/js/jquery-3.1.1.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.js" type="text/javascript"></script>

<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>

<div class="row">
    <div class="col-md-12" style="background-color: rgba(0,100,255, 0.2); height: 13%;">
        <center>
            <h1>Clinical Support System Calling System</h1>
        </center>
    </div>
</div>

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

<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <br />
        <br />
        <div class="col-md-2">Search Health Facility : </div>
        <div class="col-md-2">
            <select id="hfccd" class="form-control">
                <option value="">-- Select health facility --</option>
                <% for (int i = 0; i < dx1.size(); i++) { %>
                <option value="<%=dx1.get(i).get(0) %>" <% try { if (hfccd1.equals(dx1.get(i).get(0))) { out.print("selected"); } } catch (Exception ef1) {} %>><%=dx1.get(i).get(1) %></option>
                <% } %>
            </select>
        </div>
        <div class="col-md-2">Search Discipline : </div>
        <div class="col-md-2">
            <select id="discp" class="form-control">
                <option value="">-- Select discipline --</option>
                <% for (int i = 0; i < dx2.size(); i++) { %>
                <option value="<%=dx2.get(i).get(0) %>" <% try { if (discp1.equals(dx2.get(i).get(0))) { out.print("selected"); } } catch (Exception ef2) {} %>><%=dx2.get(i).get(1) %></option>
                <% } %>
            </select>
        </div>
        <div class="col-md-2">Search Sub-Discipline : </div>
        <div class="col-md-2">
            <select id="subdi" class="form-control">
                <option value="">-- Select sub-discipline --</option>
                <% for (int i = 0; i < dx3.size(); i++) { %>
                <option value="<%=dx3.get(i).get(0) %>" <% try { if (subdi1.equals(dx3.get(i).get(0))) { out.print("selected"); } } catch (Exception ef3) {} %>><%=dx3.get(i).get(1) %></option>
                <% } %>
            </select>
        </div>
            <div class="col-md-12">
                <br />
                <br />
                <center>
                    <button class="btn btn-success" id="tapis"> &nbsp;&nbsp;&nbsp; Filter &nbsp;&nbsp;&nbsp; </button>
                    <button class="btn btn-warning" id="clear"> &nbsp;&nbsp;&nbsp; Clear &nbsp;&nbsp;&nbsp; </button>
                </center>
            </div>
    </div>
</div>

<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <br />
        <br />
        <center id="papar">
            .. Preparing ...
        </center>
    </div>
</div>

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
                var t = setTimeout("ulangPanggil('"+hfccd+"', '"+discp+"', '"+subdi+"')", 1000);
            },
            error: function (err) {
                $("#papar").html("Error viewing data!");
                var t = setTimeout("ulangPanggil('"+hfccd+"', '"+discp+"', '"+subdi+"')", 1000);
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
        ulangPanggil('<%=hfccd1 %>', '<%=discp1 %>', '<%=subdi1 %>');
        <% 
        } catch (Exception e2) {
        }
        %>
        
        $("#tapis").click(function () {
            
            var hfccd = $("#hfccd").val();
            var discp = $("#discp").val();
            var subdi = $("#subdi").val();
            
            location.href = 'index.jsp?hfccd='+hfccd+'&discp='+discp+'&subdi='+subdi;
        });
        
        $("#clear").click(function () {
            location.href = 'index.jsp';
        });
    });
</script>