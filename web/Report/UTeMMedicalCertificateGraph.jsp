
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%

    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();
    String startDate, endDate, hfc, monthDuration,endMonth, query = "";
    String Reply = "";

    startDate = request.getParameter("startDate").toString();
    endDate = request.getParameter("endDate").toString();
    hfc = request.getParameter("hfc").toString();
//    startDate = "2017-01-26";
//    endDate = "2017-06-28";
//    hfc = "04010101";

    if (!startDate.equals("") && !endDate.equals("") && !hfc.equals("")) {

        query = "Select distinct"
                + " ml.centre_code, ml.EPISODE_DATE,"
                + " MONTHNAME(ml.EPISODE_DATE),COUNT(*)"
                + " FROM lhr_med_leave ml"
                + " WHERE ml.hfc_cd = '" + hfc + "'"
                + " GROUP BY MONTH(ml.EPISODE_DATE) , ml.centre_code"
                + " having cast(ml.EPISODE_DATE as date) BETWEEN '" + startDate + "' AND '" + endDate + "'";

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
        for (j = 0; j < dataRow.length; j++) {
            var dataes = dataRow[j].split("|");

            var data = [0,0,0,0,0,0,0,0,0,0,0,0];
            var name = dataes[0];
            var nameIndex = seriesOfData.map(function (dataes) {
                return dataes.name;
            }).indexOf(name);
            var monthIndex = months.indexOf(dataes[2]);
//            console.log(nameIndex );
            if (nameIndex !== -1) {
//                console.log(seriesOfData[nameIndex]);
                seriesOfData[nameIndex].data[monthIndex] = parseInt(dataes[3]);
            } else {
                data[monthIndex] = parseInt(dataes[3]);
                
                var obj = {
                    name: name,
                    data: data.slice(0,endMonth+1)
                };
//                console.log(obj);
                seriesOfData.push(obj);
                }

        }
//        console.log(seriesOfData);
    }



    Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Yearly Medical Certificate Issues Rate'
        },
        subtitle: {
            text: 'For Center Codes, From '+'<%=startDate%>'+' To '+'<%=endDate%>'
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
