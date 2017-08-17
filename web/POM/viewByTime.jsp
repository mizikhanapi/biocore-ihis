
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
        String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
        ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_logo);

        String masterCode = request.getParameter("process");
        String get_time = request.getParameter("get_time");
        
        //String masterCode = "2";
        //String get_time = "month";
        
        //out.print(get_time + " " + masterCode);
        //out.print(masterCode);
        LocalDate localDate = LocalDate.now();
        String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
        String status = "";
        
        
        
        if ((get_time.equals("today"))) {
            if ((masterCode.equals("0"))) {
                status = "AND ris_order_master.order_status = '0' AND ris_order_master.hfc_cd = '" + hfc + "' AND DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d') = CURDATE() GROUP BY ris_order_master.order_no DESC";
            } else if ((masterCode.equals("2"))) {
                status = "AND ris_order_master.order_status = '2' AND ris_order_master.hfc_cd = '" + hfc + "' AND DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d') = CURDATE() GROUP BY ris_order_master.order_no DESC";
            } else if ((masterCode.equals("3"))) {
                status = "AND ris_order_master.order_status = '3' AND ris_order_master.hfc_cd = '" + hfc + "' AND DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d') = CURDATE() GROUP BY ris_order_master.order_no DESC";
            }
        }else if((get_time.equals("month"))) {
             if ((masterCode.equals("0"))) {
                status = "AND ris_order_master.order_status = '0' AND ris_order_master.hfc_cd = '" + hfc + "' AND MONTH(DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d')) = MONTH(CURRENT_DATE()) GROUP BY ris_order_master.order_no DESC";
             } else if ((masterCode.equals("2"))) {
                status = "AND ris_order_master.order_status = '2' AND ris_order_master.hfc_cd = '" + hfc + "' AND MONTH(DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d')) = MONTH(CURRENT_DATE()) GROUP BY ris_order_master.order_no DESC";
             } else if ((masterCode.equals("3"))) {
                status = "AND ris_order_master.order_status = '3' AND ris_order_master.hfc_cd = '" + hfc + "' AND MONTH(DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d')) = MONTH(CURRENT_DATE()) GROUP BY ris_order_master.order_no DESC";
             }
        }else if((get_time.equals("year"))) {
             if ((masterCode.equals("0"))) {
                status = "AND ris_order_master.order_status = '0' AND ris_order_master.hfc_cd = '" + hfc + "' AND YEAR(DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d')) = YEAR(CURRENT_DATE()) GROUP BY ris_order_master.order_no DESC";
            } else if ((masterCode.equals("2"))) {
                status = "AND ris_order_master.order_status = '2' AND ris_order_master.hfc_cd = '" + hfc + "' AND YEAR(DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d')) = YEAR(CURRENT_DATE()) GROUP BY ris_order_master.order_no DESC";
            } else if ((masterCode.equals("3"))) {
                status = "AND ris_order_master.order_status = '3' AND ris_order_master.hfc_cd = '" + hfc + "' AND YEAR(DATE_FORMAT(ris_order_master.order_date, '%Y-%m-%d')) = YEAR(CURRENT_DATE()) GROUP BY ris_order_master.order_no DESC";
            }
        }
        
        String query1 = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,"
                //  6                                           7                       8                           9                   10                                  11                  12                      
                + "ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,"
                //  13                                          14                              15                                  16                          17
                + "pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, "
                //  18                  19              20
                + "sx.description, blot.description, hfc.hfc_name "
                + "FROM ris_order_master "
                + "LEFT JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
                + "LEFT JOIN adm_lookup_detail sx on pms_patient_biodata.SEX_CODE = sx.detail_reference_code AND sx.master_reference_code = '0041' AND sx.hfc_cd = ris_order_master.hfc_cd "
                + "LEFT JOIN adm_lookup_detail blot on pms_patient_biodata.BLOOD_TYPE = blot.detail_reference_code AND blot.master_reference_code = '0074' AND blot.hfc_cd = ris_order_master.hfc_cd "
                + "Left JOIN adm_health_facility hfc on hfc.hfc_cd = ris_order_master.hfc_cd "
                + "WHERE ris_order_master.order_no in (select distinct(order_no) from ris_order_detail )"
                + status + " ;";
        ArrayList<ArrayList<String>> q1 = conn.getData(query1);
    %>

    <table id="OS"  class="table table-striped table-bordered" cellspacing="0" width="100%">

        <thead>
            <tr>
                <th >Order No</th>
                <th >PMI No</th>
                <th >HFC Name</th>
                <th >Episode Date</th>	 
                <th >Encounter Date</th>
                <th >Created By</th>
                <th >Patient Name</th>
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

