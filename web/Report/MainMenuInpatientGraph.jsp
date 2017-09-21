
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<%

    Conn conn = new Conn();
    String startDate, endDate, hfc, displayFormatEndDate="",displayFormatStartDate="", patientTypeName="", patientType="", query = "";
    String Reply = "";
    
    hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
 
    
    startDate = request.getParameter("startDate").toString();
    endDate = request.getParameter("endDate").toString();
    
    
//    startDate = "2017-01-01";
//    endDate = "2017-08-28";
//    dis = "002";
    
    if(patientTypeName.equalsIgnoreCase("staff")) {
        patientType = "0";
    } else if (patientTypeName.equalsIgnoreCase("student")) {
        patientType = "1";
    }

    
    if (!startDate.equals("") && !endDate.equals("") && !hfc.equals("")) {

        query = "Select distinct adm_lookup_det.`Description`, e.`EPISODE_DATE`, b.`SEX_CODE`,"
                + " MONTHNAME(e.`EPISODE_DATE`),COUNT(*) "
                + "FROM pms_episode e"
                + " INNER JOIN pms_patient_biodata b"
                + " ON e.`PMI_NO` = b.`PMI_NO`"
                + " INNER join adm_lookup_detail adm_lookup_det"
                + " ON adm_lookup_det.`Detail_Reference_code` = b.SEX_CODE"
                + " AND adm_lookup_det.`hfc_cd` = e.`HEALTH_FACILITY_CODE`"
                + " AND adm_lookup_det.`Master_Reference_code` like '0041'"
                + " WHERE e.`HEALTH_FACILITY_CODE` = '"+hfc+"'"
               // + " AND e.`DISCIPLINE_CODE` = '002'"
                + " GROUP BY YEAR(e.`EPISODE_DATE`), MONTH(e.`EPISODE_DATE`) ,"
                + " b.SEX_CODE having cast(e.`EPISODE_DATE` as date) BETWEEN '"+startDate+"' AND '"+endDate+"'";

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
            data: malesData.slice(0,endMonth+1),
            color: "#00bfff"
        };
        var Fmaleobj = {
            name: "Female",
            data: femalesData.slice(0,endMonth+1),
            color: "#ff69b4"
        };
        var Otherobj = {
            name: "Other",
            data: othersData.slice(0,endMonth+1),
            color: "#008000"
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
            text: 'Statistics of Patient Attendance'
        },
        subtitle: {
            text: 'By Gender, From '+'<%=displayFormatStartDate%>'+' To '+'<%=displayFormatEndDate%>'
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

