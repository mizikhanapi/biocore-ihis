
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%

    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();
    String startDate, endDate, hfc, monthDuration, query = "";
    String Reply = "";

//    startDate = request.getParameter("startDate").toString();
//    endDate = request.getParameter("endDate").toString();
//    hfc = request.getParameter("hfc").toString();
    startDate = "2017-01-26";
    endDate = "2017-07-28";
    hfc = "04010101";

    if (!startDate.equals("") && !endDate.equals("") && !hfc.equals("")) {

        query = "SELECT"
                + " CASE"
                + " WHEN age >=15 AND age <=19 THEN '15-19'"
                + " WHEN age >=20 AND age <=24 THEN '20-24'"
                + " WHEN age >=25 AND age <=29 THEN '25-29'"
                + " WHEN age >=30 AND age <=34 THEN '30-34'"
                + " WHEN age >=35 AND age <=39 THEN '35-39'"
                + " WHEN age >=40 AND age <=44 THEN '40-44'"
                + " WHEN age >=45 AND age <=49 THEN '45-49'"
                + " WHEN age >=50 AND age <=54 THEN '50-54'"
                + " WHEN age >=55 AND age <=59 THEN '55-49'"
                + " WHEN age >=60 AND age <=64 THEN '60-64'"
                + " WHEN age >=65 AND age <=69 THEN '65-69'"
                + " WHEN age >=70 THEN '70+'"
                + " END AS ageband, months, COUNT(*)"
                + " FROM("
                + " Select distinct"
                + " e.`EPISODE_DATE`,b.`BIRTH_DATE`,"
                + " DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(b.`BIRTH_DATE`, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(b.`BIRTH_DATE`, '00-%m-%d')) AS age,"
                + " MONTHNAME(e.`EPISODE_DATE`) as months"
                + " FROM pms_episode e INNER JOIN pms_patient_biodata b"
                + " ON e.`PMI_NO` = b.`PMI_NO`"
                + " WHERE e.`HEALTH_FACILITY_CODE` = '04010101'  AND e.`DISCIPLINE_CODE` = '001'"
                + " AND DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(b.`BIRTH_DATE`, '%Y') - (DATE_FORMAT(NOW(),"
                + " '00-%m-%d') < DATE_FORMAT(b.`BIRTH_DATE`, '00-%m-%d')) IS NOT NULL"
                + " AND cast(e.`EPISODE_DATE` as date) BETWEEN '2017-01-26' AND '2017-08-28') as tbl"
                + " GROUP BY ageband , months;";

//    out.print("Replay : " + hfc + " - " + startDate + " - " + endDate + " + " + query +"<br>");
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
        } else {

            Reply = "No Data";
        }

    } else {
        Reply = "UnCorrect Massage";
    }


%>

<div style="width: 100%; height: 800px">
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</div>

<script>

    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var reply = "<%=Reply%>";
    console.log(reply);
    if (reply !== "No Data" && reply !== "UnCorrect Massage") {
        var dataRow = reply.trim().split("^");

        var j;
        var seriesOfData = [];
        for (j = 0; j < dataRow.length; j++) {
            var dataes = dataRow[j].split("|");

            var data = [0,0,0,0,0,0,0,0,0,0,0,0];
            var name = dataes[0];
            var nameIndex = seriesOfData.map(function (dataes) {
                return dataes.name;
            }).indexOf(name);
            var monthIndex = months.indexOf(dataes[1]);
            console.log(nameIndex );
            if (nameIndex !== -1) {
                console.log(seriesOfData[nameIndex]);
                seriesOfData[nameIndex].data[monthIndex] = parseInt(dataes[2]);
            } else {
                data[monthIndex] = parseInt(dataes[2]);
                
                var obj = {
                    name: name,
                    data: data
                };
                console.log(obj);
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
            text: 'Yearly Patient Attendance Rate'
        },
        subtitle: {
            text: 'By Age Range'
        },
        xAxis: {
            categories: months,
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Rainfall (mm)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
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