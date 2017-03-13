<%@page import="dbConn1.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    
    String Order_no = ("LIS0043");
    String PMI_no = ("023238738");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String query3 = "SELECT lim.item_name,lim.spe_source,lim.volume FROM lis_item_detail lim WHERE lim.pmi_no='"+PMI_no+"' AND lim.order_no = '"+Order_no+"'";
    ArrayList<ArrayList<String>> q3 = conn.getData(query3);
    //boolean isInsert = rmic.setQuerySQL(connect.HOST, connect.PORT, query4);
    if (q3.size() > 0) 
    {
        for (int i = 0; i < q3.size(); i++) 
        {
            
                    q3.get(i).get(0);
        }
    }
                                                
                                            

%>