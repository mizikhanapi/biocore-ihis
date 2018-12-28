<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidGetRecieptForItem
    Created on : Nov 1, 2017, 3:43:54 PM
    Author     : Shammugam
--%>


<%@page import="dBConn.Conn"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="main.RMIConnector"%>

<%
    Conn con = new Conn();

    // Generate Decimal Format
    DecimalFormat df = new DecimalFormat("0.00");
    DecimalFormat dfQuan = new DecimalFormat("0");

    // Generate Parameter
    String billNo = request.getParameter("billNo");
    String txtDate = request.getParameter("txtDate");
    String custID = request.getParameter("custID");
    String pName = request.getParameter("pName");
    String address = request.getParameter("address");
    String icNo = request.getParameter("icNo");
    String otherID = request.getParameter("otherID");
    String phoneNo = request.getParameter("phoneNo");
    String status = request.getParameter("status");
    String recieptNo = request.getParameter("reciept");

    // Get Session Parameter
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    // Get HFC Details SQL
    String queryLogo = "SELECT logo, hfc_name, CONCAT(address1,' ',address2,' ',address3) FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);

    // Generate Date
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    DateFormat dateFormat1 = new SimpleDateFormat("MMyyyy");
    Date date = new Date();
    String date1 = dateFormat1.format(date);

    // Declare Variable
    String logoHFC = "";
    String nameHFC = "";
    String addressHFC = "";
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

    String query2 = "SELECT txn_date, item_cd, item_desc, quantity, item_amt/quantity, item_amt, bill_no, ref_order_no "
            + "FROM far_customer_dtl "
            + "WHERE bill_no = '" + billNo + "' ";
    ArrayList<ArrayList<String>> dataBill = con.getData(query2);

    double grandTotal = 0;
    double billGSTPrice = 0;
    double billServicePrice = 0;
    double billDiscountPrice = 0;
    double billRoundingPrice = 0;
    double billGivenAMTPrice = 0;
    double billChangeAMTPrice = 0;
    int grandQuantity = 0;
    double subtotal = 0;
    double amtPaid = 0;

    String query3 = "SELECT item_cd, item_desc, item_amt, quantity "
            + "FROM far_customer_dtl "
            + "WHERE bill_no = '" + billNo + "' ";
    ArrayList<ArrayList<String>> data1 = con.getData(query3);

    for (int i = 0; i < data1.size(); i++) {
        grandTotal += Double.parseDouble(data1.get(i).get(2));
        grandQuantity += Double.parseDouble(data1.get(i).get(3));
        if (data1.get(i).get(0).contains("BP") == true) {

            if (data1.get(i).get(0).contains("BP001") == true) {
                billGSTPrice = Double.parseDouble(data1.get(i).get(2));
            } else if (data1.get(i).get(0).contains("BP002") == true) {
                billServicePrice = Double.parseDouble(data1.get(i).get(2));
            } else if (data1.get(i).get(0).contains("BP003") == true) {
                billDiscountPrice = Double.parseDouble(data1.get(i).get(2));
            }

        } else {
            subtotal += Double.parseDouble(data1.get(i).get(2));

        }
    }

    billRoundingPrice = subtotal + billServicePrice + billGSTPrice - billDiscountPrice;

    String query4 = "SELECT item_amt, amt_paid, IFNULL(amt_given,'0'), IFNULL(amt_change,'0') "
            + "FROM far_customer_hdr "
            + "WHERE bill_no = '" + billNo + "'";
    ArrayList<ArrayList<String>> data2 = con.getData(query4);
    grandTotal = Double.parseDouble(data2.get(0).get(0));
    amtPaid = Double.parseDouble(data2.get(0).get(1));
    billGivenAMTPrice = Double.parseDouble(data2.get(0).get(2));
    billChangeAMTPrice = Double.parseDouble(data2.get(0).get(3));

    double outstandingBalance = grandTotal - amtPaid;

    if ((outstandingBalance != 0) && (amtPaid != 0)) {
        subtotal = outstandingBalance;
        grandTotal = outstandingBalance;
    }

    grandTotal = Math.round(grandTotal * 20) / 20.0;

%>



