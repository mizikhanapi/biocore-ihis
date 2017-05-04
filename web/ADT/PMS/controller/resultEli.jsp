<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--    <input type="text" id="test">-->

<%

    Conn conn = new Conn();
%>
<%
    String disb = request.getParameter("Dis");
    String wnameb = request.getParameter("wname");
    String WardTypeb = request.getParameter("WardType");
    String EliSource = request.getParameter("EliSource");
    String EliTy = request.getParameter("EliTy");


%>
<div id="bedDiv">

    <%        String resultEliSrc = "select  Master_Reference_Code, Detail_Reference_Code, Description from adm_lookup_detail where master_reference_code = '0034' and  Detail_Reference_Code like '" + EliSrc + "%' and hfc_cd ='" + hfc + "' ";
        ArrayList<ArrayList<String>> dataEliSrc = conn.getData(resultEliSrc);
//                out.print(sqlBedID1);
        int a = dataEliSrc.size();

        for (int E = 0; E < a; E++) {

            if (dataEliSrc.get(E).get(1).equals("002-001")) {
            } else if (dataEliSrc.get(E).get(1).equals("002-002")) {
            } else if (dataEliSrc.get(E).get(1).equals("003-001")) {
            } else if (dataEliSrc.get(E).get(1).equals("003-002")) {
            } else if (dataEliSrc.get(E).get(1).equals("003-003")) {
            } else if (dataEliSrc.get(E).get(1).equals("004-001")) {

            } else if (dataEliSrc.get(E).get(1).equals("004")) {

            }

        }
    %>

</div>
<script>
    $(function () {
        $('#bedDiv').on('click', '.bed button', function () {
            var row = $(this).closest(".bed");
            //var str = $('#bedID').val();
            var te = row.find('#bedID').val();
            var array = te.split("|");
            var status = array[1], bedID = array[0];
            //alert(te);
            bootbox.alert({
                message: "The bed status : " + status +
                        ",  the bed ID: " + bedID,
                title: "Process Result",
                backdrop: true
            });
            if (status === "Available") {

                //set value
                $('#BedIDReg').val(bedID);
                $('#bednew').val(bedID);
            }


            var Dis = $('#Dis').val();
            var wname = $('#wname').val();
            var WardType = $('#WardType').val();
            var EliSource = $('#EliSource').val();
            var EliTy = $('#EliTy').val();
            $.ajax({
                async: true,
                type: "POST",
                url: "PMS/controller/resultEli.jsp",
                data: {'Dis': Dis, 'wname': wname, 'WardType': WardType, 'EliSource': EliSource, 'EliTy': EliTy},
                timeout: 10000,
                success: function (list) {
                    //remove the loading 
                    $body.removeClass("loading");
                    console.log(list);
                    var Diso = $('#dis_cd').val();
                    var wname = $('#wname').val();
                    var WardType = $('#WardType').val();
                    $('#wardnew').val(wname);
                    $('#classnew').val(WardType);
                    //$('#ratenew').val();


                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    //bootbox.alert(err.Message);
                }
            });
        });
    });

</script>