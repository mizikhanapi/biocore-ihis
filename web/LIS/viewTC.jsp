<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<div class="loading" style="display: none;"></div>
<div class="table-guling">
    <%
        Conn conn = new Conn();
        String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + my_1_hfc_cd + "'";
        ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
        String masterCode = request.getParameter("process");
        LocalDate localDate = LocalDate.now();
        String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
        String query1 = "";
        if(!(masterCode.equals("all")))
        {
             query1= "select item_cd,test_cat,item_name,spe_source,spe_container,volume,special_inst,status,buy_price,ser_price from lis_item_detail where hfc_cd = '" + my_1_hfc_cd + "' and test_cat='" + masterCode + "'";
        }
        else
        {
             query1= "select item_cd,test_cat,item_name,spe_source,spe_container,volume,special_inst,status,buy_price,ser_price from lis_item_detail where hfc_cd = '" + my_1_hfc_cd + "'";   
        }
        
        ArrayList<ArrayList<String>> q1 = conn.getData(query1);
    %>

    <table id="TC"  class="table table-striped table-bordered" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th class="col-sm-1">Item code</th>
                <th class="col-sm-1">Category code</th>
                <th class="col-sm-1">Item name</th>
                <th class="col-sm-1">Specimen source</th>
                <th class="col-sm-1">Specimen container</th>
                <th class="col-sm-1">Volume</th>
                <th class="col-sm-1">Special instruction</th>
                <th class="col-sm-1">Status</th>
                <th class="col-sm-1">Buying price</th>
                <th class="col-sm-1">Service price</th>
            </tr>
        </thead>
        <tbody>

            <%
                if (q1.size() > 0) {
                    for (int i = 0; i < q1.size(); i++) {

            %>
            <tr>
                <td><%=q1.get(i).get(0)%></td>
                <td><%=q1.get(i).get(1)%></td>
                <td><%=q1.get(i).get(2)%></td>
                <td><%=q1.get(i).get(3)%></td>
                <td><%=q1.get(i).get(4)%></td>
                <td><%=q1.get(i).get(5)%></td>
                <td><%=q1.get(i).get(6)%></td>
                <td><%=q1.get(i).get(7)%></td>
                <td><%=q1.get(i).get(8)%></td>
                <td><%=q1.get(i).get(9)%></td>
            </tr>
            <% }
                }
            %>
        </tbody>
    </table>
</div>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        $('#TC').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csv', 'excel', 'pdf',
                {
                    extend: 'print',
                    title: $('h1').text(),
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Laporan ICD10</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                    }
                }

            ]
        });
    });
</script>