<div id="manageBillViewBillDetailsGenerateRecieptForPrintContainer" >
    <div style=" margin: auto; width: 90%;">
        <div class="logo-hfc asset-print-img"  style="text-align: center;">
            <img src="<%=logoHFC%>" alt="Health Facility Logo" style="width: 55%;height: 19%;">
            <p style="font-weight: bold;"><span style="font-size: 17pt;"><%=nameHFC%></span><br><span style="font-size: 13pt;"><%=addressHFC%></span></p>
        </div>
        <br><br>
        <div id="mainConainerForBillReciept">
            <div class="center-block"  style="text-align: center;">
                <hr/>
                <!--                <div class="col-md-6" style="font-size: 11pt; display: table-cell;padding-left: 20px;padding-right: 110px;">
                                    <p style="font-weight: bold;font-size: 13pt;">Receipt No. : <//%=receiptNo%></p>
                                </div>-->
                <p style="font-weight: bold;font-size: 13pt;">Receipt No. : <%=recieptNo%><br>Date : <%=newdate%></p>
                <!--                <div class="col-md-6"  style="font-size: 11pt;display: table-cell;padding-left: 110px;padding-right: 20px;">
                                    <p style="font-weight: bold;font-size: 13pt;">Date : <//%=newdate%></p>
                                </div>-->
                <hr/>
            </div>
            <br>
            <div> &nbsp;</div>
            <div class="center-block row" >
                <div class="col-md-6" style="font-size: 11pt; display: table-cell;padding-left: 10px;padding-right: 78px;">
                    <p><b>Name</b>          : <%=pName%></p>
                    <p><b>Address</b>       : <%=address%></p>
                    <p><b>Customer ID</b>   : <%=custID%></p>
                </div>
                <div class="col-md-6"  style="font-size: 11pt;display: table-cell;padding-left: 78px;padding-right: 10px;">
                    <p><b>Other ID</b>      : <%=otherID%></p>
                    <p><b>Phone No.</b>     : <%=phoneNo%></p>
                    <p><b>Bill No.</b>      : <%=billNo%></p>
                </div>
            </div>  
            <br><br>
            <div class="center-block" style="align-content: center;">
                <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5">
                    <thead>
                    <th style="border-bottom: 1px solid #000;border-top: 1px solid #000;">No</th>
                    <th style="border-bottom: 1px solid #000;border-top: 1px solid #000;">Code</th>
                    <th style="border-bottom: 1px solid #000;border-top: 1px solid #000;">Description</th>
                    <th style="text-align: center;border-bottom: 1px solid #000;border-top: 1px solid #000;">Quantity</th>
                    <th style="text-align: center;border-bottom: 1px solid #000;border-top: 1px solid #000;">Unit<br>Price</th>
                    <th style="text-align: center;border-bottom: 1px solid #000;border-top: 1px solid #000;">Total<br>Amount</th>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < dataBill.size(); i++) {
                                if (dataBill.get(i).get(1).contains("BP001") == true) {

                                } else if (dataBill.get(i).get(1).contains("BP002") == true) {

                                } else if (dataBill.get(i).get(1).contains("BP003") == true) {

                                } else {
                        %>
                        <tr>
                            <td><%=num%></td>
                            <td><%=dataBill.get(i).get(1)%></td>
                            <td><%=dataBill.get(i).get(2)%></td>
                            <td style="text-align: center;"><%=dataBill.get(i).get(3)%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dataBill.get(i).get(4)))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dataBill.get(i).get(5)))%></td>
                        </tr>
                        <%
                                    num++;

                                }
                            }
                        %>

                        <tr >
                            <td colspan="2" style="border-top: 1px solid #000;"></td>
                            <td colspan="3" style="text-align: right;font-weight: bold;border-top: 1px solid #000;">Sub-Total (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;border-top: 1px solid #000;"><%=df.format(subtotal)%></td>
                        </tr>

                        <tr>
                            <td colspan="2" ></td>
                            <td colspan="3" style="text-align: right;font-weight: bold;">Discount (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;"><%=df.format(billDiscountPrice)%></td>
                        </tr>

                        <tr>
                            <td colspan="2" ></td>
                            <td colspan="3" style="text-align: right;font-weight: bold;">Service Charge (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;"><%=df.format(billServicePrice)%></td>
                        </tr>

                        <tr>
                            <td colspan="2" ></td>
                            <td colspan="3" style="text-align: right;font-weight: bold;">GST (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;"><%=df.format(billGSTPrice)%></td>
                        </tr>

                        <tr>
                            <td colspan="2" ></td>
                            <td colspan="3" style="text-align: right;font-weight: bold;">Rounding (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;"><%=df.format(grandTotal - billRoundingPrice)%></td>
                        </tr>

                        <tr>
                            <td colspan="3" ></td>
                            <td colspan="2" style="text-align: right; font-weight: bold;border-bottom: 2px solid black;border-top: 2px solid black;">Grand Total (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;border-bottom: 2px solid black;border-top: 2px solid black;"><%=df.format(grandTotal)%></td>
                        </tr>

                        <tr>
                            <td colspan="2" ></td>
                            <td colspan="3" style="text-align: right;font-weight: bold;">Cash (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;"><%=df.format(billGivenAMTPrice)%></td>
                        </tr>

                        <tr>
                            <td colspan="2" ></td>
                            <td colspan="3" style="text-align: right;font-weight: bold;">Change (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;"><%=df.format(billChangeAMTPrice)%></td>
                        </tr>

                    </tbody>
                </table>
            </div>  
            <br><br>
            <hr/>
            <div class="center-block">
                <div style="font-size: 12pt;text-align: center;font-weight: bold;">
                    <p>***** Thank You *****</p>
                </div>
            </div>  
            <hr/>
        </div>  
    </div>
</div>
