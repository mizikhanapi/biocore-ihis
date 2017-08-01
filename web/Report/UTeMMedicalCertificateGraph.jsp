
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
    endDate = "2017-08-28";
    hfc = "04010101";

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
<!--<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
-->

<!--<script src="../assets/js/Chart.bundle.js" type="text/javascript"></script>-->

<!--<div style="width: 80%; height: 800px">
    <canvas id="UTeMMCGraph" height="100px" width="210px" ></canvas>
</div>-->

<!--

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>-->

<div style="width: 100%; height: 400px">
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</div>




<script>

    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

    var reply = "<%=Reply%>";
//    console.log(reply);
    if (reply !== "No Data" && reply !== "UnCorrect Massage") {
        var dataRow = reply.trim().split("^");

//        var i;
//        for (i = 0; i < dataRow.length; i++)
//        {
//            var datas = dataRow[i].split("|");
//            centerCodes.push(datas[0]);
//            genders.push(datas[2]);
//            epcisodeDates.push(datas[3]);
//            console.log(datas);
//        }

//        
//        console.log(centerCodes);
//        console.log(genders);
//        console.log(epcisodeDates);
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
                    data: data
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
            text: 'For Center Codes'
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

<script>



//    var data = {
//        "startDate": "2017-07-01",
//        "endDate": "2017-07-30",
//        "hfc": "04010101"
//    };
//    console.log(data);
//    $.ajax({
//        type: "POST",
//        url: "UTeMMedicalCertificateReportController.jsp",
//        data: data,
//        timeout: 10000,
//        success: function (reply) {
//            if (reply.trim() !== "No Data") {
//                console.log(reply);
//
//                var dataRow = reply.trim().split("^");
//
//                var trHTML = '';
//                var i;
//                for (i = 0; i < dataRow.length; i++)
//                {
//                    var datas = dataRow[i].split("|");
//
//                    trHTML += datas[3] + " // " + datas[11] + "  /  " + datas[6] + "\n";
//                    centerCodes.push(datas[6]);
//                    genders.push(datas[3]);
//                    epcisodeDates.push(datas[11]);
//                    if (datas[6] === "FTMK")
//                        centerCodes.splice(i, 1);
//
//                }
//
//                var item, x;
//                item = centerCodes[x];
//                var centerCodeWords = centerCodes.filter(function (item, x) {
//                    return centerCodes.indexOf(item) === x;
//                });
//
//                item = genders[x];
//                var genderWords = genders.filter(function (item, x) {
//                    return genders.indexOf(item) === x;
//                });
//
//                console.log(centerCodes);
//                console.log(centerCodeWords);
//                console.log(genders);
//                console.log(genderWords);
//                console.log(epcisodeDates);
//                console.log(trHTML);
//            } else if (reply.trim() === "No Data") {
//                alert("There is no Medical Certificates Issued in this time range !!");
//            }
//        },
//        error: function (err) {
//            console.log("ERROR: " + err);
//        }
//    });
//
//    people = [
//        {name: 'Mary', gender: 'girl'},
//        {name: 'Paul', gender: 'boy'},
//        {name: 'John', gender: 'boy'},
//        {name: 'Lisa', gender: 'girl'},
//        {name: 'Bill', gender: 'boy'},
//        {name: 'Maklatura', gender: 'girl'}
//    ];
//    boys = 0, girls = 0;
//    function count() {
//        for (var x = 0; x < people.length; x++)
//        {
//            if (people[x].gender == 'boy')
//            {
//                boys += 1;
//            }
//            if (people[x].gender == 'girl')
//                girls += 1;
//
//            console.log(boys + " - " + girls + " , " + x);
//        }
//    }
//    ;
//    count();
//
//    var barChartData = {
//        labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
//        datasets: [{
//                label: 'Dataset 1',
//                backgroundColor: '#ff6384',
//                stack: 'Stack 0',
//                data: [
//                    1,
//                    2,
//                    3,
//                    4,
//                    5,
//                    6,
//                    7,
//                    3,
//                    4,
//                    5,
//                    6,
//                    11
//                ]
//            }, {
//                label: 'Dataset 2',
//                backgroundColor: '#5ee096',
//                stack: 'Stack 2',
//                data: [
//                    11,
//                    12,
//                    13,
//                    14,
//                    15,
//                    16,
//                    17,
//                    13,
//                    14,
//                    15,
//                    16,
//                    17
//                ]
//            }, {
//                label: 'Dataset 3',
//                backgroundColor: '#93d6ff',
//                stack: 'Stack 3',
//                data: [
//                    11,
//                    21,
//                    31,
//                    41,
//                    51,
//                    61,
//                    71,
//                    31,
//                    41,
//                    51,
//                    61,
//                    71
//                ]
//            }, {
//                label: 'Dataset 3',
//                backgroundColor: '#14d3ff',
//                stack: 'Stack 4',
//                data: [
//                    11,
//                    21,
//                    31,
//                    41,
//                    51,
//                    61,
//                    71,
//                    31,
//                    41,
//                    51,
//                    61,
//                    71
//                ]
//            }]
//    };
//    window.onload = function () {
//        var ctx = document.getElementById("UTeMMCGraph");
//        window.myBar = new Chart(ctx, {
//            type: 'bar',
//            data: barChartData,
//            options: {
//                title: {
//                    display: true,
//                    text: "Medical Certificate - By Department"
//                },
//                tooltips: {
//                    mode: 'index',
//                    intersect: false
//                },
//                responsive: true,
//                scales: {
//                    xAxes: [{
//                            stacked: true,
//                        }],
//                    yAxes: [{
//                            stacked: true
//                        }]
//                }
//            }
//        });
//    };
//

//        document.getElementById('randomizeData').addEventListener('click', function() {
//            barChartData.datasets.forEach(function(dataset, i) {
//                dataset.data = dataset.data.map(function() {
//                    return randomScalingFactor();
//                });
//            });
//            window.myBar.update();
//        });
</script>


