
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%

    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();
    String startDate, endDate, hfc, dis, monthDuration, query = "";
    String Reply = "";

    startDate = request.getParameter("startDate").toString();
    endDate = request.getParameter("endDate").toString();
    hfc = request.getParameter("hfc").toString();
    dis = request.getParameter("dis").toString();
//    startDate = "2017-01-26";
//    endDate = "2017-07-28";
//    hfc = "04010101";
//    dis = "001";

    if (!startDate.equals("") && !endDate.equals("") && !hfc.equals("")) {

        query = "Select distinct"
                + " adm_lookup_det.`Description`, e.`EPISODE_DATE`, b.`SEX_CODE`,"
                + " MONTHNAME(e.`EPISODE_DATE`),COUNT(*)"
                + " FROM pms_episode e INNER JOIN pms_patient_biodata b"
                + " ON e.`PMI_NO` = b.`PMI_NO`"
                + " INNER join adm_lookup_detail adm_lookup_det"
                + " ON adm_lookup_det.`Detail_Reference_code` = b.SEX_CODE"
                + " AND adm_lookup_det.`hfc_cd` = e.`HEALTH_FACILITY_CODE`"
                + " AND adm_lookup_det.`Master_Reference_code` like '0041'"
                + " WHERE e.`HEALTH_FACILITY_CODE` = '" + hfc + "'  AND e.`DISCIPLINE_CODE` = '" + dis + "'"
                + " GROUP BY YEAR(e.`EPISODE_DATE`),  MONTH(e.`EPISODE_DATE`) , b.SEX_CODE"
                + " having cast(e.`EPISODE_DATE` as date) BETWEEN '" + startDate + "' AND '" + endDate + "'";

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
        var malesData = [0,0,0,0,0,0,0,0,0,0,0,0], femalesData = [0,0,0,0,0,0,0,0,0,0,0,0],othersData = [0,0,0,0,0,0,0,0,0,0,0,0];
        for (j = 0; j < dataRow.length; j++) {
            var dataes = dataRow[j].split("|");

            var data = [];
            var name = dataes[0];
            var t;
            var monthIndex = months.indexOf(dataes[3]);
                    if (dataes[0].toUpperCase() === "MALE" || dataes[0].toUpperCase() === "M" ) {
                        malesData[monthIndex] = parseInt(dataes[4]);
                    } else if (dataes[0].toUpperCase() === "FEMALE" || dataes[0].toUpperCase() === "F") {
                        femalesData[monthIndex] = parseInt(dataes[4]);
                    } else if (dataes[0].toUpperCase() === "OTHER" || dataes[0].toUpperCase() === "O") {
                        othersData[monthIndex] = parseInt(dataes[4]);
                    }
        }
        var Maleobj = {
            name: "Male",
            data: malesData.slice(0,endMonth+1)
        };
        var Fmaleobj = {
            name: "Famle",
            data: femalesData.slice(0,endMonth+1)
        };
        var Otherobj = {
            name: "Other",
            data: othersData.slice(0,endMonth+1)
        };
//        console.log(Maleobj);
//        console.log(Fmaleobj);
//        console.log(Otherobj);
        
        seriesOfData.push(Maleobj);
        seriesOfData.push(Fmaleobj);        
        seriesOfData.push(Otherobj);
//        console.log(seriesOfData);
    }



    Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Yearly Patient Attendance Rate'
        },
        subtitle: {
            text: 'By Gender, From '+'<%=startDate%>'+' To '+'<%=endDate%>'
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

