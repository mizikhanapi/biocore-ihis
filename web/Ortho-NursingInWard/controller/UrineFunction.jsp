<%-- 
    Document   : UrineFunction
    Created on : Jul 14, 2017, 6:48:10 PM
    Author     : shay
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="NIW_helper.UrineUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UrineUtils urU = new UrineUtils();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;
    String A;
    List<String> Listlabels = new ArrayList<>();
    List<String> ListDatas = new ArrayList<>();
    List<String> ListDatasPulse = new ArrayList<>();

    if (methodName.equalsIgnoreCase("add")) {
        result = urU.addUrine(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = urU.getUrine(data); %>
<table class="table table-bordered" id="tblNIW_ur">
    <thead>
    <th hidden=""></th>
    <th>Date</th>
    <th>Time </th>
    <th>Temperature</th>
    <th>Pulse</th>
    <th>Action</th>
</thead>
<tbody>
    <%
        for (int i = 0; i < datas.size(); i++) {
            Listlabels.add(datas.get(i).get(7) + " " + datas.get(i).get(9));
            ListDatas.add(datas.get(i).get(5));
            ListDatasPulse.add(datas.get(i).get(6));
    %>
    <tr>
        <td hidden="" id="priNIWur"><%=datas.get(i).get(0) + "|" + datas.get(i).get(1) + "|" + datas.get(i).get(2) + "|" + datas.get(i).get(3) + "|" + datas.get(i).get(4) + "|" + datas.get(i).get(5) + "|" + datas.get(i).get(6) + "|" + datas.get(i).get(7) + "|" + datas.get(i).get(8) + "|" + datas.get(i).get(9)%></td>
        <td><%=datas.get(i).get(7)%></td>
        <td><%=datas.get(i).get(9)%></td>
        <td><%=datas.get(i).get(5)%></td>
        <td><%=datas.get(i).get(6)%></td>
        <td>
            <a id="editNIWur" data-toggle="modal" data-target="#chartUrine"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="delNIWur" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
        </td>
    </tr>
    <%   }
    %>
</tbody>
</table>
<script>
    $('#tblNIW_ur').dataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });</script>
<canvas id="line" height="500" width="670" style="width: 470px; height: 300px;"></canvas>
<script>
            var jsArraylabel = [<% for (int i = 0; i < Listlabels.size(); i++) {%>"<%= Listlabels.get(i)%>"<%= i + 1 < Listlabels.size() ? "," : ""%><% } %>];
            var jsArraydata = [<% for (int i = 0; i < ListDatas.size(); i++) {%>"<%= ListDatas.get(i)%>"<%= i + 1 < ListDatas.size() ? "," : ""%><% } %>];
            var jsArraydataPulse = [<% for (int i = 0; i < ListDatasPulse.size(); i++) {%>"<%= ListDatasPulse.get(i)%>"<%= i + 1 < ListDatasPulse.size() ? "," : ""%><% } %>];
            
            new Chart(document.getElementById("line").getContext("2d"), {
                type: 'line',
                data: {
                    labels: jsArraylabel,
                    datasets: [{
                            label: "Temperature",
                            data: jsArraydata,
                            borderColor: '#ff6384',
                            fill: false,
                        }, {
                            label: "Pulse",
                            data: jsArraydataPulse,
                            borderColor: '#cc65fe',
                            fill: false,
                        }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Urine Chart'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Date Time'
                                }
                            }],
                        yAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Value'
                                }
                            }]
                    }
                }

            });
</script>
<%  } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        //nah nothing to do
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = urU.delUrine(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = urU.updateUrine(data);
        out.print(result);
    }
%>