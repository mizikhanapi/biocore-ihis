<%-- 
    Document   : ICD10Report
    Created on : Mar 12, 2017, 6:00:15 PM
    Author     : user
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<hr class="pemisah"/>


<%
    Conn conn = new Conn();
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String disp = request.getParameter("disp");
    String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    String discipline = "";

    if (!disp.equalsIgnoreCase("all")) {
        String dis_name_query = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + my_1_hfc_cd + "' and discipline_cd = '" + disp + "'";
        ArrayList<ArrayList<String>> mysqldis_name = conn.getData(dis_name_query);
        discipline = mysqldis_name.get(0).get(1);
    } else {
        discipline = "ALL";
    }
    //AND diagnosis.`HFC_Cd`='"+my_1_hfc_cd+"'


%>

<table id="ICD10Table" class="table table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>


    <th> Chapter Code </th>
    <th> Chapter Name </th>
    <th> Block Code</th>
    <th> Block Name </th>
    <th> ICD10 Code </th>
    <th> Description</th>
    <th> Total Case </th>
    <th>Total Male</th>
    <th>Total Female</th>
    <th>Total Others</th>

    <%        String where = "";
        ArrayList<ArrayList<String>> icd10 = new ArrayList<ArrayList<String>>();
        ArrayList<String> block = new ArrayList<String>();
        ArrayList<String> chapter = new ArrayList<String>();
        ArrayList<Integer> indexToDelete = new ArrayList<Integer>();
        if (disp.equals("All")) {
            //where = " WHERE Episode_Date BETWEEN '" + startDate + "' AND '" + endDate + "' AND HFC_Cd='" + my_1_hfc_cd + "' GROUP BY diagnosis_cd ORDER BY diagnosis_cd ASC";
            where = "WHERE l.Episode_Date BETWEEN '" + startDate + "' AND '" + endDate + "' AND l.HFC_Cd='" + my_1_hfc_cd + "' and l.pmi_no = p.pmi_no GROUP BY diagnosis_cd order by l.pmi_no";

        } else {
            //where = " WHERE Episode_Date BETWEEN '" + startDate + "' AND '" + endDate + "' AND HFC_Cd='" + my_1_hfc_cd + "' AND Centre_Code = '" + disp + "' GROUP BY diagnosis_cd ORDER BY diagnosis_cd ASC";
            where = "WHERE l.Episode_Date BETWEEN '" + startDate + "' AND '" + endDate + "' AND l.HFC_Cd='" + my_1_hfc_cd + "' AND l.discipline_cd = '" + disp + "' and l.pmi_no = p.pmi_no GROUP BY diagnosis_cd order by l.pmi_no;";

        }
        //                          0               1           2
        String sql = "SELECT Diagnosis_Cd, count(PMI_no), Centre_Code "
                + "FROM `lhr_diagnosis` "
                + where;
        //                        0                1                    2                                             3                                  4                                                         5      
        String sql2 = "SELECT l.Diagnosis_Cd, count(l.PMI_no), l.Centre_Code,IFNULL(SUM(case when p.sex_code = 001 then 001 END) , '0') as male,IFNULL(SUM(case when p.sex_code = 002 then 002 END),'0')  as female ,IFNULL(SUM(case when p.sex_code = 003 then 003 END) ,'0')as other FROM `lhr_diagnosis` l,pms_patient_biodata p " + where;

        //get PMIno for total;
        String sqlGetPmi = "SELECT PMI_NO from lhr_diagnosis" + where;
        ArrayList<ArrayList<String>> PMINO = conn.getData(sqlGetPmi);
        //out.print(sql);

        //get the code first from one table
        ArrayList<ArrayList<String>> ICD10 = conn.getData(sql2);
        for (int i = 0; i < ICD10.size(); i++) {

            //get the description later from other table;
            //get the code
            //                              0           1              2
            String sqlCode = "SELECT icd10_chapter, icd10_block, icd10_desc FROM icd10_codes where icd10_code='" + ICD10.get(i).get(0) + "'; ";
            ArrayList<ArrayList<String>> tempCode = conn.getData(sqlCode);

            if (tempCode.size() > 0) {
                icd10.add(tempCode.get(0));
                //get the block name
                String sqlBlock = "SELECT `name` FROM icd10_blocks where `Id`='" + tempCode.get(0).get(1) + "';";
                ArrayList<ArrayList<String>> tempBlock = conn.getData(sqlBlock);
                try {
                    block.add(tempBlock.get(0).get(0));
                } catch (Exception e) {
                    block.add("-");
                }

                //get the chapter name
                String sqlChapter = "SELECT `name` FROM icd10_chapters WHERE `Id`='" + tempCode.get(0).get(0) + "';";
                ArrayList<ArrayList<String>> tempChapter = conn.getData(sqlChapter);
                try {
                    chapter.add(tempChapter.get(0).get(0));
                } catch (Exception e) {
                    chapter.add("-");
                }
            } else {
                indexToDelete.add(i);
            }

        }//end for loop

        for (int i = indexToDelete.size() - 1; i >= 0; i--) {
            //out.print("<br>Removing "+ICD10.get(indexToDelete.get(i)).toString());
            int index = indexToDelete.get(i);
            ICD10.remove(index);
            //out.print("---Is move? "+ICD10.get(indexToDelete.get(i)).toString());
        }// end for loop delete

//        out.print("<br>Chapter:"+chapter.size()+" Block:"+block.size()+" icd10:"+icd10.size()+" ICD10:"+ICD10.size()+"<br>");
//        out.print(indexToDelete.toString());
        int size = ICD10.size();
        for (int i = 0; i < size; i++) {

//        String male="",female="",others = "";
//        if(ICD10.get(i).get(3).toString().equalsIgnoreCase("null")){
//            male = "0";
//        }else{
//            male = ICD10.get(i).get(3);
//        }
//        
//        if(ICD10.get(i).get(4).toString().equalsIgnoreCase("null")){
//            female = "0";
//        }else{
//            female =ICD10.get(i).get(4);
//        } 
//
//
//        if(ICD10.get(i).get(5).toString().equalsIgnoreCase("null")){
//            others = "0";
//        }else{
//        others = ICD10.get(i).get(5);
//    }
%>
</thead>
<tr>

    <td id="chap_code"><%= icd10.get(i).get(0)%></td>
    <td id="chap_name"><%= chapter.get(i)%></td>
    <td id="block_code"><%= icd10.get(i).get(1)%></td>
    <td id="block_name"><%= block.get(i)%></td>
    <td id="ICD10Code"><%= ICD10.get(i).get(0)%></td>
    <td id="icd10Name"><%= icd10.get(i).get(2)%></td>
    <td id="total"><%= ICD10.get(i).get(1)%></td>
    <td id="male"><%=ICD10.get(i).get(3)%></td>
    <td id="female"><%=ICD10.get(i).get(4)%></td>
    <td id="others"><%=ICD10.get(i).get(5)%></td>


</tr>



<%
    }// end for loop;
%>
</table>
<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + my_1_hfc_cd + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>

<script>

    var startdate, enddate;
    startdate = "<%=startDate%>";
    enddate = "<%=endDate%>";
    var temp = startdate.split("-");
    startdate = temp[2] + "/" + temp[1] + "/" + temp[0];

    temp = enddate.split("-");
    enddate = temp[2] + "/" + temp[1] + "/" + temp[0];

    $(document).ready(function () {
        $('#ICD10Table').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'ICD10 List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'ICD10 List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>ICD10 List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>REP-0006</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'colvis',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });
    });
</script>

