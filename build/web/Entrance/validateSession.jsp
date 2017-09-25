<%-- 
    Document   : validateSession
    Created on : Jan 19, 2017, 4:47:02 PM
    Author     : user
--%>


<%@page import="ADM_helper.MySession"%>
<% 
    if (session.getAttribute("USER_ID") == null) {
        response.sendRedirect("../index.jsp");
        return;
    }
    else{
        String id = (String) session.getAttribute("USER_ID");
        String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String sID = (String) session.getAttribute("SESSION_ID");
        
        MySession mys = new MySession(id, hfc);
        
        if(!mys.isSessionValid(sID)){
//            response.sendRedirect("../index.jsp");
            out.print("<h1>"+mys.getInvalidSessionMsg()+"</h1>");
            session.invalidate();

%>
<script type="text/javascript">
     setTimeout(function () {
       window.location.href = "../index.jsp"; //will redirect to your blog page (an ex: blog.html)
    }, 3000); //will call the function after 3 secs.
</script>
<%
            return;        
        }
    }
%>
