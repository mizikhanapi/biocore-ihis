<%-- 
    Document   : printLetter
    Created on : Oct 27, 2017, 11:01:52 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String printDiv = (String) session.getAttribute("DISCHARGE_LETTER");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Print Discharge Letter</title>
    </head>
    <body>
        <%=printDiv%>
        
        <script type="text/javascript" src="../../../../assets/js/jquery.min.js" ></script>
        
        <script type="text/javascript">

            $(function(){
                window.print();
                 $.ajax({
                    type: 'POST',
                    data: {
                        process: "unset"
                    },
                    url: "setSession.jsp",
                    timeout: 60000,
                    complete: function (jqXHR, textStatus ) {
                        window.close();
                    }
                });
                
            });
        </script>
    </body>
    
</html>

