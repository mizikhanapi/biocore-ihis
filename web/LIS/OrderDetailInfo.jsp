<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String itemCd = request.getParameter("itemCd");
    String OrderDetail = "SELECT spe_source,spe_container,volume,special_inst FROM lis_item_detail WHERE item_cd = '"+itemCd+"'";
    ArrayList<ArrayList<String>> q1 = conn.getData(OrderDetail);

%>
<div class="form-group">
    <label class="col-md-4 control-label" for="textinput">Item Code*</label>
    <div class="col-md-8" >
        <input type="text" placeholder="-" class="form-control" maxlength="330" id="itemCode1" disabled="disabled" value="<%=itemCd%>">
    </div>
</div>

<!-- Text input-->
<div class="form-group">
    <label class="col-md-4 control-label" for="textinput">spe_source*</label>
    <div class="col-md-8">
        <input type="text" placeholder="-" class="form-control" maxlength="330" id="spe_source" value="<%=q1.get(0).get(0)%>">
        <div id="RNO_pro_match" class="search-drop">
            <!--search result-->
        </div>
    </div>
</div>

<!-- Text input-->
<div class="form-group">
    <label class="col-md-4 control-label" for="textinput">spe_container*</label>
    <div class="col-md-8">
        <input type="text" placeholder="-" class="form-control" maxlength="330" id="spe_container" value="<%=q1.get(0).get(1)%>">
        <div id="RNO_pro_match" class="search-drop">
            <!--search result-->
        </div>
    </div>
</div>
<!-- Text input-->
<div class="form-group">
    <label class="col-md-4 control-label" for="textinput">volume*</label>
    <div class="col-md-8">
        <input type="text" placeholder="-" class="form-control" maxlength="330" id="volume" value="<%=q1.get(0).get(2)%>">
        <div id="RNO_pro_match" class="search-drop">
            <!--search result-->
        </div>
    </div>
</div>

        <!-- Text input-->
<div class="form-group">
    <label class="col-md-4 control-label" for="textinput">special_inst*</label>
    <div class="col-md-8">
        <input type="text" placeholder="-" class="form-control" maxlength="330" id="special_inst" value="<%=q1.get(0).get(3)%>">
        <div id="RNO_pro_match" class="search-drop">
            <!--search result-->
        </div>
    </div>
</div>
        
<!-- Text input-->
<div class="form-group">
    <label class="col-md-4 control-label" for="textinput">Comment</label>
    <div class="col-md-8">
        <textarea id="requestComment" placeholder="Write your instruction here (Optional)" class="form-control input-md" maxlength="500" rows="4" spellcheck="true" style="z-index: auto; position: relative; line-height: 20px; font-size: 14px; transition: none; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);"></textarea>
    </div>
</div>