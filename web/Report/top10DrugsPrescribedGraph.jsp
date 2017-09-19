
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%

    Conn conn1 = new Conn();

    String today = "", hfc1 = "", query = "", reply = "";
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//    today = "2017-08-17";
    today = df.format(new Date()).toString();
    hfc1 = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    if (!hfc1.equals("") && !today.equals("")) {

        query = "SELECT DISTINCT drug_name, COUNT(*) AS counts "
                + " FROM lhr_medication "
                + " WHERE hfc_cd = '" + hfc1 + "' "
                + " AND episode_date LIKE '" + today + "%' "
                + " GROUP BY drug_name "
                + " ORDER BY counts DESC "
                + " LIMIT 10;";
        out.print(query);
        ArrayList<ArrayList<String>> medicalInfo = conn1.getData(query);

        if (medicalInfo.size() > 0) {
            for (int i = 0; i < medicalInfo.size(); i++) {
                ArrayList<String> medicalInforow = medicalInfo.get(i);
                String slitedDatarow = StringUtils.join(medicalInforow, "|");
                reply += slitedDatarow;
                if (i < medicalInfo.size() - 1) {
                    reply += "^";
                } else {
                }
            }
        }
    } else {

        reply = "No Data";
    }
%>

<script src="http://code.jquery.com/jquery-latest.min.js"
type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-latest.js"
type="text/javascript"></script>
<!--        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
        type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"
        type="text/javascript"></script>-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.5/Chart.js"></script>
<!--<script src="../assets/js/Chart.bundle.js" type="text/javascript"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/randomcolor/0.5.2/randomColor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/randomcolor/0.5.2/randomColor.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/randomcolor/0.5.2/randomColor.min.js.map"></script>


<style>
    .chart-container {
        position: relative;
    }
    chart-legend {
        position: relative;
        top: 50%;
        right: 0%;
        transform: translateY(-50%);
    }
</style>

<div class="chart-container">
    <canvas id="top10ItemsChart" ></canvas>
    <div class="chart-legend" id="top10Legend"></div>
</div>

<script>

    var replys = "<%=reply.trim()%>";
   if (replys !== "No Data" && replys !== "") {
       var rows = replys.split("^");
    var row = [];
    var i = 0, labels = [], values = [];
    for (i = 0; i < rows.length; i++) {
        row = rows[i].split("|");
        labels.push(row[0] + "     " + row[1]);
        values.push(row[1]);
    }

    if (values !== null && labels !== null) {

        var colors = [];
        var count;
        for (count = 0; count < labels.length; count++) {
            var color = randomColor({
                luminosity: 'bright',
                format: 'rgb' // e.g. 'rgb(225,200,20)'
            });
            if (colors.indexOf(color) < 0) {
                colors.push(color);
            }
        }

        var config = {
            type: 'doughnut',
            data: {
                datasets: [{
                        data: values,
                        backgroundColor: colors
                    }],
                labels: labels
            },
            options: {
                responsive: true,
                legend: {
                    display: true,
                    position: 'right',
                    fullWidth: false,
                    lebal: {
                        fontFamily: 'sans-serif',
                        
                    }
                },
                title: {
                    display: true,
                    text: 'Top 10 Drug Prescribed'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        };

        window.onload = function () {
            var ctx = document.getElementById("top10ItemsChart").getContext("2d");
            window.myDoughnut = new Chart(ctx, config);
        };

        document.getElementById('randomizeData').addEventListener('click', function () {
            config.data.datasets.forEach(function (dataset) {
                dataset.data = dataset.data.map(function () {
                    return randomScalingFactor();
                });
            });

            window.myDoughnut.update();
        });

        var colorNames = Object.keys(window.chartColors);
        document.getElementById('addDataset').addEventListener('click', function () {
            var newDataset = {
                backgroundColor: [],
                data: [],
                label: 'New dataset ' + config.data.datasets.length
            };

            for (var index = 0; index < config.data.labels.length; ++index) {
                newDataset.data.push(randomScalingFactor());

                var colorName = colorNames[index % colorNames.length];
                ;
                var newColor = window.chartColors[colorName];
                newDataset.backgroundColor.push(newColor);
            }

            config.data.datasets.push(newDataset);
            window.myDoughnut.update();
        });

        document.getElementById('addData').addEventListener('click', function () {
            if (config.data.datasets.length > 0) {
                config.data.labels.push('data #' + config.data.labels.length);

                var colorName = colorNames[config.data.datasets[0].data.length % colorNames.length];
                ;
                var newColor = window.chartColors[colorName];

                config.data.datasets.forEach(function (dataset) {
                    dataset.data.push(randomScalingFactor());
                    dataset.backgroundColor.push(newColor);
                });

                window.myDoughnut.update();
            }
        });

        document.getElementById('removeDataset').addEventListener('click', function () {
            config.data.datasets.splice(0, 1);
            window.myDoughnut.update();
        });

        document.getElementById('removeData').addEventListener('click', function () {
            config.data.labels.splice(-1, 1); // remove the label first

            config.data.datasets.forEach(function (dataset) {
                dataset.data.pop();
                dataset.backgroundColor.pop();
            });

            window.myDoughnut.update();
        });

    }
       
   } 
    

</script>
