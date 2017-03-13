<%-- 
    Document   : HomePage
    Created on : Nov 4, 2016, 4:34:46 PM
    Author     : Ahmed
--%>
<%@page import="dbConn1.Conn"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Config.getFile_url(session);
    Config.getBase_url(request);

%>
<html>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>JSP Page</title>
         <%@include file="Header.jsp"%>
         </head>
    <body>
        <%
                    Conn conn = new Conn();
                    String pmi = request.getParameter("pmi");
                    String query_count = "select om.pmi_no,om.order_no,OM.ORDER_DATE,OM.EPISODE_DATE,lim.item_cd,lim.item_name,lim.spe_source,lim.spe_container,lim.volume,lim.special_inst "
                              + "from lis_order_master om,lis_item_detail lim where om.pmi_no='01571595'";
                    ArrayList<ArrayList<String>> q1 = conn.getData(query_count);
    %>
        <form method="post" name="myform" role="form" action="readCategoryDetails.jsp">
              <%
            if (q1.size() > 0) {
                for (int i = 0; i < q1.size(); i++) {

              %>
                           <div class="form-group">
                                <label>PMI No</label>
                                    <input class="form-control" type="text" name="pmino" value="<%=q1.get(i).get(0)%>" readonly="">
                                </div>
                                <div class="form-group">
                                <label>Order No</label>
                                    <input class="form-control" type="text" name="orderno" value="<%=q1.get(i).get(1)%>" readonly="">
                                </div>
                                <div class="form-group">
                                    <label>Order Date</label>
                                    <input type="text"   class="form-control" name="ordate" value="<%=q1.get(i).get(2)%>" required="required" readonly="">
                                </div>
                                <div class="form-group">
                                    <label>Episode Date</label>
                                    <input type="text" name="epdate"  class="form-control" value="<%=q1.get(i).get(3)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Item code</label>
                                    <input type="text" name="itemcode"  class="form-control"  value="<%=q1.get(i).get(4)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Item name</label>
                                    <input type="text" name="itemname"  class="form-control"  value="<%=q1.get(i).get(5)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Specimen source</label>
                                    <input type="text" name="ssource"  class="form-control"  value="<%=q1.get(i).get(6)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Specimen container</label>
                                    <input type="text" name="scontainer"  class="form-control"  value="<%=q1.get(i).get(7)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Volume required</label>
                                    <input type="text" name="vreq"  class="form-control" value="<%=q1.get(i).get(8)%>" required="required" readonly=""/>
                                </div>
                                <div class="form-group">
                                    <label>Special instruction</label>
                                    <textarea name="fcomment" class="form-control"   placeholder="Write your details" ></textarea>
                                </div>
                                   <% }
            }
        %>
                                          
            <br>
                                            <div class="form-group row">
                                            <div class="col-xs-10">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <button type="reset" class="btn btn-success">Reset</button>
                                            </div>
                                            </div>
                                    <!--</div>-->
                                    </form> 
                                     
    </body>
</html>
