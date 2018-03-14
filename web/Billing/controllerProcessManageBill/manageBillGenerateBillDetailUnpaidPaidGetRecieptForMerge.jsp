<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidGetRecieptForMerge
    Created on : Mar 14, 2018, 4:08:46 PM
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
    String pName = request.getParameter("pName");
    String address = request.getParameter("address");
    String invoiveNo = request.getParameter("invoive");
    String grandTotalStr = request.getParameter("grandTotal");
    String itemName = request.getParameter("itemName");
    String icNo = request.getParameter("icNo");

    double grandTotal = 0;
    grandTotal = Double.parseDouble(grandTotalStr);

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
                <p style="font-weight: bold;font-size: 13pt;">Invoice No. : <%=invoiveNo%><br>Date : <%=newdate%></p>
                <hr/>
            </div>
            <br><br>
            <div> &nbsp;</div>
            <div class="center-block row" >
                <div class="col-md-12" style="font-size: 11pt; display: table-cell;padding-left: 10px;padding-right: 78px;">
                    <p><b>Name</b>          : <%=pName%></p>
                    <p><b>IC No.</b>        : <%=icNo%></p>
                    <p><b>Address</b>       : <%=address%></p>
                </div>
            </div>  
            <br><br>
            <div class="center-block" style="align-content: center;">
                <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5">
                    <thead>
                    <th style="border-bottom: 1px solid #000;border-top: 1px solid #000;">No</th>
                    <th style="border-bottom: 1px solid #000;border-top: 1px solid #000;">Description</th>
                    <th style="text-align: center;border-bottom: 1px solid #000;border-top: 1px solid #000;">Qty</th>
                    <th style="text-align: center;border-bottom: 1px solid #000;border-top: 1px solid #000;">Unit<br>Price</th>
                    <th style="text-align: center;border-bottom: 1px solid #000;border-top: 1px solid #000;">Total<br>Amount</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="text-align: center;border-bottom: 1px solid #000;width: 10%;">1</td>
                            <td style="text-align: center;border-bottom: 1px solid #000;width: 40%;"><%=itemName%></td>
                            <td style="text-align: center;border-bottom: 1px solid #000;width: 10%;">1</td>
                            <td style="text-align: center;border-bottom: 1px solid #000;width: 20%;"><%=df.format(grandTotal)%></td>
                            <td style="text-align: center;border-bottom: 1px solid #000;width: 20%;"><%=df.format(grandTotal)%></td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="2" style="text-align: right; font-weight: bold;border-bottom: 2px solid black;border-top: 2px solid black;;">Grd Ttl (RM) :</td>
                            <td colspan="1" style="text-align: center;font-weight: bold;border-bottom: 2px solid black;border-top: 2px solid black;"><%=df.format(grandTotal)%></td>
                        </tr>    

                    </tbody>
                </table>
            </div>  
            <br><br><br><br>
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
