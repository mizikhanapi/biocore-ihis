<%-- 
    Document   : getUserName
    Created on : Mar 8, 2017, 8:58:48 PM
    Author     : user
--%>

<%
    String name = session.getAttribute("USER_NAME").toString();
    
    out.print(name);

%>
