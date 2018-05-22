<%-- 
    Document   : getListOfStaffPerfomance
    Created on : May 18, 2018, 5:55:14 PM
    Author     : user
--%>

<%@page import="Formatter.FormatTarikh"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String timeFrame = request.getParameter("timeFrame");
    String strName = request.getParameter("strName");
    String dateFrom = request.getParameter("from");
    String dateTo = request.getParameter("to");

    String sqlWhen = "";

    if (!timeFrame.equalsIgnoreCase("all") && !timeFrame.equalsIgnoreCase("x")) {
        sqlWhen = " and (date(pro.encounter_date) between curdate()- interval " + timeFrame + " day and curdate()) ";
    } else if (timeFrame.equalsIgnoreCase("x")) {
        dateFrom = FormatTarikh.formatDate(dateFrom, "dd/MM/yyyy", "yyyy-MM-dd");
        dateTo = FormatTarikh.formatDate(dateTo, "dd/MM/yyyy", "yyyy-MM-dd");
        sqlWhen = " and (date(pro.encounter_date) between date('" + dateFrom + "') and date('" + dateTo + "')) ";
    }
    
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

    String logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> logo_hfc = con.getData(logo);

    //                                      0                                       1                           2               3           4                     5                         6
    String query = "SELECT date_format(encounter_date, '%d/%m/%Y'), date_format(encounter_date, '%H:%i'), bio.`PATIENT_NAME`, pro.pmi_no, pro.procedure_name, pro.doctor_name, ifnull(pro.procedure_outcome, '-')  "
            + "FROM lhr_procedure pro "
            + "JOIN pms_patient_biodata bio ON bio.`PMI_NO`=pro.pmi_no "
            + "WHERE pro.hfc_cd='04010101' "+sqlWhen;
    ArrayList<ArrayList<String>> dataSale = con.getData(query);

    int intTotal = 0;

%>
<h3 id="theTitle"><%=strName%> Performed Procedure</h3>
<table id="tableSale"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th >Date</th>
            <th >Time</th>
            <th >Patient</th>
            <th >PMI No.</th>
            <th >Procedure</th>
            <th >Performed By</th>
            <th >Outcome</th>
        </tr>
    </thead>
    <tbody>

        <%
            intTotal = dataSale.size();
            for (int i = 0; i < dataSale.size(); i++) {%>
        <tr style="cursor: pointer;">
            <td><%=dataSale.get(i).get(0)%></td>
            <td><%=dataSale.get(i).get(1)%></td>
            <td><%=dataSale.get(i).get(2)%></td>
            <td><%=dataSale.get(i).get(3)%></td>
            <td><%=dataSale.get(i).get(4)%></td>
            <td><%=dataSale.get(i).get(5)%></td>
            <td><%=dataSale.get(i).get(6)%></td>
        </tr>
        <%
            }
        %>
    </tbody>

</table>
<div class="pull-right">
    <div style="text-align: left;">
        <p class="bold">Total Performed Procedure: <span id="theQuantity"><%= intTotal%></span></p>
    </div>        
</div>    
<script type="text/javascript">
    $('#tableSale').DataTable({
        pageLength: 15,
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
            <img src="<%=logo_hfc.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><%=strName%> List of Performed Procedure</div>\n\
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
                            .css('font-weight', 'bolder')
                            .append('<div style="text-align: right;padding-top:10px;"><br>Total Performed Procedure : <%=intTotal%></div>');
                    $(win.document.body)
                            .css('font-size', '10pt')
                            .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                }
            }

        ]
    });


</script>