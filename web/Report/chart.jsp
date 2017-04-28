<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML>
<html>
    <head>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="material-charts.css">
        <script src="js/material-charts.js"></script>
    </head>

    <body>
        <div id="demo"></div>

    </body>

    <script type="text/javascript" charset="utf-8">
        var barchart = {
            "datasets": {
                "values": [5, 10, 30, 50, 20],
                "labels": [
                    "JavaScript",
                    "Swift",
                    "Object-C",
                    "C++",
                    "Python"
                ],
                "color": "blue"
            }
            // more options here
        };
        MaterialCharts.bar("#demo", barchart)

    </script>
</html>