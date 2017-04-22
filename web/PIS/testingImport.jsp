<%-- 
    Document   : testingImport
    Created on : Mar 16, 2017, 10:40:42 PM
    Author     : Shammugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    
    </body>


    <script>

            var excel2json = require("excel-to-json");
            excel2json({
                input: "input", // input directory  
                output: "output" // output directory  
            }, function (err, result) {
                if (err) {
                    console.error(err);
                } else {
                    console.log(result);
                }
            });
    </script>
</html>
