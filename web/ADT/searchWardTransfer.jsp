<%-- 
  Document   : searchPatient
  Created on : Feb 6, 2017, 2:53:34 PM
  Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form class="form-horizontal" name="wardForm" id="wardForm">
    <!-- Select Basic -->
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
        <div class="col-md-4">
            <select id="idWard" name="idWard" class="form-control" required="">
                <option selected="" disabled="" value="-"> Please select Ward Name</option>

                <%
                    //Conn conn = new Conn();
                    String wname1 = "SELECT ward_id,ward_name FROM wis_ward_name where hfc_cd ='" + hfc + "'";
                    ArrayList<ArrayList<String>> dataWname25 = conn.getData(wname1);

                    int sizeward = dataWname25.size();

                    for (int i = 0; i < sizeward; i++) {
                %>
                <option value="<%= dataWname25.get(i).get(0)%>"><%= dataWname25.get(i).get(1)%> </option>
                <%
                    }
                %>
            </select>
        </div>
        <button class="btn btn-primary" type="button" id="search_ward" name="searchWard"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

    </div>
</form>



<script>
    function searchPatientInWardS() {
        var idWard = $('#idWard').val();
        var methodSearch = "0";
        createScreenLoading();
        $.ajax({
            type: "post",
            url: "resultWard.jsp",
            data: {idWard: idWard, methodSearch: methodSearch},
            timeout: 10000,
            success: function (databack) {
                //  if ($.trim(databack) === "Success") {
                $("#WardOccuTable").html(databack);
                //bootbox.alert("Success");
                // } else if ($.trim(databack) === "Failed") {
                //     bootbox.alert("There is no patient occupied in this ward");
                // }
            }, error: function () {

            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }
    $("#search_ward").on('click', function () {
        searchPatientInWardS();
    });
    //event on click clear buton
    $('#clearSearch').click(function () {
        $('#myForm2')[0].reset();
        $("table tbody").remove();
    });
</script>