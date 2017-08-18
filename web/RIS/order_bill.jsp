<%-- 
    Document   : order_time
    Created on : Aug 16, 2017, 10:52:18 AM
    Author     : user
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>


<div class="table-guling" id="orderTable">
    <%  Conn conn = new Conn();
        String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        out.print(my_1_hfc_cd);
        String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + my_1_hfc_cd + "'";
        ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_logo);

        String get_bill = request.getParameter("get_bill");
        out.print(get_bill);
        //out.print(masterCode);
        LocalDate localDate = LocalDate.now();
        String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
        String query1 ="";
        String full = "SELECT rod.order_no,rpm.body_system_cd, bs.body_system_name,rpm.modality_cd, md.modality_name, rpm.ris_procedure_name,rpm.selling_price,rpm.buying_price,rpm.quantity,rpm.status "
                    + "FROM ris_procedure_master rpm "
                    + "join ris_body_system bs on bs.hfc_cd=rpm.hfc_cd and bs.body_system_cd=rpm.body_system_cd "
                    + "join ris_modality md on md.hfc_cd=rpm.hfc_cd and md.modality_cd=rpm.modality_cd "
                    + "join ris_order_detail rod on rod.procedure_cd=rpm.ris_procedure_cd "
                    + "join ris_order_master rom on rom.order_no = rod.order_no ";

        if ((get_bill.equalsIgnoreCase("today"))) {
            query1 = full+"WHERE rpm.hfc_cd = '" + my_1_hfc_cd + "' AND DATE_FORMAT(lom.order_date, '%Y-%m-%d') = CURDATE() GROUP BY lom.order_no DESC ;";
        } else if ((get_bill.equalsIgnoreCase("month"))) {
            out.print("test");
            query1 = full+"WHERE rpm.hfc_cd = '04010101' AND MONTH(DATE_FORMAT(rom.order_date, '%Y-%m-%d')) = MONTH(CURRENT_DATE()) GROUP BY rom.ORDER_NO DESC ;";
        } else if ((get_bill.equalsIgnoreCase("year"))) {
            query1 = full+"WHERE rpm.hfc_cd = '" + my_1_hfc_cd + "' AND YEAR(DATE_FORMAT(rom.order_date, '%Y-%m-%d')) = YEAR(CURRENT_DATE()) GROUP BY rom.order_no DESC ;";
        }
        double grand_total_price = 0;
        double grand_total_service = 0;
        ArrayList<ArrayList<String>> q1 = conn.getData(query1);
    %>

    <table id="OS"  class="table table-striped table-bordered" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th >Order No</th>
                <th >Pmi No</th>
                <th >HFC Name</th>
                <th >Episode Date</th>
                <th >Encounter Date</th>
                <th >Created By</th>
                <th> Patient Name</th>
                <th> Buy Price</th>
                <th> Service Price</th>
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
                <td><%=q1.get(i).get(7)%></td>
                <td><%=q1.get(i).get(9)%></td>
                <td><%=q1.get(i).get(10)%></td>
            </tr>
            <% }
                }
            %>
        </tbody>
    </table>

</div>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {


        $('#OS').DataTable({
            language: {
                emptyTable: "No receive specimen for today"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            },
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


