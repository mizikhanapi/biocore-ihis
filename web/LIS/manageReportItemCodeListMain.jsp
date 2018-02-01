<%-- 
    Document   : manageReportItemCodeListMain
    Created on : Jan 30, 2018, 7:03:11 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String test_ca = "SELECT category_code,category_name "
            + " FROM lis_item_category WHERE hfc_cd  = '" + hfc + "' ";
    ArrayList<ArrayList<String>> test_cd = conn.getData(test_ca);
%>


<div style="width:50%; margin: auto;">
    <div class="form-horizontal">
        <div class="form-group">

            <label class="col-md-4 control-label" for="textinput">Show list of test code by category : </label>

            <div class="col-md-5">

                <select class="form-control" name="test" id="LIS_ReportTestListCateFilter">
                    <option value="all">All</option>
                    <%if (test_cd.size() > 0) {
                            for (int i = 0; i < test_cd.size(); i++) {%>
                    <option value="<%=test_cd.get(i).get(0)%>"><%=test_cd.get(i).get(1)%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>

            <div class="col-md-2">
                <button id="LIS_ReportTestListCateFilterRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
            </div>

        </div>
    </div>
</div>





<script>

    $(function () {

        //-------------------------refresh the order table ---------------------------------------
        $('#LIS_ReportTestListCateFilterRefresh').on('click', function () {
            //$('#risOrderListContent').html('<div class="loading">Loading</div>');

            var process = $('#LIS_ReportTestListCateFilter').val();

            var data = {
                process: process
            };
            console.log(data);

            $('<div class="loading">Loading</div>').appendTo('body');

            $.ajax({
                type: 'POST',
                url: "manageReportItemCodeListTable.jsp",
                data: data,
                success: function (datas) {

                    console.log(datas);

                    $('#ReportItemListTable').html(datas);

                }

            });

        });
    });



</script>

