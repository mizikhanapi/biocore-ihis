<%-- 
    Document   : tester
    Created on : Mar 17, 2017, 6:25:01 AM
    Author     : Shammugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>

        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <form class="form-inline">
            <div class="form-group">
                <label for="files">Upload a CSV formatted file:</label>
                <input type="file" id="files"  class="form-control" accept=".csv" required />
                <div class="progress" align="center">
                    <div class="progress-bar progress-bar-striped active" id="progressBar" role="progressBar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"> <span id="progressBarSpan">0% Complete</span> </div>
                </div>
                <p id="total"></p>
            </div>
        </form>

        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>

    </body>
</html>



<script>

    $("#files").on('change', function () {

        var selectedFile = document.getElementById('files').files[0];
        var fileName = document.getElementById("files").value;



        if (fileName === "") {
            alert("Browse to upload a valid File with csv extension");
        } else if (fileName.split(".")[1].toUpperCase() === "CSV") {
            var total = 0;

            Papa.parse(selectedFile, {
                complete: function (results) {
                    console.log(results);
                    console.log(results.data);

                    var counter = 1;
                    var maxData = results.data.length;
                    var arrayDatas = results.data;
                    total = results.data.length - 1;


                    arrayDatas.forEach(function (arrayItem)
                    {

                        if (counter === 1) {
                            console.log("Header Omited" + " " + counter);
                        } else if (counter > 1) {

                            console.log(arrayItem.join('|') + " " + counter);
                            var progress = ((counter / maxData) * 100);

                            var data = {
                                data1: arrayItem[0],
                                data2: arrayItem[1],
                                data3: arrayItem[2],
                                data4: arrayItem[3]
                            };

                            console.log(data);

                            document.getElementById("progressBar").style.width = progress + "%";
                            document.getElementById("progressBarSpan").innerHTML = progress + " % Complete";
                            
                        }




                        counter++;
                    });

                    document.getElementById("total").innerHTML = total + " Records Imported";

                }
            });

            document.getElementById("files").disabled = true;


        } else {

            alert("File with " + fileName.split(".")[1] + " is invalid. Upload a validfile with csv extensions");
            document.getElementById("files").value = "";

        }


    });


</script>
