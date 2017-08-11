
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%

    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();
    String startDate, endDate, hfc, dis, monthDuration, displayFormatEndDate="",displayFormatStartDate="", patientTypeName="", patientType="",query = "";
    String Reply = "";

    startDate = request.getParameter("startDate").toString();
    endDate = request.getParameter("endDate").toString();
    hfc = request.getParameter("hfc").toString();
    dis = request.getParameter("dis").toString();
    patientTypeName = request.getParameter("patientType").toString(); //either Staff OR Student (0 for staff,1 for student)

//    startDate = "2017-01-01";
//    endDate = "2017-08-28";
//    hfc = "04010101";
//    dis = "001";
//    patientType = "1";
    
    if(patientTypeName.equalsIgnoreCase("staff")) {
        patientType = "0";
    } else if (patientTypeName.equalsIgnoreCase("student")) {
        patientType = "1";
    }
    
    if (!startDate.equals("") && !endDate.equals("") && !hfc.equals("")) {

        query = "Select distinct"
                + " si.`LOCATION_CODE`,"
                + " MONTHNAME(e.`EPISODE_DATE`),  COUNT(*), e.`EPISODE_DATE`"
                + " FROM pms_episode e INNER JOIN special_integration_information si"
                + " ON si.`PERSON_ID_NO` = e.`ID_NO`"
                + " AND si.`NATIONAL_ID_NO` = e.`NEW_IC_NO`"
                + " WHERE e.`HEALTH_FACILITY_CODE` = '"+hfc+"'  AND e.`DISCIPLINE_CODE` = '"+dis+"'"
                + " AND si.`PERSON_TYPE` = '"+patientType+"'"
                + " GROUP BY YEAR(e.`EPISODE_DATE`),  MONTH(e.`EPISODE_DATE`) , si.`LOCATION_CODE`"
                + " having cast(e.`EPISODE_DATE` as date) BETWEEN '"+startDate+"' AND '"+endDate+"'";

//      out.print("Replay : " + hfc + " - " + startDate + " - " + endDate + " + " + query +"<br>");
        ArrayList<ArrayList<String>> medicalCertificateInfoGraph = conn.getData(query);

        if (medicalCertificateInfoGraph.size() > 0) {
            for (int i = 0; i < medicalCertificateInfoGraph.size(); i++) {
                ArrayList<String> medicalInforow = medicalCertificateInfoGraph.get(i);
                String slitedDatarow = StringUtils.join(medicalInforow, "|");
                Reply += slitedDatarow;
                if (i < medicalCertificateInfoGraph.size() - 1) {
                    Reply += "^";
                }
            }
            SimpleDateFormat parseDate = new java.text.SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");
            Date date = (Date) parseDate.parse(startDate);
            displayFormatStartDate = formatDate.format(date);
            date = (Date) parseDate.parse(endDate);
            displayFormatEndDate = formatDate.format(date);
        } else {

            Reply = "No Data";
        }

    } else {
        Reply = "UnCorrect Massage";
    }


%>


<div style="width: 100%; height: 400px">
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</div>

<script>

    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var endMonth = new Date("<%=endDate%>").getMonth();
    var reply = "<%=Reply%>";
//    console.log(reply);
    if (reply !== "No Data" && reply !== "UnCorrect Massage") {
        var dataRow = reply.trim().split("^");

        var j;
        var seriesOfData = [];
        for (j = 0; j < dataRow.length; j++) {
            var dataes = dataRow[j].split("|");

            var data = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            var name = dataes[0];
            var nameIndex = seriesOfData.map(function (dataes) {
                return dataes.name;
            }).indexOf(name);
            var monthIndex = months.indexOf(dataes[1]);
//            console.log(nameIndex );
            if (nameIndex !== -1) {
//                console.log(seriesOfData[nameIndex]);
                seriesOfData[nameIndex].data[monthIndex] = parseInt(dataes[2]);
            } else {
                data[monthIndex] = parseInt(dataes[2]);

                var obj = {
                    name: name,
                    data: data.slice(0, endMonth + 1)
                };
//                console.log(obj);
                seriesOfData.push(obj);
            }

        }
        console.log(seriesOfData);
    }



    Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Statistics of Patient Attendance'
        },
        subtitle: {
            text: 'By Center, From ' + '<%=displayFormatStartDate%>' + ' To ' + '<%=displayFormatEndDate%>'
        },
        xAxis: {
            categories: months,
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Total'
            },
                allowDecimals: false
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.1,
                borderWidth: 0
            }
        },
        series: seriesOfData
    });
</script>
