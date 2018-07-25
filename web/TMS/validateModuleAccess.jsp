<%-- 
    Document   : validateModuleAccess
    Created on : Aug 4, 2017, 6:05:31 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="ADM_helper.MySession"%>
<%
    Object objTenant = session.getAttribute(MySessionKey.TENANT_CD);
    Object objType = session.getAttribute(MySessionKey.USER_TYPE);
    
    if(objTenant == null || objType == null){
        response.sendRedirect("../Entrance/Home");
        return;
    }
    
    String tenat_cd = (String) objTenant;
    String type = (String) objType;
    
    if("TENANT".equals(type) && "???".equals(tenat_cd)){
        //response.sendRedirect("tenant.jsp");
        out.print("<h1>You have not register a tenant yet. Please register it first</h1>");
%>
<script type="text/javascript">
     setTimeout(function () {
       window.location.href = "register-tenant.jsp"; //will redirect to your blog page (an ex: blog.html)
    }, 2000); //will call the function after 2 secs.
</script>
<%
        return;
    }
    
%>
