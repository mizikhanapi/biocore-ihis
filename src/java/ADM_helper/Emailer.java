/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADM_helper;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author user
 */
public class Emailer {
    
    private String recipient;
    private String subject;
    private String message;  
    
    /**
     * Constructor for normal email
     * @param email
     * @param subject
     * @param message 
     */
    public Emailer(String email, String subject, String message){
        this.recipient = email;
        this.subject = subject;
        this.message = message;
    }
    
    public boolean sendTextEmail(){
        boolean isSent = true;
        
        String smtpHost = "smtp01.utem.edu.my"; //replace this with a valid host
        String sender = "biocore@utem.edu.my"; //replace this with a valid sender email address

        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host", smtpHost);
        properties.setProperty("mail.user", "biocore@utem.edu.my");
        properties.setProperty("mail.password", "Bano5782"); 
        //properties.setProperty("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(properties, null);
       
        try {           
            //construct the text body part
            MimeBodyPart textBodyPart = new MimeBodyPart();
            textBodyPart.setText(message);
            
            //create the sender/recipient addresses
            InternetAddress iaSender = new InternetAddress(sender);
            InternetAddress iaRecipient = new InternetAddress(recipient);

            //construct the mime message
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(iaSender);
            mimeMessage.setSubject(subject, "UTF-8");
            mimeMessage.setText(message, "UTF-8", "html");
            mimeMessage.setRecipient(Message.RecipientType.TO, iaRecipient);
                                    
            
            //send off the email
            Transport.send(mimeMessage);
             
            System.out.println("sent from " + sender + 
                    ", to " + recipient + 
                    "; server = " + smtpHost);         
        } catch(Exception ex) {
            System.out.println("Error while sending email to "+recipient+": ");
            ex.printStackTrace();
            isSent = false;
        }
        
        
        return isSent;
    }
    
    public static void main(String args[]){
        String message = "<h3>Hai!!!</h3> "
                + "<p>Click this <a href='http://localhost:8084/i-HIS.com'>link<a/> please...</p>";
        String subject = "Test link";
        String email = "b031410398@student.utem.edu.my";
        Emailer em = new Emailer(email, subject, message);
        
        String msg = em.sendTextEmail()? "Success": "Fail";
        System.out.println(msg);
    }
    
}
