/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JOMLOKAHelper;

import dBConn.Conn;
import main.RMIConnector;

/**
 *
 * @author Shammugam
 */
public class CustomerNotificationSender {

    private String sender;
    private String receiver;
    private String title;
    private String message;

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public CustomerNotificationSender(String sender, String receiver, String title, String message) {
        this.sender = sender;
        this.receiver = receiver;
        this.title = title;
        this.message = message;
    }

    public Boolean sendCustomerInboxNotification() {

        Boolean sql = false;

        String sqlInsert = "INSERT INTO jlk_notification "
                + " (send_time, user_id, sender_id, receiver_id, title, message, type, status, created_by, created_date)  "
                + " VALUES('now()','" + receiver + "','" + sender + "','" + receiver + "','" + title + "','" + message + "', 'inbox', '0', '" + sender + "','now()') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean sendCustomerOutboxNotification() {

        Boolean sql = false;

        String sqlInsert = "INSERT INTO jlk_notification "
                + " (send_time, user_id, sender_id, receiver_id, title, message, type, status, created_by, created_date)  "
                + " VALUES('now()','" + receiver + "','" + sender + "','" + receiver + "','" + title + "','" + message + "', 'outbox', '0', '" + sender + "','now()') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

}
