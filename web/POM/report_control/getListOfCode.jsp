<%-- 
    Document   : getListOfCode
    Created on : Oct 20, 2017, 4:24:56 PM
    Author     : user
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    Conn con = new Conn();
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> logo = con.getData(hfc_logo);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    
    
    String query ="select ifnull(cp2.`PROCEDURE_2_CD`, ifnull(cp1.`PROCEDURE_1_CD`, cp.`PROCEDURE_CD`)) as code, "// 4             5
            + "cp.`PROCEDURE_NAME`, ifnull(cp1.`PROCEDURE_1_NAME`, ''), ifnull(cp2.`PROCEDURE_2_NAME`, ''), cp.selling_price, cp.buying_price "
            + "from cis_procedure cp "
            + "left join cis_procedure_1 cp1 on cp1.`PROCEDURE_CD` = cp.`PROCEDURE_CD` and cp1.hfc_cd = cp.hfc_cd "
            + "left join cis_procedure_2 cp2 on cp2.`PROCEDURE_1_CD` = cp1.`PROCEDURE_1_CD` and cp2.hfc_cd = cp1.hfc_cd "
            + "where cp.hfc_cd = '"+hfc_cd+"' order by cp.procedure_name, cp1.procedure_1_name, cp2.procedure_2_name;";
    
    ArrayList<ArrayList<String>> dataPom = con.getData(query);
        
      
%>
<table id="procedure"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Procedure Code</th>
            <th>Procedure Name</th>
            <th>Selling Price</th>
            <th>Buying Price</th>
        </tr>
    </thead>
    <tbody>
        <%
             for(int i=0; i<dataPom.size(); i++){

                String proName="";
                proName = dataPom.get(i).get(1);
                if(!dataPom.get(i).get(2).equalsIgnoreCase("")){
                    proName += "-"+dataPom.get(i).get(2);
                    if(!dataPom.get(i).get(3).equalsIgnoreCase("")){
                        proName += "-"+dataPom.get(i).get(3);
                    }// end if level 3
                }// end if level 2
                
        %>
        <tr>
            <td><%=dataPom.get(i).get(0)%></td>
            <td><%=proName%></td>
            <td><%=dataPom.get(i).get(4)%></td>
            <td><%=dataPom.get(i).get(5)%></td>
        </tr>
        <%

            }// end for 
        %>
    </tbody>
</table>
<script>

    $(document).ready(function () {

        $('#procedure').DataTable({
            order: [] ,
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
                                        <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">List of Procedure</div>\n\
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