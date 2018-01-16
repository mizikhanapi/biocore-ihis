<%-- 
    Document   : verifySpecimenOrderGetSeqNo
    Created on : Jan 16, 2018, 4:20:14 AM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="main.RMIConnector"%>

<%

    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");

    // Generate Date Format
    Date date = new Date();
    LocalDateTime now = LocalDateTime.now();

    DateFormat yearFormat = new SimpleDateFormat("yyyy");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    DateTimeFormatter formatOrderTime = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");

    String yearString = yearFormat.format(date);
    String dateString = dateFormat.format(date);
    String created_date = format.format(now);
    String orderDate = formatOrderTime.format(now);

    String created_by = session.getAttribute("USER_ID").toString();

    //module name - > 
    //B = Billing
    //R = Receipt
    //I = Invoice
    boolean seqControl = false;
    String orderHead = "RST";
    String sqlSeqSelect = "SELECT hfc_cd,module_name,year_seq "
            + " FROM lis_last_seq_no "
            + " WHERE module_name = 'RST' AND hfc_cd = '" + hfc + "' ";
    ArrayList<ArrayList<String>> dataSeqSelect = conn.getData(sqlSeqSelect);

    if (dataSeqSelect.isEmpty()) {

        //Update last sequance number
        String sqlSeqCreate = " INSERT INTO lis_last_seq_no (hfc_cd, module_name, year_seq, status, created_by, created_date) "
                + " VALUES ('" + hfc + "','RST','" + dateString + "','0','" + created_by + "','" + created_date + "' ) ";

        seqControl = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlSeqCreate);

    } else {

        String dataYear = dataSeqSelect.get(0).get(2);

        String dates[] = dataYear.split("\\-");

        if (dates[0] == yearString) {
            // Do Nothing
        } else {

            //Update last sequance number
            String sqlSeqYearUpdate = " UPDATE lis_last_seq_no "
                    + " SET year_seq = '" + dateString + "' "
                    + " WHERE module_name = 'RST' AND hfc_cd = '" + hfc + "' ";

            seqControl = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlSeqYearUpdate);

        }
    }

    // Seq No
    String orderNo = orderHead + orderDate;

    out.print(orderNo);
%>