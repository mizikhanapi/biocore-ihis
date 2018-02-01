<%@page import="dbConn1.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@include file="connectDB.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
         <%@include file="Header.jsp"%>   
    </head>
    <body>
             <%
               // Statement st = con.createStatement();
              //  ResultSet resultset = 
               // st.executeQuery("SELECT om.order_no,OM.PMI_NO,PMS.PATIENT_NAME,OM.ORDER_DATE,OM.HFC_CD,OM.EPISODE_DATE,OM.ORDER_BY FROM LIS_ORDER_MASTER OM, PMS_PATIENT_BIODATA PMS WHERE OM.pmi_no = PMS.PMI_NO");
               Conn conn = new Conn();       
               String pmi = request.getParameter("pmi");
                      String query_count = "select om.pmi_no,om.order_no,OM.ORDER_DATE,OM.EPISODE_DATE,lim.item_cd,lim.item_name,lim.spe_source,lim.spe_container,lim.volume,lim.special_inst "
                              + "from lis_order_master om,lis_item_detail lim where om.pmi_no='023238738'";
                      ArrayList<ArrayList<String>> q1 = conn.getData(query_count);
         %>
   
        <form action="readCategoryDetails.jsp" method="post">
             <%if (q1.size() > 0) 
                                        {
                                            for (int i = 0; i < q1.size(); i++) 
                                            {%>
       
                            <div class="modal-body">
                                <!--form name="myForm" action="" method="post">-->
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
                                    <input type="text"   class="form-control" name="ordate" value="<%=q1.get(i).get(2)%>" required="required"/ readonly="">
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
                                <!--/form>-->
                            </div>
                                                      
 <%
        }}
       %>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
        </form>
 
       </body>
</html>