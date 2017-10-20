<%-- 
    Document   : getListOfOrderDetail
    Created on : Oct 19, 2017, 5:15:49 AM
    Author     : user
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> logo = con.getData(hfc_logo);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    

    String date = request.getParameter("date");
    String status = request.getParameter("status");
    String timeFrame = request.getParameter("timeFrame");
    
    String whereCondition="", tabStat="";
   
    if(status.equalsIgnoreCase("0")){
        whereCondition=" AND pos_order_master.order_no in "
                + "(SELECT order_no FROM pos_order_detail "
                + "GROUP BY order_no HAVING sum(order_status <> '0') = 0) ";
        tabStat="Pending";
    }
    else if(status.equalsIgnoreCase("1")){
        whereCondition=" AND pos_order_master.order_no in "
                + "(SELECT order_no FROM pos_order_detail "
                + "GROUP BY order_no HAVING sum(order_status = '0') > 0 AND sum(order_status = '2')>0 ) ";
        tabStat="In progress";
    }
    else if(status.equalsIgnoreCase("2")){
        whereCondition=" AND pos_order_master.order_status='2' ";
        
        tabStat="Complete";
    }
    else if(status.equalsIgnoreCase("3")){
        whereCondition=" AND pos_order_master.order_status='3' ";
        
        tabStat="Cancel";
    }
    
    //                                      0                           1                           2                       3                         4                             5                            
     String sql = "SELECT pos_order_master.pmi_no, pos_order_master.order_no, pos_order_master.hfc_cd, pos_order_master.episode_date, pos_order_master.encounter_date, date_format(pos_order_master.order_date, '%d/%m/%Y'), "
                //  6                                          
                + "pos_order_master.order_status, "
                //   7                                              8
                + "pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO "
                + "FROM pos_order_master  "
                + "LEFT JOIN pms_patient_biodata ON (pos_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
                + "WHERE pos_order_master.hfc_to = '" + hfc_cd + "' AND date_format(pos_order_master.order_date, '"+timeFrame+"')='"+date+"' "+whereCondition;
        ArrayList<ArrayList<String>> dataOrder = con.getData(sql);
%>
<table id="tableOrderDetail"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Order No</th>
            <th>Episode Date</th>
            <th>Order Date</th>
            <th>Patient PMI</th>
            <th>Patient Name</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>

        <%
            for (int i = 0; i < dataOrder.size(); i++) {
                               
        %>
        <tr>
            <td><%=dataOrder.get(i).get(1)%></td>
            <td><%=dataOrder.get(i).get(3)%></td>
            <td><%=dataOrder.get(i).get(5)%></td>
            <td><%=dataOrder.get(i).get(0)%></td>
            <td><%=dataOrder.get(i).get(7)%></td>
            <td><%=tabStat%></td>
         </tr>
        <%
              
            }
        %>
    </tbody>
</table>
    
<script>

    //$('#tableOrder').DataTable("destroy");

    $('#tableOrderDetail').DataTable({
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
    <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Procedure List of Order</div>\n\
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

    
</script>