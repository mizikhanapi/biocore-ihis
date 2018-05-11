/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
Ardhi Surya; rdsurya147@gmail.com; @rdcfc
 */
package POS_helper;

import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class OrderMaster {

    private String orderNo;
    private Conn conn;
    private RMIConnector rmic;

    public OrderMaster(String orderNo) {
        this.orderNo = orderNo;
        this.conn = new Conn();
        this.rmic = new RMIConnector();
    }

    public OrderMaster() {
        this.conn = new Conn();
        this.rmic = new RMIConnector();
    }

    public boolean updateOrderMasterStatus() {
        String query = "Select order_status from pos_order_detail where order_no = '" + orderNo + "' ";
        ArrayList<ArrayList<String>> data = conn.getData(query);

        int totalOrder = data.size();
        int totalCancel = 0, totalComplete = 0;

        String status = "";
        boolean proceedUpdate = true;

        if (totalOrder > 0) {

            for (int i = 0; i < totalOrder; i++) {

                if (data.get(i).get(0).equalsIgnoreCase("2")) {
                    totalComplete++;
                } else if (data.get(i).get(0).equalsIgnoreCase("3")) {
                    totalCancel++;
                }

            }

            if (totalComplete == totalOrder) {
                status = "2";
            } else if (totalCancel == totalOrder) {
                status = "3";
            } else {
                proceedUpdate = false;
            }

        } else {
            status = "3";
        }

        if (proceedUpdate) {
            String sqlUpdate = "";

            if (status.equalsIgnoreCase("2")) {
                sqlUpdate = "Update pos_order_master set order_status = '2', billing_status = '0' where order_no = '" + orderNo + "' ";
            } else if (status.equalsIgnoreCase("3")) {
                sqlUpdate = "Update pos_order_master set order_status = '3', billing_status = '3' where order_no = '" + orderNo + "' ";
            }

            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

        }
        
        return proceedUpdate;

    }

    public String[] getProcedureDetail(String leProcedure_cd, String hfc_cd) {
        String[] name_price = new String[]{"Unknown", "0.00"};// to be return; index 0: procedure name, index 1: price
        
        int procedureLength = 0;
        
        String[] procedure_cd = leProcedure_cd.split("\\.");
        
        if(!leProcedure_cd.isEmpty()){
            procedureLength = procedure_cd.length;
        }

        if (procedureLength == 1) { //level 1 procedure
            String query = "Select procedure_name, selling_price from cis_procedure where procedure_cd ='" + leProcedure_cd + "' and hfc_cd ='" + hfc_cd + "'";
            ArrayList<ArrayList<String>> dataPOS = conn.getData(query);

            if (dataPOS.size() > 0) {
                name_price[0] = dataPOS.get(0).get(0);
                name_price[1] = dataPOS.get(0).get(1);
            }

        }// end level 1
        else if (procedureLength == 2) { //level 2 procedure
            //                              0               1                       2
            String query = "select cp.PROCEDURE_NAME, cp1.PROCEDURE_1_NAME, cp.selling_price "
                    + "from cis_procedure cp "
                    + "left join cis_procedure_1 cp1 on cp1.`PROCEDURE_CD` = cp.`PROCEDURE_CD` and cp1.hfc_cd = cp.hfc_cd "
                    + "where cp.hfc_cd ='" + hfc_cd + "' and cp1.`PROCEDURE_1_CD` ='" + leProcedure_cd + "';";

            ArrayList<ArrayList<String>> dataPOS = conn.getData(query);

            if (dataPOS.size() > 0) {
                name_price[0] = dataPOS.get(0).get(0) + "-" + dataPOS.get(0).get(1);
                name_price[1] = dataPOS.get(0).get(2);
            }

        }// edn level 2
        else if (procedureLength == 3) {// level 3 procedure
            //                              0                       1                   2                   3
            String query = "select cp.`PROCEDURE_NAME`, cp1.`PROCEDURE_1_NAME`, cp2.`PROCEDURE_2_NAME`, cp.selling_price "
                    + "from cis_procedure cp "
                    + "left join cis_procedure_1 cp1 on cp1.`PROCEDURE_CD` = cp.`PROCEDURE_CD` and cp1.hfc_cd = cp.hfc_cd "
                    + "left join cis_procedure_2 cp2 on cp2.`PROCEDURE_1_CD` = cp1.`PROCEDURE_1_CD` and cp2.hfc_cd = cp1.hfc_cd "
                    + "where cp.hfc_cd = '" + hfc_cd + "' and cp2.`PROCEDURE_2_CD` = '" + leProcedure_cd + "';";

            ArrayList<ArrayList<String>> dataPOS = conn.getData(query);

            if (dataPOS.size() > 0) {
                name_price[0] = dataPOS.get(0).get(0) + "-" + dataPOS.get(0).get(1) + "-" + dataPOS.get(0).get(2);
                name_price[1] = dataPOS.get(0).get(3);
            }
        } else {
            name_price[0] = "Unknown";
            name_price[1] = "0.00";
        }

        return name_price;
    }

}
