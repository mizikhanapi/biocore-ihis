<%-- 
    Document   : testing
    Created on : Mar 14, 2017, 3:33:48 AM
    Author     : Shammugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
    </head>
    <body>
        <h1>Hello World!</h1>
        <input type="file" id="testing" >
        <div id='my_file_output'></div>
    </body>
    <!-- Placed at the end of the document so the pages load faster -->
    <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
    <!-- Placed at the end of the document so the pages load faster -->
</html>

<script>

    $('#testing').on('change', function () {

        /* set up XMLHttpRequest */
        var url = "test.xlsx";
        var oReq = new XMLHttpRequest();
        oReq.open("GET", url, true);
        oReq.responseType = "arraybuffer";

        oReq.onload = function (e) {
            var arraybuffer = oReq.response;

            /* convert data to binary string */
            var data = new Uint8Array(arraybuffer);
            var arr = new Array();
            for (var i = 0; i !== data.length; ++i)
                arr[i] = String.fromCharCode(data[i]);
            var bstr = arr.join("");

            /* Call XLSX */
            var workbook = XLSX.read(bstr, {type: "binary"});

            /* DO SOMETHING WITH workbook HERE */
            var first_sheet_name = workbook.SheetNames[0];
            /* Get worksheet */
            var worksheet = workbook.Sheets[first_sheet_name];
            console.log(XLSX.utils.sheet_to_json(worksheet, {raw: true}));
        };

        oReq.send();
    });






</script>