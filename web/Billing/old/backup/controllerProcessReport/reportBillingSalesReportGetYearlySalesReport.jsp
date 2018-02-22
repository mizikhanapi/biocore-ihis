<%-- 
    Document   : reportBillingSalesReportGetYearlySalesReport
    Created on : Nov 29, 2017, 10:15:42 AM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%

    Conn con = new Conn();

    // Creating Format Date And Year
    DateTimeFormatter formatYear = DateTimeFormatter.ofPattern("yyyy");
    DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    LocalDateTime now = LocalDateTime.now();

    // Creating Date And Year
    String date = formatDate.format(now);
    String currentYear = formatYear.format(now);

    // Generate Decimal Format
    DecimalFormat df = new DecimalFormat("0.00");
    DecimalFormat dfQuan = new DecimalFormat("0");

    // Generate Parameter
    String day = request.getParameter("day");
    String month = request.getParameter("month");
    String year = request.getParameter("year");
    String monthString = request.getParameter("monthString");

    // Get Session Parameter
    String userId = session.getAttribute("USER_ID").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    // Get HFC Details SQL
    String queryLogo = "SELECT logo, hfc_name, CONCAT(address1,' ',address2,' ',address3) FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);

    // Declare Variable
    String logoHFC = "";
    String nameHFC = "";
    String addressHFC = "";
    String receiptNo = "";
    int num = 1;

    // Get HFC Details
    if (dataLogo.size()
            > 0) {

        if (dataLogo.get(0).get(0) != null) {

            logoHFC = dataLogo.get(0).get(0);
            nameHFC = dataLogo.get(0).get(1);
            addressHFC = dataLogo.get(0).get(2);

        }

    }

    String sql = " SELECT MONTHNAME(cd.txn_date) AS DT, cd.item_cd, cd.item_desc, SUM(cd.quantity) AS SQ, SUM(cd.item_amt) AS SA "
            + " FROM far_customer_dtl cd "
            + " LEFT JOIN far_customer_hdr ch ON (cd.bill_no = ch.bill_no)  "
            + " WHERE YEAR(cd.txn_date) = '" + year + "' AND ch.hfc_cd = '" + hfc_cd + "'   "
            + " GROUP BY cd.item_cd  "
            + " ORDER BY SQ DESC ";
    
    ArrayList<ArrayList<String>> data = con.getData(sql);

    // Total
    double grandTotalSales = 0;

%>

<div id="billingReportAccountReportGenerateReportForPrintContainer" >
    <div style=" margin: auto; width: 100%;">
        <div class="logo-hfc asset-print-img"  style="text-align: center;">
            <p style="font-weight: bold;">
                <span style="font-size: 16pt;"><%=nameHFC%></span>
                <br>
                ( <span style="font-size: 10pt;"><%=addressHFC%></span> )
            </p>
        </div>
        <br>
        <hr/>
        <div id="mainConainerForCustomerYearlyStatement">
            <div class="center-block"  style="text-align: center;">
                <h2>
                    Yearly Sales Report for <%=year%>
                </h2>
            </div>
            <br>
            <div class="center-block row" >
                <div class="col-md-3" style="font-size: 11pt; display: table-cell;padding-left: 12px;">
                    <p><b>Report Date</b></p>
                </div>
                <div class="col-md-9" style="font-size: 11pt; display: table-cell;padding-left: 15px;padding-right: 12px;">              
                    <p>:  <%=date%></p>
                </div>
            </div>  
            <br>
            <div class="center-block" style="align-content: center;">
                <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5" border="1">
                    <thead>
                        <tr>
                            <th width="10%">No.</th>
                            <th width="20%">Item Code</th>
                            <th width="50%">Item Name</th>
                            <th style="text-align: center;" width="15%">Quantity</th>
                            <th style="text-align: center;" width="15%">Total Sales</th>
                        </tr>
                    </thead>
                    <tbody> 
                        <%
                            for (int i = 0; i < data.size(); i++) {

                                String itemCode = data.get(i).get(1);
                                String itemName = data.get(i).get(2);
                                String totalQty = data.get(i).get(3);
                                double totalSales = Double.parseDouble(data.get(i).get(4));

                                grandTotalSales += totalSales;
                        %>
                        <tr>
                            <td><%=num%></td>
                            <td><%=itemCode%></td>
                            <td><%=itemName%></td>
                            <td style="text-align: center;"><%=totalQty%></td>
                            <td style="text-align: center;"><%=df.format(totalSales)%></td>
                        </tr> 

                        <%  num++;
                            }

                        %>
                        <tr>
                            <th colspan="4" style="text-align: right;">Grand Total (RM)</th>
                            <td style="text-align: center;"><%=df.format(grandTotalSales)%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <br>
            <br>
            <hr/>
            <div class="center-block">
                <div style="font-size: 12pt;text-align: center;font-weight: bold;">
                    <p>***** Thank You *****</p>
                </div>
            </div>  
        </div>  
    </div>
</div>
